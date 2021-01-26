package kg.itbank.chat.repository;

import kg.itbank.chat.model.Code;
import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.embbedId.ParticipantId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CodeRepository extends JpaRepository<Code, Long> {
    Code findByIdUserId(long id);
    Code findByIdUserIdAndEmailEqualsAndCodeEquals(long id, String email, int code); //TODO include expire date
}
