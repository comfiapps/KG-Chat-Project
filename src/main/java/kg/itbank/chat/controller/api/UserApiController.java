package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalService;
import kg.itbank.chat.dto.SignFormDto;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/user")
public class UserApiController {

    @Autowired
    private UserService userService;

    @Autowired
    private PrincipalService principalService;

    @PostMapping("/register")
    public ResponseDto<?> register(@RequestBody SignFormDto signFormDto) {
        return getResponseDto(userService.registerByCode(signFormDto.getName().trim(),
                signFormDto.getEmail().trim(), signFormDto.getCode()));
    }

    @PostMapping("/login")
    public ResponseDto<?> login(@RequestBody SignFormDto signFormDto) {
        return getResponseDto(userService.loginByCode(signFormDto.getEmail().trim(), signFormDto.getCode()));
    }

    private ResponseDto<?> getResponseDto(long userId) {
        if(userId > 0) {
            UserDetails userDetails = principalService.loadUserById(userId);
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails,
                    null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authentication);

            return new ResponseDto<>(HttpStatus.OK.value(), "successful");
        }

        return new ResponseDto<>(HttpStatus.NO_CONTENT.value(), "invalid code");
    }

}
