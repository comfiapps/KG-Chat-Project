package kg.itbank.chat.service;

import kg.itbank.chat.model.Participant;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.model.embbedId.ParticipantId;
import kg.itbank.chat.model.embbedId.RoomLookup;
import kg.itbank.chat.model.embbedId.VoteId;
import kg.itbank.chat.repository.ParticipantRepository;
import kg.itbank.chat.repository.RoomRepository;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ParticipantService {

    @Autowired
    private ParticipantRepository participantRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoomRepository roomRepository;


    @Transactional(readOnly = true)
    public long countCumulativeParticipants(long roomId) {
        return participantRepository.countByIdRoomId(roomId);
    }

    @Transactional(readOnly = true)
    public  Map<Long, Long> getRoomLoopupList(){
        List list = participantRepository.findRoomLookup();
        Map<Long, Long> map = new HashMap<>();
        for(int i = 0 ; i<list.size() ; i++){
            RoomLookup roomLookup = (RoomLookup)list.get(i);
            map.put(roomLookup.getRoomId(), roomLookup.getCount());
        }
        return map;
    }

    @Transactional
    public void join(long roomId, long userId) {
        Participant participant = participantRepository.findByIdRoomIdAndIdUserId(roomId, userId);
        if(participant == null) {
            participantRepository.save(
                    Participant.builder()
                            .id(ParticipantId.builder()
                                    .room(roomRepository.findById(roomId).orElseThrow(()
                                            -> new IllegalArgumentException("Room not found - Id : " + roomId)))
                                    .user(userRepository.findById(userId).orElseThrow(()
                                            -> new UsernameNotFoundException("User Not Found - Id : " + userId)))
                                    .build())
                            .build());
        } else participant.setExitDate(null);
    }

    @Transactional
    public void leave(long roomId, long userId) {
        Participant participant = participantRepository.findByIdRoomIdAndIdUserId(roomId, userId);
        if(participant != null) participant.setExitDate(new Timestamp(System.currentTimeMillis()));
    }

}
