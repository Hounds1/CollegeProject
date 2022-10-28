package kr.ac.kopo.controller;


import kr.ac.kopo.dao.BackendBoardCommentDao;
import kr.ac.kopo.dao.BackendBoardDao;
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
    private final BackendBoardDao backendBoardDao;

    private final BackendBoardCommentDao boardCommentDao;
    @GetMapping("/")
    public String index(Model model) {
        int memberSize = memberDao.getMemberSize();
        int adminSize = memberDao.getAdminSize();
        int contentsSize = backendBoardDao.getContentsSize();
        int commentSize =  boardCommentDao.getCommentSize();
        model.addAttribute("memberSize", memberSize);
        model.addAttribute("adminSize", adminSize);
        model.addAttribute("contentsSize", contentsSize);
        model.addAttribute("commentSize", commentSize);
        return "index";
    }
}
