package kg.itbank.chat.controller;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ChatDto;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.service.ChatService;
import kg.itbank.chat.service.ParticipantService;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.VoteService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.security.Principal;
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

	@MessageMapping("/chat/enter")
	public void enter(StompHeaderAccessor stompHeaderAccessor){

		HashMap<String, Object> sendMap = (HashMap<String, Object>) stompHeaderAccessor.getSessionAttributes().get("chatUser");
		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();

		long chatId = (long)sendMap.get("chatId");
		long userId = principalDetail.getId();

		Room room = roomService.getRoom(chatId);

		ChatDto msg = new ChatDto();

		msg.setChatId(chatId);
		msg.setSender(principalDetail.getUsername());
		msg.setSenderId(userId);
		msg.setSenderType((String) sendMap.get("senderType"));
		msg.setMessage(principalDetail.getUser().getImage());


		if(msg.getSenderType().equals("opponent") && room.getEndTime() != null && room.getEndTime().before(new Date())){
			msg.setSenderType("watcher");
		}

		simpMessagingTemplate.convertAndSend("/topic/enter/"+chatId, msg);
		participantService.join(chatId, userId);

	}

	@MessageMapping("/chat/info")
	public void info(ChatDto message, StompHeaderAccessor stompHeaderAccessor){
		log.info("info 받은 메시지: {}", message);

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		HashMap<String, Object> userMap = (HashMap<String, Object>) stompHeaderAccessor.getSessionAttributes().get("chatUser");

		long chatId = (long)(userMap.get("chatId"));
		RoomInfoDto room = roomService.defaultInfo(chatId);

		try {
			if(room.getOwner().getId() != principalDetail.getId() && room.getOpponent().getId() != principalDetail.getId()) throw new AccessDeniedException("");


			if(message.getMessage().equals("startDiscuss")) {
				simpMessagingTemplate.convertAndSend("/topic/info/"+chatId, new ResponseDto(HttpStatus.OK.value(), roomService.startDebate(room.getRoomId(), principalDetail.getId())));
			}else if(message.getMessage().equals("endDiscuss")){

			}else if(message.getMessage().equals("leaveDiscuss")){

			}

		}catch (EntityNotFoundException | AccessDeniedException d){
			simpMessagingTemplate.convertAndSend("/topic/info/"+chatId, new ResponseDto(HttpStatus.BAD_REQUEST.value(), "fail"));
		}

		log.info("진입 테스트 {} ", principalDetail.getUser().getImage());
	}

	@MessageMapping("/chat/msg")
	public void sendMsg(ChatDto message, StompHeaderAccessor stompHeaderAccessor) {

		log.info("msg 받은 메시지 {}" , message);
		log.info("stompHeader: {}", stompHeaderAccessor);

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		long chatId = (long)(((HashMap<String, Object>) stompHeaderAccessor.getSessionAttributes().get("chatUser")).get("chatId"));

		Room room = roomService.getRoom(chatId);

		log.info("room: {}", room);

		if(room.getEndTime().after(new Date())){
			log.info("메시지 전송");

			long userId = principalDetail.getId();
			message.setSender(principalDetail.getUsername());

			if(room.getOwner().getId() == userId || room.getOpponentId() == userId){
				if(room.getOpponentId() == userId){
					message.setSenderType("opponent");
				}else{
					message.setSenderType("owner");
				}
			}else{
				message.setSenderType("watcher");
			}

			if(message.getMessageType().equals("text")){
				chatService.insert(chatId, userId, (String)message.getMessage());
			}

			simpMessagingTemplate.convertAndSend("/topic/msg/"+chatId, message);


		}else{
			log.info("종료된 토론방");

			ChatDto msg =  new ChatDto();

			msg.setChatId(chatId);
			msg.setSenderType("owner");
			msg.setMessageType("end");

			simpMessagingTemplate.convertAndSend("topic/info/"+chatId, msg);
		}
	}
}
