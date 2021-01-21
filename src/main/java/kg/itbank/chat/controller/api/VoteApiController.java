package kg.itbank.chat.controller.api;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.ResponseDto;
import kg.itbank.chat.model.Vote;
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

    @PutMapping("{userId}/{roomId}")
    public ResponseDto<?> vote(@AuthenticationPrincipal PrincipalDetail principal,
                               @PathVariable("userId") long userId,
                               @PathVariable("roomId") long roomId) {
        return new ResponseDto<>(HttpStatus.OK.value(),
                voteService.voteTo(principal.getId(), roomId, userId));
    }

    @GetMapping("{roomId}")
    public ResponseDto<?> countVotes(@PathVariable("roomId") long roomId) {
        return new ResponseDto<>(HttpStatus.OK.value(), voteService.voteCount(roomId));
    }

    @DeleteMapping("{roomId}")
    public ResponseDto<?> unvote(@AuthenticationPrincipal PrincipalDetail principal,
                                 @PathVariable("roomId") long roomId) {
        voteService.unvote(principal.getId(), roomId);
        return new ResponseDto<>(HttpStatus.OK.value(), HttpStatus.OK.toString());
    }

}
