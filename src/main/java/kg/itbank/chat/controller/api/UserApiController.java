package kg.itbank.chat.controller.api;

import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserApiController {

    @Autowired
    private UserService userService;

    @GetMapping("/{id}")
    public ResponseDto<?> getUser(@PathVariable long id) {
        return new ResponseDto<>(HttpStatus.OK.value(), userService.findUserById(id));
    }

}
