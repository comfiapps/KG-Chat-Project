package kg.itbank.chat.repository;

import kg.itbank.chat.model.Chat;
import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.embbedId.ParticipantId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ChatRepository extends JpaRepository<Chat, Long> {
    List<Chat> findAllByRoomIdAndCreateDateIsNotNullOrderByCreateDate(long roomId);
}
