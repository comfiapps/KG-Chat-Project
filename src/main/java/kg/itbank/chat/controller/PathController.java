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

import javax.servlet.http.HttpSession;

@Controller
public class PathController {

    private static final Logger logger = LoggerFactory.getLogger(PathController.class);

    @Autowired
    private RoomService roomService;

    @GetMapping("test")
    public String test(){
        return "discuss/discusser";
    }

    @GetMapping({"", "/", "/home"})
    public String home(@AuthenticationPrincipal PrincipalDetail principal) {
        if(principal == null) return "redirect:/login";
        return "home";
    }

    @GetMapping("/login")
    public String login(@AuthenticationPrincipal PrincipalDetail principal) {
        return "user/loginForm";
    }

    @GetMapping("/discuss")
    public String discussNull() {
        return "redirect:/";
    }

    @GetMapping("/discuss/{id}")
    public String discussRoom(@PathVariable long id, Model model, HttpSession session) {
        // model.addAttribute("room", roomService.)
        logger.info("방번호: {}", id);
        session.setAttribute("chatId", id);
        return "discuss/discusser";
    }

    @GetMapping("/search/{keyword}")
    public String search(@PathVariable String keyword, Model model) {
        // model.addAttribute("room", roomService.)
        return "search/searchForm";
    }

    @GetMapping("/profile")
    public String profile() {
        return "user/updateForm";
    }

}
