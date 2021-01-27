package kg.itbank.chat.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.Vote;
import kg.itbank.chat.service.ParticipantService;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.VoteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PathController {

    private static final Logger logger = LoggerFactory.getLogger(PathController.class);

    @Autowired
    private VoteService voteService;

    @Autowired
    private ParticipantService participantService;

    @Autowired
    private RoomService roomService;

    @GetMapping({"", "/", "/home"})
    public String home(@AuthenticationPrincipal PrincipalDetail principal, Model model,
                       @RequestParam(value = "c", required = false) String categorize) {
        if(principal == null) return "redirect:/login";
        model.addAttribute("recommend", roomService.listFeaturedRoom(categorize));
        model.addAttribute("roomCounter", participantService.getRoomLoopupList());

        return "home";
    }

    @GetMapping("/login")
    public String login(@AuthenticationPrincipal PrincipalDetail principal, HttpServletRequest request, Model model) {
        if(principal != null) return "redirect:/";
        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();

        model.addAttribute("baseUrl", baseUrl);
        return "user/loginForm";
    }

    @GetMapping("/register")
    public String register(@AuthenticationPrincipal PrincipalDetail principal, HttpServletRequest request, Model model) {
        if(principal != null) return "redirect:/";
        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();

        model.addAttribute("baseUrl", baseUrl);
        return "user/registerForm";
    }

    @GetMapping("/discuss")
    public String discussNull(@AuthenticationPrincipal PrincipalDetail principal, RedirectAttributes redirectAttributes) {
        long joined = roomService.isUserOnDebate(principal.getId());
        if(joined != -1) {
            redirectAttributes.addFlashAttribute("joinedError",true);
            return "redirect:/discuss/" + joined;
        }
        return "redirect:/";
    }

    @GetMapping("/discuss/{id}")
    public String discussRoom(@AuthenticationPrincipal PrincipalDetail principal,
                              @PathVariable long id, Model model, RedirectAttributes redirectAttributes, HttpSession session){

        long joined = roomService.isUserOnDebate(principal.getId());

        if(joined != -1 && joined != id) {
            redirectAttributes.addFlashAttribute("joinedError",true);
            return "redirect:/discuss/" + joined;
        }

        if(!roomService.roomExists(id)) return "redirect:/";

        RoomInfoDto room = roomService.defaultInfo(id);
        Vote vote = voteService.getVote(principal.getId(), id);

        try{
            session.setAttribute("roomId", id);
            model.addAttribute("room", new ObjectMapper().writeValueAsString(room));
            model.addAttribute("endDiscuss", room.getCloseDate() != null?true: false);
            model.addAttribute("myVote", vote != null?vote.getVoteToId():0);
        }catch (Exception e){
            return "redirect:/";
        }

        logger.info("Discuss room 이동");

        return "discuss/discusser";
    }

    @GetMapping("/search")
    public String search(@RequestParam(value = "p", required = false) String keyword, Model model) {
        if(keyword == null) return "redirect:/";
        model.addAttribute("keyword", keyword);
        model.addAttribute("searchResult", roomService.searchRoom(keyword));
        return "search/searchForm";
    }

    @GetMapping("/profile")
    public String profile(@AuthenticationPrincipal PrincipalDetail principal, Model model) {
        model.addAttribute("myRoom", roomService.listRoomByUserId(principal.getId()));
        return "user/updateForm";
    }

}
