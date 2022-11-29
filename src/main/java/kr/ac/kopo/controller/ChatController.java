package kr.ac.kopo.controller;

import kr.ac.kopo.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ChatController {
    @RequestMapping("/chat")
    public String chat () {
        return "chat";
    }


    @RequestMapping("/chat_test")
    public String chatTest(){
        return "chat_test";
    }
}
