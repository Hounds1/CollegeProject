package kr.ac.kopo.controller;


import kr.ac.kopo.service.BackendBoardService;
import kr.ac.kopo.util.LangNameConverter;
import kr.ac.kopo.util.MultipartBinder;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardCommentVO;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;

import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

import java.util.List;


@Controller
@RequiredArgsConstructor
@RequestMapping("/back")
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
        return "board/backend/java_board";
    }

    @GetMapping("/python")
    public String getPythonBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getPythonBoard(pager);
        model.addAttribute("list", list);

        return "board/backend/python_board";
    }

    @GetMapping("/nodejs")
    public String getNodeJsBoard(Model model, Pager pager){
        List<BackendBoardVO> list = boardService.getNodeJsBoard(pager);
        model.addAttribute("list", list);

        return "board/backend/nodejs_board";
    }

    @GetMapping("/ummlang")
    public String getUmmLangBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getUmmLangBoard(pager);
        model.addAttribute("list", list);

        return "board/backend/ummlang_board";
    }

    @GetMapping("/ruby")
    public String getRubyBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getRubyBoard(pager);
        model.addAttribute("list", list);

        return "board/backend/ruby_board";
    }

    @GetMapping("/kotlin")
    public String getKotlinBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getKotlinBoard(pager);
        model.addAttribute("list", list);

        return "board/backend/kotlin_board";
    }

    @GetMapping("swift")
    public String getSwiftBoard(Model model, Pager pager) {
        List<BackendBoardVO> list = boardService.getSwiftBoard(pager);
        model.addAttribute("list",list);

        return "board/backend/swift_board";
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

        String targetUrl = boardService.contentUpload(content);

        return "redirect:/back/detail/"+targetUrl;

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
        return "redirect:/back/java";
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
    @GetMapping("/detail/{contentNum}")
    public String detailView(@PathVariable int contentNum, Model model) {
        BackendBoardVO backendBoardVO = new BackendBoardVO();
        backendBoardVO = boardService.detailView(contentNum);

        LangNameConverter converter = new LangNameConverter();

        backendBoardVO.setContentLangName(converter.convert(backendBoardVO.getContentLangName()));



        model.addAttribute("contentDetail",backendBoardVO);

        return "board/backend/board_detail";
    }

    /**
     * common comment upload method
     * @param commentVO
     * @param MemberVO
     * @param request
     * @return referer page
     */
    @PostMapping("/comment")
    public String commentUpload(BackendBoardCommentVO commentVO, @SessionAttribute(value = "member") MemberVO MemberVO, HttpServletRequest request) {
        String urlNum = Integer.toString(commentVO.getCommentTargetContentNum());

        commentVO.setCommentUploader(MemberVO.getMemberNick());

        boardService.commentUpload(commentVO);

        return "redirect:/back/detail/"+urlNum;
    }

    /**
     * remove comment from database
     * @param commentNum
     * @param request
     * @return referer page
     */
    @RequestMapping("/removecomment/{commentNum}")
    public String removeComment(@PathVariable int commentNum, HttpServletRequest request) {
        String referer = request.getHeader("referer");
        String returnNum = referer.substring(referer.lastIndexOf("/")+1, referer.length());
        int targetNum = Integer.parseInt(returnNum);

        boardService.removeComment(commentNum, targetNum);


        return "redirect:/back/detail/"+returnNum;
    }

    /**
     * bring comment editor ajax
     * @param targetId
     * @return ajax
     */
    @PostMapping("/commenteditor")
    public @ResponseBody BackendBoardCommentVO commentEditor(@RequestParam(value = "targetId") int targetId) {
        return boardService.commentEditor(targetId);
    }

    /**
     * comment update ajax
     * @param commentVO
     * @param request
     * @return referer page
     */

    @PostMapping("/commentUpdate")
    public String commentUpdate(BackendBoardCommentVO commentVO, HttpServletRequest request) {
        String referer = request.getHeader("referer");
        String urlNum = referer.substring(referer.lastIndexOf("/"), referer.length());

        boardService.commentUpdate(commentVO);

        return "redirect:/back/detail"+urlNum;
    }

}
