package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.exception.GlobalExceptionHandler;
import kg.itbank.chat.model.User;
import kg.itbank.chat.service.CodeService;
import kg.itbank.chat.service.MailService;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/request")
public class RequestApiController {

    @Autowired
    private CodeService codeService;

    @Autowired
    private MailService mailService;

    @PutMapping("/login/{email}")
    public ResponseDto<?> requestLoginCode(@PathVariable String email) {
        int code = codeService.generateLoginCode(email);
        if(code == -1) return new GlobalExceptionHandler().handleArgumentException(new Exception("need register"));
        mailService.sendCode("로그인을", email, code);
        return new ResponseDto<>(HttpStatus.OK.value(), "success");
    }

    @PutMapping("/register/{name}/{email}")
    public ResponseDto<?> requestRegisterCode(@PathVariable String name, @PathVariable String email) {
        int code = codeService.generateRegisterCode(email);
        if(code == -1) return new GlobalExceptionHandler().handleArgumentException(new Exception("email already in use"));
        mailService.sendCode("'" + name + "'님의 회원가입을", email, code);
        return new ResponseDto<>(HttpStatus.OK.value(), "success");
    }
}
