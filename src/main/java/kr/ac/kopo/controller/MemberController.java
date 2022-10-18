package kr.ac.kopo.controller;


import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.util.PassMaker;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    @PostMapping("/new_account")
    public String memberNewAccount(MemberVO memberVO) {
        memberService.memberNewAccount(memberVO);
        return "redirect:/";
    }

    @PostMapping("/login")
    public @ResponseBody String memberLogin(MemberVO memberVO, HttpSession httpSession ,@RequestParam(value = "memberId", required = true) String memberId,
                              @RequestParam(value = "memberPass", required = true) String memberPass) {
        memberVO.setMemberId(memberId);
        memberVO.setMemberPass(memberPass);

        if(memberService.memberLogin(memberVO)) {
            httpSession.setAttribute("member", memberVO);
            return "OK";
        } else
            return "Fail";
    }

    @GetMapping("/escape")
    public String memberEscape(HttpSession httpSession) {
        httpSession.invalidate();
        return "redirect:/";
    }

    @PostMapping("/idDupChk")
    public @ResponseBody String idDupChk (@RequestParam(value = "targetId", required = true) String targetId) {
        if(memberService.memberDuplicateChk(targetId) == 0) {
            return "OK";
        } else
            return "Fail";

    }

    @PostMapping("/nickDupChk")
    public @ResponseBody String nickDupChk (@RequestParam(value = "targetNick", required = true) String targetNick){
        if(memberService.nickDuplicateChk(targetNick) == 0) {
            return "OK";
        } else
            return "Fail";
    }

    @GetMapping("/mypage")
    public String myPage() {
        return "member/my_page";
    }

    @GetMapping("/login_not_found")
    public String loginNotFound() {
        return "account_control/login_fail";
    }

    @PostMapping("/info_update")
    public @ResponseBody String infoUpdate(@RequestParam(value = "memberId", required = false) String memberId ,
                                           @RequestParam(value = "memberPass",required = false) String memberPass,
                                           @RequestParam(value = "memberNick", required = false) String memberNick,
                                           @RequestParam(value = "memberName", required = false) String memberName,
                                           @RequestParam(value = "memberBirth", required = false) Date memberBirth,
                                           @RequestParam(value = "memberPhoneNumber", required = false) String memberPhoneNumber,
                                           @RequestParam(value = "memberAddress", required = false) String memberAddress) {
        MemberVO newMemberInfo = new MemberVO();
        newMemberInfo.setMemberId(memberId);
        newMemberInfo.setMemberPass(memberPass);
        newMemberInfo.setMemberNick(memberNick);
        newMemberInfo.setMemberName(memberName);
        newMemberInfo.setMemberBirth(memberBirth);
        newMemberInfo.setMemberPhoneNumber(memberPhoneNumber);
        newMemberInfo.setMemberAddress(memberAddress);

        memberService.memberInfoUpdate(newMemberInfo);

        return "OK";
    }

}
