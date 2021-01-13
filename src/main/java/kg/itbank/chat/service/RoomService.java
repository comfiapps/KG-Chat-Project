package kg.itbank.chat.service;

import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.repository.RoomRepository;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.PermissionDeniedDataAccessException;
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
    public List<Room> listRoomByUserId(long userId) {
        return roomRepository.findAllByOwnerId(userId);
    }

    @Transactional(readOnly = true)
    public List<Room> listFeaturedRoom() {
        // TODO listFeaturedRoom
        return new ArrayList<>();
    }

    @Transactional(readOnly = true)
    public Room getRoom(long id) {
        return roomRepository.findById(id).orElseThrow(()
                -> new IllegalArgumentException("Room not found - Id : " + id));
    }

    @Transactional(readOnly = true)
    public List<Room> searchRoom(String keyword) {
        // TODO searchRoom
        return new ArrayList<>();
    }

    @Transactional
    public Room create(Room room, long userId) {
        Room model = new Room();
        model.setName(room.getName());
        model.setCategory(room.getCategory());
        model.setOwner(userRepository.findById(userId).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Id : " + userId)));
        roomRepository.save(model);
        return model;
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
