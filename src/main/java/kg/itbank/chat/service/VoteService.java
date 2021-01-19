package kg.itbank.chat.service;

import kg.itbank.chat.dto.CountVoteDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.repository.RoomRepository;
import kg.itbank.chat.repository.UserRepository;
import kg.itbank.chat.repository.VoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VoteService {

    @Autowired
    private VoteRepository voteRepository;

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void voteTo(long myId, long roomId, long userId) {
        Vote vote = voteRepository.findByRoomIdAndUserId(roomId, myId);
        if(vote == null) {
            voteRepository.save(
                    Vote.builder()
                            .room(roomRepository.findById(roomId).orElseThrow(()
                                    -> new IllegalArgumentException("Room not found - Id : " + roomId)))
                            .user(userRepository.findById(myId).orElseThrow(()
                                    -> new UsernameNotFoundException("User Not Found - Id : " + myId)))
                            .voteTo(userRepository.findById(userId).orElseThrow(()
                                    -> new UsernameNotFoundException("User Not Found - Id : " + userId)))
                            .build());
        } else {
            vote.setVoteTo(userRepository.findById(userId).orElseThrow(()
                    -> new UsernameNotFoundException("User Not Found - Id : " + userId)));
        }
    }

    @Transactional
    public void unvote(long myId, long roomId) {
        voteRepository.deleteByRoomIdAndUserId(roomId, myId);
    }

    @Transactional(readOnly = true)
    public CountVoteDto voteCount(long roomId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new IllegalArgumentException("Room not found - Id : " + roomId));

        return CountVoteDto.builder()
                .ownerVote(voteRepository.countByRoomIdAndUserId(roomId, room.getOwner().getId()))
                .opponentVote(voteRepository.countByRoomIdAndVoteToId(roomId, room.getOpponentId()))
                .build();
    }

}
