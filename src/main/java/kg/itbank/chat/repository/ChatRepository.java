package kg.itbank.chat.repository;

import kg.itbank.chat.model.Chat;
import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.embbedId.ParticipantId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ChatRepository extends JpaRepository<Chat, Long> {

    @Query(value = "select d.id as id, content, d.createDate, roomId, userId from (select * from Chat where roomId = :roomId) d inner join User u on d.userId = u.id order by createDate", nativeQuery = true)
    List<Chat> findPastChatByRoomId(@Param("roomId") long roomId);
    List<Chat> findAllByRoomIdOrderByCreateDate(long roomId);
}
