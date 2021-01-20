package kg.itbank.chat.repository;

import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.model.embbedId.ParticipantId;
import kg.itbank.chat.model.embbedId.VoteId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ParticipantRepository extends JpaRepository<Participant, ParticipantId> {
    Participant findByIdRoomIdAndIdUserId(long roomId, long userId);
    long countByIdRoomId(long roomId);
}
