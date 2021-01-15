package kg.itbank.chat.repository;

import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RoomRepository extends JpaRepository<Room, Long> {
    List<Room> findAllByOwnerId(long id);
    boolean existsById(long id);
}
