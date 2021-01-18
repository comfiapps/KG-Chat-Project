package kg.itbank.chat.service;

import kg.itbank.chat.dto.FeaturedDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.repository.RoomRepository;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
public class RoomService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Transactional(readOnly = true)
    public List<?> listRoomByUserId(long userId) {
        return roomRepository.findAllByOwnerId(userId);
    }

    @Transactional(readOnly = true)
    public List<?> listFeaturedRoom() {
        List<FeaturedDto> featuredList = new ArrayList<>();

        List<String> categories = roomRepository.listCategories();

        for(String category : categories) {
            List<Room> getItems = roomRepository.findTop8ByCategory(category);

            List<RoomInfoDto> roomInfoDtos = new ArrayList<>();
            for(Room room : getItems) {
                RoomInfoDto roomInfoDto = defaultInfo(room.getId());
                roomInfoDto.setRoomId(room.getId());
                roomInfoDtos.add(roomInfoDto);
            }

            featuredList.add(FeaturedDto.builder()
                    .category(category)
                    .rooms(roomInfoDtos)
                    .build());
        }

        return featuredList;
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
        List<RoomInfoDto> result = new ArrayList<>();

        for(Room room : raw) {
            RoomInfoDto roomInfoDto = defaultInfo(room.getId());
            roomInfoDto.setRoomId(room.getId());
            result.add(roomInfoDto);
        }

        return result;
    }

    @Transactional
    public long create(Room room, long userId) {
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
                .startDebate(room.getStartTime())
                .build();
    }

    @Transactional
    public void becomeDebater(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new IllegalArgumentException("Room not found - Id : " + roomId));
        if (room.getOwner().getId() != userId && room.getOpponentId() == 0) room.setOpponentId(userId);
    }

    @Transactional
    public void startDebate(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setStartTime(new Timestamp(System.currentTimeMillis()));
    }

    @Transactional
    public void endDebate(long roomId, long userId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new EntityNotFoundException("Room not found - Id : " + roomId));
        if(room.getOwner().getId() != userId) throw new AccessDeniedException("Permission Denied");
        room.setStartTime(null);
    }


}
