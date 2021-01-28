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
                                         @RequestParam(value = "code", required = false) String code) {
        long userId =  userService.update(principal.getId(), user, code);
        if(userId == -1) return new ResponseDto<>(1006, "코드가 틀렸습니다");
        UserDetails userDetails = principalService.loadUserById(userId);
        UsernamePasswordAuthenticationToken authentication =
                new UsernamePasswordAuthenticationToken(userDetails,
                        null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @PostMapping("/email")
    public ResponseDto<?> requestEmailChange(@AuthenticationPrincipal PrincipalDetail principal,
                                             @RequestBody User user) {
        if(user.getEmail() == null) return new GlobalExceptionHandler().handleArgumentException(
                new Exception("email value is null"));

        int code = codeService.generateModifyCode(principal.getId(), user.getEmail());
        if(code == -1) return new ResponseDto<>(1001, "이메일이 이미 사용 중입니다");
        mailService.sendCode("이메일 변경을", user.getEmail(), code);

        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @GetMapping("/room")
    public ResponseDto<?> listRoom(@AuthenticationPrincipal PrincipalDetail principal) {
        return new ResponseDto<>(HttpStatus.OK.value(), roomService.listRoomByUserId(principal.getId()));
    }

}
