package kr.ac.kopo.controller;

import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    private final AdminService adminService;

    @GetMapping("/control")
    public String getPanel(){
        return "admin/admin";
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
