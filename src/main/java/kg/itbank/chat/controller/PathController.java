package kg.itbank.chat.controller;


import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.service.RoomService;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PathController {

    @Autowired
    private RoomService roomService;

    @GetMapping({"", "/", "/home"})
    public String home(@AuthenticationPrincipal PrincipalDetail principal) {
        if(principal == null) return "redirect:/login";
        return "home";
    }

    @GetMapping("/login")
    public String login(@AuthenticationPrincipal PrincipalDetail principal) {
        // TODO login - check session > if exists, redirect
        if(principal == null) return "redirect:/";
        return "user/loginForm";
    }

    @GetMapping("/logout")
    public String logout(@AuthenticationPrincipal PrincipalDetail principal) {
        // TODO logout - clear session
        return "redirect:/";
    }

    @GetMapping("/discuss/{id}")
    public String discussRoom(@PathVariable long id, Model model) {
        // model.addAttribute("room", roomService.)
        return "discuss/roomForm";
    }

    @GetMapping("/search/{keyword}")
    public String discussRoom(@PathVariable String keyword, Model model) {
        // model.addAttribute("room", roomService.)
        return "search/searchForm";
    }

    @GetMapping("/profile")
    public String profile() {
        return "user/updateForm";
    }
}
