package kg.itbank.chat.service;

import kg.itbank.chat.dto.CountVoteDto;
import kg.itbank.chat.dto.FeaturedDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.exception.GlobalExceptionHandler;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.repository.ParticipantRepository;
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

    @Autowired
    private ParticipantRepository participantRepository;

    @Transactional(readOnly = true)
    private List<RoomInfoDto> convertRoomToPublic(List<Room> raw) {
        List<RoomInfoDto> result = new ArrayList<>();

        for(Room room : raw) {
            RoomInfoDto roomInfoDto = defaultInfo(room.getId());
            roomInfoDto.setRoomId(room.getId());
            roomInfoDto.setCountOwnerVote(voteRepository.countByIdRoomIdAndVoteToId(room.getId(), room.getOwner().getId()));
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
    public List<?> listFeaturedRoom(String categorize) {
        if(categorize == null) categorize = "";
        List<FeaturedDto> featuredList = new ArrayList<>();
        List<String> categories;

        switch (categorize) {
            case "w":
                categories = roomRepository.listWaitCategories();

                for(String category : categories) {
                    List<Room> getItems = roomRepository.findTop8ByCategoryAndOpponentId(category, 0);
                    featuredList.add(FeaturedDto.builder()
                            .category(category)
                            .rooms(convertRoomToPublic(getItems))
                            .build());
                }

                break;

            case "d":
                categories = roomRepository.listDoneCategories();

                for(String category : categories) {
                    List<Room> getItems = roomRepository.findTop8DoneByCategory(category);
                    featuredList.add(FeaturedDto.builder()
                            .category(category)
                            .rooms(convertRoomToPublic(getItems))
                            .build());
                }

                break;

            default:
                categories = roomRepository.listOnGoingCategories();

                for(String category : categories) {
                    List<Room> getItems = roomRepository.findTop8OnGoingByCategory(category);
                    featuredList.add(FeaturedDto.builder()
                            .category(category)
                            .rooms(convertRoomToPublic(getItems))
                            .build());
                }
        }

        return featuredList;
    }

    @Transactional(readOnly = true)
    public long isUserOnDebate(long userId) {
        Room room = roomRepository.findDebatingRoom(userId);
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
                .roomId(roomId)
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
                .closeDate(room.getCloseDate())
                .endDebate(room.getEndTime())
                .countOwnerVote(voteRepository.countByIdRoomIdAndVoteToId(roomId, room.getOwner().getId()))
                .countOpponentVote(voteRepository.countByIdRoomIdAndVoteToId(roomId, room.getOpponentId()))
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
    public Timestamp startDebate(long roomId, long userId) {
        Timestamp timestamp = new Timestamp(System.currentTimeMillis() +
                TimeUnit.MINUTES.toMillis(DEBATE_TIME) + TimeUnit.SECONDS.toSeconds(10));
//        Timestamp timestamp = new Timestamp(System.currentTimeMillis() + TimeUnit.SECONDS.toSeconds(20));
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setEndTime(timestamp);

        return room.getEndTime();
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
    public void resetDebate(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setEndTime(null);
    }

    @Transactional
    public Timestamp close(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId && room.getOpponentId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setCloseDate(new Timestamp(System.currentTimeMillis()));
        return room.getCloseDate();
    }

    @Transactional
    public int leave(long roomId, long userId, RoomInfoDto roomInfoDto) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        // 토론 시작전 opponet라면 방 초기화 및 opponet정보 삭제
        if(room.getEndTime() == null && room.getOpponentId() == userId){
            room.setOpponentId(0);
            room.setEndTime(null);
            roomInfoDto.setOpponent(null);
            roomInfoDto.setEndDebate(room.getEndTime());
            return 3;
        }
        // 토론시작 전 owner라면 방 정보 삭제
        else if(room.getEndTime() == null && room.getOwner().getId() == userId){
            participantRepository.delete(roomId);
            roomRepository.deleteRoom(roomId, userId);
            return 4;
        }
        // 토론 시작 후라면 토론 종료
        else if(room.getOwner().getId() == userId || room.getOpponentId() == userId){
            room.setCloseDate(new Timestamp(System.currentTimeMillis()));
            roomInfoDto.setCloseDate(room.getCloseDate());
            return 2;
        }

        // 해당 안되면 fail
        return 5;
    }

}
