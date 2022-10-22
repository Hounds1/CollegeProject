package kr.ac.kopo.controller;

import kr.ac.kopo.service.BackendBoardService;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
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

    @PostMapping("/editor")
    public @ResponseBody BackendBoardVO contentEditor(@RequestParam(value = "targetNum") int targetNum) {
        return boardService.contentEditor(targetNum);
    }

    @PostMapping("/update")
    public @ResponseBody String contentUpdate(@RequestParam(value = "targetNum") int targetNum,
                                              @RequestParam(value = "contentTitle") String contentTitle,
                                              @RequestParam(value = "contentDetail") String contentDetail) {
        BackendBoardVO backendBoardVO = new BackendBoardVO();
        backendBoardVO.setContentNum(targetNum);
        backendBoardVO.setContentTitle(contentTitle);
        backendBoardVO.setContentDetail(contentDetail);

        if (boardService.contentUpdate(backendBoardVO) == 1) {
            return "OK";
        } else
            return "Fail";


    }
}
