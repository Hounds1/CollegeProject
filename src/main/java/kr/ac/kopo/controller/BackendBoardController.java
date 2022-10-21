package kr.ac.kopo.controller;

import kr.ac.kopo.service.BackendBoardService;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BackendBoardController {

    private final BackendBoardService boardService;
    
    @GetMapping("/java")
    public String getJavaBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getJavaBoard(pager);
        model.addAttribute("list", list);
        return "/board/java_board";
    }

    @PostMapping("/upload")
    public String contentUpload(BackendBoardVO backendBoardVO) {
        boardService.contentUpload(backendBoardVO);
        return "redirect:java";
    }

    @RequestMapping("/delete/{contentNum}")
    public String contentDelete(@PathVariable int contentNum) {
        boardService.contentDelete(contentNum);
        return "redirect:/board/java";
    }
}
