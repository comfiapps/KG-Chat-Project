package kg.itbank.chat.service;

import kg.itbank.chat.dto.FeaturedDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.exception.GlobalExceptionHandler;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.repository.RoomRepository;
import kg.itbank.chat.repository.UserRepository;
import kg.itbank.chat.repository.VoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static kg.itbank.chat.ChatApplication.DEBATE_TIME;

@Service
public class RoomService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private VoteRepository voteRepository;

    @Transactional(readOnly = true)
    private List<RoomInfoDto> convertRoomToPublic(List<Room> raw) {
        List<RoomInfoDto> result = new ArrayList<>();

        for(Room room : raw) {
            RoomInfoDto roomInfoDto = defaultInfo(room.getId());
            roomInfoDto.setRoomId(room.getId());
            roomInfoDto.setCountOwnerVote(voteRepository.countByIdRoomIdAndIdUserId(room.getId(), room.getOwner().getId()));
            roomInfoDto.setCountOpponentVote(voteRepository.countByIdRoomIdAndVoteToId(room.getId(), room.getOpponentId()));
            result.add(roomInfoDto);
        }

        return result;
    }

    @Transactional(readOnly = true)
    public List<?> listRoomByUserId(long userId) {
        List<Room> raw = roomRepository.findAllByOwnerIdOrOpponentIdOrderByCreateDateDesc(userId, userId);
        return convertRoomToPublic(raw);
    }

    @Transactional(readOnly = true)
    public List<?> listFeaturedRoom() {
        List<FeaturedDto> featuredList = new ArrayList<>();

        List<String> categories = roomRepository.listCategories();

        for(String category : categories) {
            List<Room> getItems = roomRepository.findTop8ByCategory(category);

            featuredList.add(FeaturedDto.builder()
                    .category(category)
                    .rooms(convertRoomToPublic(getItems))
                    .build());
        }

        return featuredList;
    }

    @Transactional(readOnly = true)
    public long isUserOnDebate(long userId) {
        Room room = roomRepository.findFirstByOwnerIdOrOpponentIdAndCloseDateIsNotNullAndEndTimeIsGreaterThan(userId, userId,
                new Timestamp(System.currentTimeMillis()));
        if(room == null) return -1;
        return room.getId();
    }

    @Transactional(readOnly = true)
    public Room getRoom(long id) {
        // TODO privacy
        return roomRepository.findById(id).orElseThrow(()
                -> new IllegalArgumentException("Room not found - Id : " + id));
    }

    @Transactional(readOnly = true)
    public boolean roomExists(long id) {
        return roomRepository.existsById(id);
    }

    @Transactional(readOnly = true)
    public List<?> searchRoom(String keyword) {
        List<Room> raw = roomRepository.findByNameIsContainingOrCategoryContainingOrOwnerNameContaining(keyword, keyword, keyword);
        return convertRoomToPublic(raw);
    }

    @Transactional
    public long create(Room room, long userId) {
        if(isUserOnDebate(userId) != -1) return -1;

        Room model = new Room();
        model.setName(room.getName());
        model.setCategory(room.getCategory());
        model.setOwner(userRepository.findById(userId).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Id : " + userId)));
        roomRepository.save(model);

        return model.getId();
    }

    @Transactional(readOnly = true)
    public RoomInfoDto defaultInfo(long roomId) {
        Room room = getRoom(roomId);
        User opponent = room.getOpponentId() != 0 ?
                userRepository.findById(room.getOpponentId()).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Id : " + room.getOpponentId()))
                : null;

        return RoomInfoDto.builder()
                .owner(User.builder()
                        .id(room.getOwner().getId())
                        .name(room.getOwner().getName())
                        .image(room.getOwner().getImage())
                        .build())
                .opponent(opponent != null ? User.builder()
                                .id(opponent.getId())
                                .name(opponent.getName())
                                .image(opponent.getImage())
                                .build() : null)
                .roomName(room.getName())
                .roomCategory(room.getCategory())
                .createDate(room.getCreateDate())
                .endDebate(room.getEndTime())
                .build();
    }

    @Transactional
    public int becomeDebater(long roomId, long userId) {
        if(isUserOnDebate(userId) != -1) throw new IllegalArgumentException("Debate ongoing");

        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new IllegalArgumentException("Room not found - Id : " + roomId));
        if (room.getOwner().getId() != userId && room.getOpponentId() == 0) {
            room.setOpponentId(userId);
            return 1;
        } return 2;
    }

    @Transactional
    public void startDebate(long roomId, long userId) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis() +
                TimeUnit.MINUTES.toMillis(DEBATE_TIME) + TimeUnit.SECONDS.toSeconds(10));

        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setEndTime(timestamp);
    }

    @Transactional
    public Timestamp getEndDebate(long roomId, long userId){
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        else if(room.getEndTime() == null) throw new NullPointerException("Do not have Endtime");
        return room.getEndTime();
    }


    @Transactional
    public void endDebate(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setEndTime(null);
    }

    @Transactional
    public void close(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setCloseDate(new Timestamp(System.currentTimeMillis()));
    }

}
