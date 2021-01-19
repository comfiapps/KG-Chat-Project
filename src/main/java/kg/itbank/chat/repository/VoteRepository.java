package kg.itbank.chat.repository;

import kg.itbank.chat.model.User;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.model.embbedId.VoteId;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VoteRepository extends JpaRepository<Vote, VoteId> {
    Vote findByIdRoomIdAndIdUserId(long roomId, long userId);
    void deleteByIdRoomIdAndIdUserId(long roomId, long userId);
    long countByIdRoomIdAndIdUserId(long roomId, long ownerId);
    long countByIdRoomIdAndVoteToId(long roomId, long opponentId);
}
