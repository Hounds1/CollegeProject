package kr.ac.kopo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ChatController {
    @RequestMapping("/chat")
    public String chat (HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return "chat";
    }
}
