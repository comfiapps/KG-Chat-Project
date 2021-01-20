package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.config.PrincipalService;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.model.User;
import kg.itbank.chat.service.ChatService;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/chat")
public class ChatApiController {

    @Autowired
    private ChatService chatService;

    @GetMapping("/{roomId}")
    public ResponseDto<?> listChat(@PathVariable long roomId) {
        return new ResponseDto<>(HttpStatus.OK.value(), chatService.listChatByRoom(roomId));
    }

}
