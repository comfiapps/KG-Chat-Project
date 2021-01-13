package kg.itbank.chat.controller.api;


import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/search")
public class SearchApiController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/{keyword}")
    public ResponseDto<?> searchRoom(@PathVariable String keyword) {
        return new ResponseDto<>(HttpStatus.OK.value(),roomService.searchRoom(keyword));
    }

}
