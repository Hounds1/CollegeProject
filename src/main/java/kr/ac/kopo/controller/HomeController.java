package kr.ac.kopo.controller;


import kr.ac.kopo.dao.MemberDao;
import kr.ac.kopo.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class HomeController {

    private final MemberDao memberDao;
    @GetMapping("/")
    public String index(Model model) {
        int memberSize = memberDao.getMemberSize();
        int adminSize = memberDao.getAdminSize();
        model.addAttribute("memberSize", memberSize);
        model.addAttribute("adminSize", adminSize);
        return "index";
    }
}
