package kg.itbank.chat.controller;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ChatMsgDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.service.ChatService;
import kg.itbank.chat.service.ParticipantService;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.VoteService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class ChatController {

	private static final Logger log = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	private VoteService voteService;

	@Autowired
	private ParticipantService participantService;

	@Autowired
	private RoomService roomService;

	@Autowired
	private ChatService chatService;

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;

	//enter를 통해 discusser인지 watcher판단하여 discusser 입장시
	//SimpMessageHeaderAccessor headerAccessor, @Header("destination") String destination 주입 가능한 매개변수


	@SubscribeMapping
	public void test(){

	}

	@MessageMapping("/chat/enter")
	public void enter(StompHeaderAccessor stompHeaderAccessor, SimpMessageHeaderAccessor sha){

		HashMap<String, Object> sendMap = (HashMap<String, Object>) stompHeaderAccessor.getSessionAttributes().get("chatUser");
		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();

		long chatId = (long)sendMap.get("chatId");
		long userId = principalDetail.getId();

		RoomInfoDto room = roomService.defaultInfo(chatId);
		if(room.getOpponent().getId() == userId){
			simpMessagingTemplate.convertAndSend("/topic/enter/"+chatId, room);
		}

		participantService.join(chatId, userId);
	}

	@MessageMapping("/chat/info")
	public void info(ChatMsgDto message, StompHeaderAccessor stompHeaderAccessor, SimpMessageHeaderAccessor sha){

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		HashMap<String, Object> userMap = (HashMap<String, Object>) stompHeaderAccessor.getSessionAttributes().get("chatUser");

		long chatId = (long)(userMap.get("chatId"));

		ChatMsgDto msg = ChatMsgDto.builder()
				.chatId(chatId)
				.sender(principalDetail.getUser().getName())
				.senderId(principalDetail.getId())
				.senderType((String)userMap.get("senderType"))
				.messageType(message.getMessageType())
				.message(message.getMessage())
				.build();

		if(	msg.getSenderType().equals("owner") ||
			msg.getSenderType().equals("opponent") ||
			msg.getMessageType().equals("vote")) {

			simpMessagingTemplate.convertAndSend("/topic/info/"+chatId, msg);
		}
	}


	@MessageMapping("/chat/msg")
	public void sendMsg(ChatMsgDto message, StompHeaderAccessor stompHeaderAccessor, SimpMessageHeaderAccessor sha) {
		log.info("msg 받은 메시지 {}" , message);
		log.info("stompHeader: {}", stompHeaderAccessor);

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		HashMap userMap = ((HashMap<String, Object>) stompHeaderAccessor.getSessionAttributes().get("chatUser"));

		long chatId = (long)(userMap.get("chatId"));
		RoomInfoDto room = roomService.defaultInfo(chatId);

		log.info("room: {}", room);

		if(room.getCloseDate() == null && message.getMessageType().equals("text")){

			ChatMsgDto msg = ChatMsgDto.builder()
					.chatId(chatId)
					.sender(principalDetail.getUser().getName())
					.senderId(principalDetail.getId())
					.senderType((String)userMap.get("senderType"))
					.messageType(message.getMessageType())
					.message(message.getMessage())
					.build();

			log.info("메시지 전송: {}", msg);

			chatService.insert(chatId, principalDetail.getId(), (String)message.getMessage());
			simpMessagingTemplate.convertAndSend("/topic/msg/"+chatId, msg);
		}
	}
}
