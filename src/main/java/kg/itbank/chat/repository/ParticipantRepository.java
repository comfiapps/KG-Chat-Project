package kg.itbank.chat.repository;

import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.model.embbedId.ParticipantId;
import kg.itbank.chat.model.embbedId.RoomLookup;
import kg.itbank.chat.model.embbedId.VoteId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface ParticipantRepository extends JpaRepository<Participant, ParticipantId> {
    Participant findByIdRoomIdAndIdUserId(long roomId, long userId);
    long countByIdRoomId(long roomId);

    @Transactional(readOnly = true)
    @Query(value = "select roomId as roomId, count(userId) as count from Participant group by roomId", nativeQuery = true)
    List<RoomLookup> findRoomLookup();


    @Query(value = "delete from Participant where roomId = ?1", nativeQuery = true)
    @Modifying
    int delete(long roomId);

}
