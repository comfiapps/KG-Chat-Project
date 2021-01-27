package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.config.PrincipalService;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.exception.GlobalExceptionHandler;
import kg.itbank.chat.model.User;
import kg.itbank.chat.service.CodeService;
import kg.itbank.chat.service.MailService;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import sun.rmi.runtime.Log;

@RestController
@RequestMapping("/api/me")
public class MeApiController {

    @Autowired
    private PrincipalService principalService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private MailService mailService;

    @Autowired
    private CodeService codeService;

    @GetMapping
    public ResponseDto<?> getUserData(@AuthenticationPrincipal PrincipalDetail principal) {
        return new ResponseDto<>(HttpStatus.OK.value(), userService.findUserById(principal.getId()));
    }

    @PostMapping
    public ResponseDto<?> updateUserData(@AuthenticationPrincipal PrincipalDetail principal,
                                         @RequestBody User user,
                                         @RequestParam(value = "code", required = false) int code) {
        UserDetails userDetails = principalService.loadUserById(
                userService.update(principal.getId(), user, code));
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userDetails,
                        null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @PostMapping("/email")
    public ResponseDto<?> requestEmailChange(@AuthenticationPrincipal PrincipalDetail principal,
                                             @RequestBody User user) {
        if(user.getEmail() != null) {
            int code = codeService.generateCode(principal.getId(), user.getEmail());
            if(code == -1) return new GlobalExceptionHandler().handleArgumentException(
                    new Exception("email already in use"));
            mailService.sendCode(user.getEmail(), code);
        } else {
            return new GlobalExceptionHandler().handleArgumentException(
                    new Exception("email value is null"));
        }
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @GetMapping("/room")
    public ResponseDto<?> listRoom(@AuthenticationPrincipal PrincipalDetail principal) {
        return new ResponseDto<>(HttpStatus.OK.value(), roomService.listRoomByUserId(principal.getId()));
    }

}
