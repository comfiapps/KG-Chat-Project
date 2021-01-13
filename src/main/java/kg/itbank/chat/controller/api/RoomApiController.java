package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.model.Room;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/room")
public class RoomApiController {

    @Autowired
    private RoomService roomService;

    @GetMapping
    public ResponseDto<?> listFeaturedRoom() {
        return new ResponseDto<>(HttpStatus.OK.value(), roomService.listFeaturedRoom());
    }

    @PostMapping
    public ResponseDto<?> createRoom(@AuthenticationPrincipal PrincipalDetail principal,
                                     @RequestBody Room room) {
        return new ResponseDto<>(HttpStatus.OK.value(), roomService.create(room, principal.getId()));
    }

    @GetMapping("/{id}")
    public ResponseDto<?> getRoomData(@PathVariable long id) {
        return new ResponseDto<>(HttpStatus.OK.value(), roomService.getRoom(id));
    }

    @PutMapping("/{roomId}/start")
    public ResponseDto<?> startDebate(@AuthenticationPrincipal PrincipalDetail principal,
                                      @PathVariable long roomId) {
        roomService.startDebate(roomId, principal.getId());
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }

    @PutMapping("/{roomId}/end")
    public ResponseDto<?> endDebate(@AuthenticationPrincipal PrincipalDetail principal,
                                    @PathVariable long roomId) {
        roomService.endDebate(roomId, principal.getId());
        return new ResponseDto<>(HttpStatus.OK.value(), 1);
    }


}
