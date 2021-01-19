package kg.itbank.chat.controller;

import kg.itbank.chat.dto.ChatDto;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.util.JwtToken;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
@RequiredArgsConstructor
public class ChatController {

	private static final Logger log = LoggerFactory.getLogger(ChatController.class);

	@Autowired
	private RoomService roomService;

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;

	@Autowired
	private JwtToken jwtToken;

	//enter를 통해 discusser인지 watcher판단하여 discusser 입장시
	@MessageMapping("/chat/enter")
	public void enter(@RequestBody ChatDto message, SimpMessageHeaderAccessor headerAccessor){

		log.info("받은 메시지: {}", message);
		if(jwtToken.validateToken(message.getToken())){
			String[] value = jwtToken.decodingToken(message.getToken()).split("/",4);
			HashMap<String, Object> sendMap = new HashMap<String, Object>();

			sendMap.put("senderId", value[1]);
			sendMap.put("sender", value[2]);
			sendMap.put("senderType", value[3]);

			simpMessagingTemplate.convertAndSend("/topic/enter/"+value[0], sendMap);
		}
	}

	@MessageMapping("/chat/info")
	public void info(@RequestBody ChatDto message){
		log.info("받은 메시지: {}", message);
		if(jwtToken.validateToken(message.getToken())){
			String[] value = jwtToken.decodingToken(message.getToken()).split("/",4);
			HashMap<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("message", message.getMessage());
			sendMap.put("messageType", message.getMessageType());
			simpMessagingTemplate.convertAndSend("/topic/info/"+value[0], sendMap);
		}
	}

	@MessageMapping("/chat/msg")
	public void sendMsg(ChatDto message, SimpMessageHeaderAccessor headerAccessor) {
		log.info("받은 메시지: {}", message);
		if(jwtToken.validateToken(message.getToken())){

			String[] value = jwtToken.decodingToken(message.getToken()).split("/",4);
			log.info("분해값 : {}", value);
			if(	value[0].equals(message.getChatRoomId()) &&
				value[2].equals(message.getSender()) &&
				value[3].equals(message.getSenderType())){
				log.info("일치함");
				simpMessagingTemplate.convertAndSend("/topic/msg/"+message.getChatRoomId(), message);
			}else{
				log.info("조작된 데이터");
			}
		}else{
			log.info("토큰 검증 실패");
		}
	}
}
