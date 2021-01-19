package kg.itbank.chat.repository;

import kg.itbank.chat.model.User;
import kg.itbank.chat.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface VoteRepository extends JpaRepository<Vote, Long> {
    Vote findByRoomIdAndUserId(long roomId, long userId);
    void deleteByRoomIdAndUserId(long roomId, long userId);
    long countByRoomIdAndUserId(long roomId, long ownerId);
    long countByRoomIdAndVoteToId(long roomId, long opponentId);
}
