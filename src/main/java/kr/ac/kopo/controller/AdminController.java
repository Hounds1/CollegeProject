package kr.ac.kopo.controller;

import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    private final AdminService adminService;

    @GetMapping("/control")
    public String getPanel(@SessionAttribute(value = "member") MemberVO memberVO){
        if(!Objects.equals(memberVO.getMemberAuthority(), "Archivist")){
            return "redirect:/member/login_not_found";
        } else return "admin/admin";
    }

    @GetMapping("/member")
    public String getMemberControl(Pager pager, Model model){
        List<MemberVO> list = adminService.getMemberControl(pager);

        model.addAttribute("list", list);

        return "admin/admin_member";
    }

    @RequestMapping("/drop_member")
    public String dropMember(@RequestParam(value = "memberId") String memberId){
        adminService.dropMember(memberId);

        return "redirect:/admin/member";
    }
}
