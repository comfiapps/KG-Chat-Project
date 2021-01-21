package kg.itbank.chat.service;

import kg.itbank.chat.model.Chat;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.repository.ChatRepository;
import kg.itbank.chat.repository.ParticipantRepository;
import kg.itbank.chat.repository.RoomRepository;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ChatService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ChatRepository chatRepository;

    @Transactional(readOnly = true)
    public List<?> listChatByRoom(long roomId) {
        return chatRepository.findPastChatByRoomId(roomId);
    }

    @Transactional
    public void insert(long roomId, long userId, String content) {
        chatRepository.save(Chat.builder()
                .roomId(roomId)
                .user(userRepository.findById(userId).orElseThrow(()
                        -> new UsernameNotFoundException("User Not Found - KakaoId : " + userId)))
                .content(content)
                .build());
    }
}
