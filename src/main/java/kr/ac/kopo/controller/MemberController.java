package kr.ac.kopo.controller;


import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.util.PassMaker;
import kr.ac.kopo.util.StringToDateConverter;
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

    @PostMapping("/changePassValChk")
    public @ResponseBody String changePassValChk(@RequestParam(value = "passChangeId") String passChangeId,
                                                 @RequestParam(value = "passValChk") String passValChk, MemberVO memberVO) {
        memberVO.setMemberId(passChangeId);
        memberVO.setMemberPass(passValChk);

        if(memberService.changePassValChk(memberVO) == 1) {
            return "OK";
        } else
            return "Fail";
    }

    @PostMapping("/changeNewPassVal")
    public @ResponseBody String changeNewPassVal(@RequestParam(value = "passChangeId") String passChangeId,
                                                 @RequestParam(value = "newPassVal") String newPassVal, MemberVO memberVO, HttpSession httpSession) {
        memberVO.setMemberId(passChangeId);
        memberVO.setMemberPass(newPassVal);

        if(memberService.changeNewPassVal(memberVO) == 1) {
            httpSession.invalidate();
            return "OK";
        } else
            return "Fail";
    }

    @PostMapping("/personalInfoChange")
    public @ResponseBody String personalInfoChange(@RequestParam(value = "PIChangeId") String PIChangeId,
                                                   @RequestParam(value = "memberName") String memberName,
                                                   @RequestParam(value = "memberBirth") String memberBirth,
                                                   @RequestParam(value = "memberPhoneNumber") String memberPhoneNumber,
                                                   @RequestParam(value = "memberAddress") String memberAddress) {

        StringToDateConverter converter = new StringToDateConverter();
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberId(PIChangeId);
        memberVO.setMemberName(memberName);
        memberVO.setMemberBirth(converter.convert(memberBirth));
        memberVO.setMemberPhoneNumber(memberPhoneNumber);
        memberVO.setMemberAddress(memberAddress);

       if(memberService.personalInfoChange(memberVO) == 1) {
           return "OK";
       } else
           return "Fail";
    }

}
