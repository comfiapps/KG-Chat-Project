package kg.itbank.chat.controller;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ChatInfoDto;
import kg.itbank.chat.dto.ChatMsgDto;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.Chat;
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
import org.springframework.http.HttpStatus;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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


//	@SubscribeMapping
//	public void test(){
//
//	}

	@MessageMapping("/chat/getVoteCount")
	public void voteCount(StompHeaderAccessor stompHeaderAccessor){
		long roomId = (long) stompHeaderAccessor.getSessionAttributes().get("roomId");
		simpMessagingTemplate.convertAndSend("/topic/getVoteCount/"+ roomId, new ResponseDto<>(HttpStatus.OK.value(), voteService.voteCount(roomId)));
	}

	@MessageMapping("/chat/vote")
	public void vote(long voteUserId, StompHeaderAccessor stompHeaderAccessor){
		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		long roomId = (long) stompHeaderAccessor.getSessionAttributes().get("roomId");
		log.info("voteUserId: {}", voteUserId);
		RoomInfoDto room = roomService.defaultInfo(roomId);

		if(room.getEndDebate() != null){
			simpMessagingTemplate.convertAndSendToUser(principalDetail.getUsername(), "/queue/vote/"+roomId, new ResponseDto<>(HttpStatus.OK.value(),voteService.voteTo(principalDetail.getId(), roomId, voteUserId)));
			simpMessagingTemplate.convertAndSend("/topic/getVoteCount/"+ roomId, new ResponseDto<>(HttpStatus.OK.value(), voteService.voteCount(roomId)));
		}else{
			simpMessagingTemplate.convertAndSendToUser(principalDetail.getUsername(), "/queue/vote/"+roomId, new ResponseDto<>(HttpStatus.BAD_REQUEST.value(), "Request Fail"));
		}
	}


	@Transactional
	@MessageMapping("/chat/getChat")
	public void getChatting(StompHeaderAccessor stompHeaderAccessor){
		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		long roomId = (long) stompHeaderAccessor.getSessionAttributes().get("roomId");
		simpMessagingTemplate.convertAndSendToUser(principalDetail.getUsername(),"/queue/list/"+roomId, new ResponseDto<>(HttpStatus.OK.value(), chatService.listChatByRoom(roomId)));
	}


	@MessageMapping("/chat/enter")
	public void enter(StompHeaderAccessor stompHeaderAccessor, SimpMessageHeaderAccessor sha){

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();

		long roomId = (long) stompHeaderAccessor.getSessionAttributes().get("roomId");

		long userId = principalDetail.getId();

		RoomInfoDto room = roomService.defaultInfo(roomId);
		if(room.getOpponent().getId() == userId){
			simpMessagingTemplate.convertAndSend("/topic/enter/"+roomId, room);
		}

		participantService.join(roomId, userId);
	}

	@MessageMapping("/chat/info")
	public void info(ChatInfoDto msg, StompHeaderAccessor stompHeaderAccessor, SimpMessageHeaderAccessor sha){

		log.info("받은 메시지: {}", msg);

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();
		long roomId = (long) stompHeaderAccessor.getSessionAttributes().get("roomId");

		RoomInfoDto room = roomService.defaultInfo(roomId);

		try {
			if(room.getOwner().getId() != principalDetail.getId() && room.getOpponent().getId() != principalDetail.getId()) throw new AccessDeniedException("");

			if(msg.getType() == 1) {
				log.info("토론 시작 요청");
				room.setEndDebate(roomService.startDebate(roomId, principalDetail.getId()));
			}else if(msg.getType() == 2){
				log.info("토론 종료 요청");
				room.setCloseDate(roomService.close(roomId, principalDetail.getId()));
			}else if(msg.getType() == 3){
				log.info("토론 나가기 요청");
				msg.setType(roomService.leave(roomId, principalDetail.getId(), room));
			}
			msg.setData(room);
			simpMessagingTemplate.convertAndSend("/topic/info/"+roomId, new ResponseDto(HttpStatus.OK.value(), msg));

		}catch (EntityNotFoundException | AccessDeniedException e){
			simpMessagingTemplate.convertAndSend("/topic/info/"+roomId, new ResponseDto(HttpStatus.BAD_REQUEST.value(), "Request Fail"));
		}
	}



	@MessageMapping("/chat/msg")
	public void sendMsg(ChatMsgDto message, StompHeaderAccessor stompHeaderAccessor, SimpMessageHeaderAccessor sha) {
		log.info("msg 받은 메시지 {}" , message);

		PrincipalDetail principalDetail = (PrincipalDetail)((UsernamePasswordAuthenticationToken)stompHeaderAccessor.getUser()).getPrincipal();

		long roomId = ((long)stompHeaderAccessor.getSessionAttributes().get("roomId"));
		RoomInfoDto room = roomService.defaultInfo(roomId);

		if(room.getCloseDate() == null && message.getMessageType().equals("text")){

			ChatMsgDto msg = ChatMsgDto.builder()
					.chatId(roomId)
					.sender(principalDetail.getUser().getName())
					.senderId(principalDetail.getId())
					.message(message.getMessage())
					.messageType(message.getMessageType())
					.build();

			chatService.insert(roomId, principalDetail.getId(), (String)message.getMessage());
			simpMessagingTemplate.convertAndSend("/topic/msg/"+roomId, msg);
		}
	}
}
