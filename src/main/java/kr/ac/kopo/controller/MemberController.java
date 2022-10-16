package kr.ac.kopo.controller;


import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/new_account")
    public String memberNewAccount(MemberVO memberVO) {
        String memberId = memberVO.getMemberId();
        int duplicateChk = memberService.memberDuplicateChk(memberId);

        if(duplicateChk == 0) {
            memberService.memberNewAccount(memberVO);
        }
        return "redirect:/";
    }

    @PostMapping("/login")
    public String memberLogin(MemberVO memberVO, HttpSession httpSession) {

        if(memberService.memberLogin(memberVO)) {
            httpSession.setAttribute("member", memberVO);
        }
        return "redirect:/";
    }

    @GetMapping("/escape")
    public String memberEscape(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/";
    }
}
