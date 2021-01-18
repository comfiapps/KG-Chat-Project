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

//	@Autowired
//	private RoomService roomService;
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	@Autowired
	private JwtToken jwtToken;

//	// 상대방 토론자 입장 시
//	@GetMapping("/discuss/enter/{id}")
//	public String discussRoomOpponent(@PathVariable(value = "id") long id, Model model){
//		if(!roomService.roomExists(id)) return "redirect:/";
//		//룸 정보 갱신
//
//		simpMessagingTemplate.convertAndSend("/topic/enter/"+id, "True");
//		return null;
//	}

	//enter를 통해 discusser인지 watcher판단하여 discusser 입장시
	@MessageMapping("/chat/enter")
	public void enter(@RequestBody ChatDto message){
		log.info("받은 메시지: {}", message);
		if(jwtToken.validateToken(message.getToken())){
			HashMap<String, Object> sendMap = new HashMap<String, Object>();
			sendMap.put("senderType", jwtToken.decodingToken(message.getToken()).split("/",3)[2]);
			simpMessagingTemplate.convertAndSend("/topic/enter/"+message.getChatRoomId(), sendMap);
		}
	}

	@MessageMapping("/chat/msg")
	public void sendMsg(ChatDto message, SimpMessageHeaderAccessor headerAccessor) {

//		channelinterceptor
//		인터셉터를 통해 메시지 처리에 대한 전후를 처리할 수 있음

//		System.out.println(headerAccessor);
//		System.out.println(headerAccessor.getSessionId());
//		System.out.println(message);

		log.info("받은 메시지: {}", message);

		if(jwtToken.validateToken(message.getToken())){
			// token에다가 방번호/유저이름/권한(discusser, watcher) 형태로 보낼것임
			// 그냥 검증과정만하면 되지 않을까... 너무 과도한 검증인거 같네

			String[] value = jwtToken.decodingToken(message.getToken()).split("/",3);
			log.info("분해값 : {}", value);
			if(	value[0].equals(message.getChatRoomId()) &&
				value[1].equals(message.getSender()) &&
				value[2].equals(message.getSenderType())){
				log.info("일치함");

				simpMessagingTemplate.convertAndSend("/topic/"+message.getChatRoomId(), message);
			}else{
				log.info("조작된 데이터");
			}
//			simpMessagingTemplate.convertAndSend("/topic/"+message.getChatRoomId(), message);
		}else{
			log.info("토큰 검증 실패");
		}



//		JSONObject jobj = new JSONObject(message);
//
//		long chatRoomId = jobj.getLong("chatRoomId");
//		String sender = jobj.getString("sender");
//		String receiver = jobj.getString("receiver");
////		String sessionId = jobj.getString("sessionId");
//		String msg = jobj.getString("message");

//		log.info("chatRoomId 메시지: {}", chatRoomId);
//		log.info("sender 메시지: {}", sender);
//		log.info("receiver 메시지: {}", receiver);
////		log.info("sessionId 메시지: {}", sessionId);
//		log.info("msg 메시지: {}", msg);

//		HashMap<String, Object> sendMsgMap = new HashMap<String, Object>();
//
//		sendMsgMap.put("sender", sender);
//		sendMsgMap.put("receiver", receiver);
//		sendMsgMap.put("message", msg);
//		sendMsgMap.put("sendTime", new Date());
		
//		simpMessagingTemplate.convertAndSend("/topic/" + chatRoomId, sendMsgMap);
	}


}
