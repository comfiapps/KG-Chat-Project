package kg.itbank.chat.repository;

import kg.itbank.chat.model.Chat;
import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.embbedId.ParticipantId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChatRepository extends JpaRepository<Chat, Long> {

    @Query(value = "select Chat.id, userId, name, content, createDate from Chat inner join User where roomId = ?1 order by createDate", nativeQuery = true)
    List<Chat> findPastChatByRoomId(long roomId);
    List<Chat> findAllByRoomIdOrderByCreateDate(long roomId);
}
