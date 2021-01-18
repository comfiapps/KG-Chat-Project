package kg.itbank.chat.controller;


import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.dto.RoomInfoDto;
import kg.itbank.chat.model.User;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.UserService;
import kg.itbank.chat.util.JwtToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PathController {

    private static final Logger logger = LoggerFactory.getLogger(PathController.class);

    @Autowired
    private RoomService roomService;
    @Autowired
    private JwtToken jwtToken;

    @GetMapping({"", "/", "/home"})
    public String home(@AuthenticationPrincipal PrincipalDetail principal, Model model) {
        if(principal == null) return "redirect:/login";
//        System.out.println(roomService.listFeaturedRoom().toString());
        model.addAttribute("recommend", roomService.listFeaturedRoom());
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

    @GetMapping("/discuss")
    public String discussNull() {
        return "redirect:/";
    }

    @GetMapping("/discuss/{id}")
    public String discussRoom(@PathVariable long id, Model model, HttpSession session) {
        if(!roomService.roomExists(id)) return "redirect:/";
        logger.info("방번호: {}", id);

        String token;
        String senderType;
        RoomInfoDto room = roomService.defaultInfo(id);

        //token에다가 방번호/유저이름/권한(discusser, watcher) 형태로 보낼것임
        logger.info("room: {}", room);

        PrincipalDetail user = (PrincipalDetail)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(room.getOwner().getId() == user.getUser().getId()){
            senderType = "owner";
        }else if(room.getOpponent() != null && room.getOpponent().getId() == user.getUser().getId()){
            senderType = "opponent";
        }else{
            senderType = "watcher";
        }

        token = jwtToken.getToken(id + "/" + user.getUser().getName() +"/" + senderType);

        model.addAttribute("chatId", id);
        model.addAttribute("token", token);
        model.addAttribute("room", room);
        model.addAttribute("senderType", senderType);

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
