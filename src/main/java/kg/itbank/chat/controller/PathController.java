package kg.itbank.chat.controller;


import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
        model.addAttribute("room", roomService.defaultInfo(id));
        session.setAttribute("chatId", id);
        return "discuss/discusser";
    }

    @GetMapping("/search/{keyword}")
    public String search(@PathVariable String keyword, Model model) {
//        model.addAttribute("room", roomService.)
        return "search/searchForm";
    }

    @GetMapping("/profile")
    public String profile() {
        return "user/updateForm";
    }

}
