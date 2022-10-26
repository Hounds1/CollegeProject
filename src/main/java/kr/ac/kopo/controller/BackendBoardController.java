package kr.ac.kopo.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.util.JSONPObject;
import kr.ac.kopo.service.BackendBoardService;
import kr.ac.kopo.util.MultipartBinder;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BackendBoardController {

    private final BackendBoardService boardService;

    /**
     * all languages request to each languages
     * @param model
     * @param pager
     * @return target language board
     */

    @GetMapping("/java")
    public String getJavaBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getJavaBoard(pager);
        model.addAttribute("list", list);
        return "/board/java_board";
    }


    /**
     * common upload method
     * no care about language name
     * @param content
     * @return
     */
    @PostMapping("/upload")
    public String contentUpload(BackendBoardVO content) {

        List<BackendBoardFileVO> list = new ArrayList<BackendBoardFileVO>();
        MultipartBinder binder = new MultipartBinder();
        for(MultipartFile paramFile : content.getParamFiles()) {
            if(paramFile != null && !paramFile.isEmpty()) {
               String fileName = binder.operate(paramFile);

               BackendBoardFileVO fileVO = new BackendBoardFileVO();
               fileVO.setFileName(fileName);

               list.add(fileVO);
            }
        }

        content.setParamFileList(list);

        boardService.contentUpload(content);

        return "redirect:/board/java";

    }


    /**
     * common delete method
     * no care about language name
     * @param contentNum
     * @return
     */
    @RequestMapping("/delete/{contentNum}")
    public String contentDelete(@PathVariable int contentNum) {
        boardService.contentDelete(contentNum);
        return "redirect:/board/java";
    }

    /**
     * pull to request target content values on editor
     * @param targetNum
     * @return
     */
    @PostMapping("/editor")
    public @ResponseBody BackendBoardVO contentEditor(@RequestParam(value = "targetNum") int targetNum) {
        return boardService.contentEditor(targetNum);
    }

    /**
     * common update method
     * no care about language name
     * @param targetNum
     * @param contentTitle
     * @param contentDetail
     * @return
     */

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

    /**
     * common details method
     * need to patch for all languages.
     * @param contentNum
     * @param model
     * @return
     */
    @GetMapping("/javaDetail/{contentNum}")
    public String detailView(@PathVariable int contentNum, Model model) {
        BackendBoardVO backendBoardVO = new BackendBoardVO();
        backendBoardVO = boardService.detailView(contentNum);

        model.addAttribute("contentDetail",backendBoardVO);

        return "/board/board_detail";
    }
}