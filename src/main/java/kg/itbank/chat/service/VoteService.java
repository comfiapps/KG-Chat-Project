package kg.itbank.chat.service;

import kg.itbank.chat.dto.CountVoteDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.model.embbedId.VoteId;
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

    @Transactional(readOnly = true)
    public Vote getVote(long myId, long roomId){
        return voteRepository.findByIdRoomIdAndIdUserId(roomId, myId);
    }

    @Transactional
    public long voteTo(long myId, long roomId, long userId) {
        Vote vote = voteRepository.findByIdRoomIdAndIdUserId(roomId, myId);
        if(vote == null) {
            voteRepository.save(
                    Vote.builder()
                            .id(VoteId.builder()
                                    .roomId(roomId)
                                    .userId(myId)
                                    .build())
                            .voteToId(userId)
                            .build());
        }else if(vote.getVoteToId() == userId){
            voteRepository.deleteByIdRoomIdAndIdUserId(roomId, myId);
            return -userId;
        }else{
          vote.setVoteToId(userId);
        }
        return userId;

    }

    @Transactional
    public void unvote(long myId, long roomId) {
        voteRepository.deleteByIdRoomIdAndIdUserId(roomId, myId);
    }

    @Transactional(readOnly = true)
    public CountVoteDto voteCount(long roomId) {
        Room room = roomRepository.findById(roomId).orElseThrow(()
                -> new IllegalArgumentException("Room not found - Id : " + roomId));

        return CountVoteDto.builder()
                .ownerVote(voteRepository.countByIdRoomIdAndVoteToId(roomId, room.getOwner().getId()))
                .opponentVote(voteRepository.countByIdRoomIdAndVoteToId(roomId, room.getOpponentId()))
                .build();
    }

}
