package kg.itbank.chat.repository;

import kg.itbank.chat.model.Code;
import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.embbedId.ParticipantId;
import kg.itbank.chat.model.enums.CodeType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CodeRepository extends JpaRepository<Code, Long> {
    Code findByIdUserIdAndIdType(long id, CodeType codeType);
    Code findByIdUserIdAndIdTypeAndEmailEqualsAndCodeEqualsAndUsedIsFalse(long id, CodeType codeType, String email, int code);
    Code findByIdUserEmailAndIdTypeAndCodeEqualsAndUsedIsFalse(String email, CodeType codeType, int code);
}
