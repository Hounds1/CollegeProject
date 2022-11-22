package kr.ac.kopo.controller;


import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.util.PassMaker;
import kr.ac.kopo.util.StringToDateConverter;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.WebSocketSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.Date;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;

    /**
     * member new account Ajax
     */

    @PostMapping("/new_account")
    public @ResponseBody String memberNewAccount(@RequestParam(value = "memberId") String memberId,
                                                 @RequestParam(value = "memberNick") String memberNick,
                                                 @RequestParam(value = "memberPass") String memberPass,
                                                 MemberVO memberVO) {
        memberVO.setMemberId(memberId);
        memberVO.setMemberNick(memberNick);
        memberVO.setMemberPass(memberPass);


        memberService.memberNewAccount(memberVO);
        return "OK";
    }

    /**
     * Member login Ajax
     * @return
     */
    @PostMapping("/login")
    public @ResponseBody String memberLogin(MemberVO memberVO, HttpSession httpSession ,@RequestParam(value = "memberId", required = true) String memberId,
                              @RequestParam(value = "memberPass", required = true) String memberPass) {
        memberVO.setMemberId(memberId);
        memberVO.setMemberPass(memberPass);

        String ip = null;
        try {
            ip = String.valueOf(Inet4Address.getLocalHost());
        } catch (UnknownHostException e) {
            throw new RuntimeException(e);
        }


        log.info("----------------------connect info-----------------------");
        log.info(memberId);
        log.info(memberPass);
        log.info("----------------------connect info-----------------------");
        if(memberService.memberLogin(memberVO)) {
            httpSession.setAttribute("member", memberVO);
            return "OK";
        } else
            return "Fail";
    }


    /**
     * member logout
     * session close
     */

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

    /**
     * if someone connect without session
     * @return this
     */
    @GetMapping("/login_not_found")
    public String loginNotFound() {
        return "account_control/login_fail";
    }

    /**
     * member change new password before check old one.
     * @return
     */
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

    /**
     * member change new password duplicate check
     * @return
     */

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

    @PostMapping("/delete_account")
    public @ResponseBody String deleteAccount(@RequestParam(value = "targetId") String targetId){
        if(memberService.deleteAccount(targetId) != 0){
            return "OK";
        } else {
            return "Fail";
        }
    }
}
