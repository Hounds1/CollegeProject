package kr.ac.kopo.controller;


import kr.ac.kopo.dao.*;
import kr.ac.kopo.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.Inet4Address;
import java.net.UnknownHostException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
@Slf4j
public class HomeController {

    private final MemberDao memberDao;
    private final BackendBoardDao backendBoardDao;

    private final FrontendBoardDao frontendBoardDao;

    private final BackendBoardCommentDao boardCommentDao;

    private final FrontendBoardCommentDao frontCommentDao;
    @GetMapping("/")
    public String index(Model model) {
        int memberSize = memberDao.getMemberSize();
        int adminSize = memberDao.getAdminSize();
        int bContentsSize = backendBoardDao.getContentsSize();
        int bCommentSize =  boardCommentDao.getCommentSize();
        int fContentsSize = frontendBoardDao.getContentSize();
        int fCommentSize = frontCommentDao.getCommentSize();
        int contentsSize = bContentsSize + fContentsSize;
        int commentSize = bCommentSize + fCommentSize;
        log.info("----------------connect info ------------------");
        log.info("Someone Connect Server");
        log.info("----------------connect info ------------------");
        model.addAttribute("memberSize", memberSize);
        model.addAttribute("adminSize", adminSize);
        model.addAttribute("contentsSize", contentsSize);
        model.addAttribute("commentSize", commentSize);
        return "index";
    }
}
