package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.service.UserService;
import kg.itbank.chat.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;

@RestController
@RequestMapping("/api/vote")
public class VoteApiController {

    @Autowired
    private VoteService voteService;

    @PutMapping
    public ResponseDto<?> vote(@AuthenticationPrincipal PrincipalDetail principal,
                               @PathParam("userId") long userId,
                               @PathParam("roomId") long roomId) {
        voteService.voteTo(principal.getId(), roomId, userId);
        return new ResponseDto<>(HttpStatus.OK.value(), HttpStatus.OK.toString());
    }

    @GetMapping
    public ResponseDto<?> countVotes(@PathParam("roomId") long roomId) {
        return new ResponseDto<>(HttpStatus.OK.value(), voteService.voteCount(roomId));
    }

    @DeleteMapping
    public ResponseDto<?> unvote(@AuthenticationPrincipal PrincipalDetail principal,
                                 @PathParam("roomId") long roomId) {
        voteService.unvote(principal.getId(), roomId);
        return new ResponseDto<>(HttpStatus.OK.value(), HttpStatus.OK.toString());
    }

}
