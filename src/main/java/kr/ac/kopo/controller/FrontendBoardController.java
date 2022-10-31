package kr.ac.kopo.controller;


import kr.ac.kopo.service.FrontendBoardService;
import kr.ac.kopo.util.MultipartBinder;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.FrontendBoardCommentVO;
import kr.ac.kopo.vo.FrontendBoardFileVO;
import kr.ac.kopo.vo.FrontendBoardVO;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/front")
public class FrontendBoardController {

    private final FrontendBoardService boardService;

    /**
     * Bring each boards to split languages
     *
     * @param model
     * @param pager
     * @return each languages board
     */

    @GetMapping("/js")
    public String getJSBoard(Model model, Pager pager) {
        List<FrontendBoardVO> list = boardService.getJSBoard(pager);
        model.addAttribute("list", list);

        return "board/frontend/js_board";
    }

    /**
     * upload content in frontend board table
     */

    @PostMapping("/upload")
    public String contentUpload(FrontendBoardVO content) {
        List<FrontendBoardFileVO> list = new ArrayList<>();
        MultipartBinder binder = new MultipartBinder();

        for (MultipartFile paramFile : content.getParamFiles()) {
            if (paramFile != null && !paramFile.isEmpty()) {
                String fileName = binder.operate(paramFile);

                FrontendBoardFileVO fileVO = new FrontendBoardFileVO();
                fileVO.setFileName(fileName);

                list.add(fileVO);
            }
        }

        content.setParamFileList(list);

        String targetUrl = boardService.contentUpload(content);

        return "redirect:/front/detail/" + targetUrl;
    }

    /**
     * get content detail view
     *
     * @param contentNum
     * @param model
     * @return
     */

    @GetMapping("/detail/{contentNum}")
    public String getContentDetail(@PathVariable int contentNum, Model model) {
        FrontendBoardVO frontendBoardVO = new FrontendBoardVO();
        frontendBoardVO = boardService.getContentDetail(contentNum);

        model.addAttribute("contentDetail", frontendBoardVO);

        return "board/frontend/board_detail";
    }

    /**
     * comment upload function
     *
     * @param commentVO
     * @param memberVO
     * @return
     */

    @PostMapping("/comment")
    public String commentUpload(FrontendBoardCommentVO commentVO, @SessionAttribute(value = "member") MemberVO memberVO) {
        commentVO.setCommentUploader(memberVO.getMemberNick());
        boardService.commentUpload(commentVO);
        String targetURL = Integer.toString(commentVO.getCommentTargetContentNum());

        return "redirect:/front/detail/" + targetURL;
    }

    /**
     * bring target content values for editor
     *
     * @param targetNum
     * @return
     */

    @PostMapping("/editor")
    public @ResponseBody FrontendBoardVO contentEditor(@RequestParam(value = "targetNum") int targetNum) {
        FrontendBoardVO boardVO = boardService.contentEditor(targetNum);

        return boardVO;
    }

    /**
     * update param values in target content number
     *
     * @param targetNum
     * @param contentTitle
     * @param contentDetail
     * @return
     */

    @PostMapping("/update")
    public @ResponseBody String contentUpdate(@RequestParam(value = "targetNum") int targetNum,
                                              @RequestParam(value = "contentTitle") String contentTitle,
                                              @RequestParam(value = "contentDetail") String contentDetail) {
        FrontendBoardVO boardVO = new FrontendBoardVO();
        boardVO.setContentNum(targetNum);
        boardVO.setContentTitle(contentTitle);
        boardVO.setContentDetail(contentDetail);

        boardService.contentUpdate(boardVO);

        return "OK";
    }

    /**
     * bring target comment values for editor
     */
    @PostMapping("/commenteditor")
    public @ResponseBody FrontendBoardCommentVO commentEditor(@RequestParam(value = "targetId") int targetId) {
        FrontendBoardCommentVO commentVO = boardService.commentEditor(targetId);

        return commentVO;
    }

    /**
     * update values in target comment number
     */

    @PostMapping("/commentupdate")
    public String commentUpdate(FrontendBoardCommentVO commentVO) {
        boardService.commentUpdate(commentVO);
        String targetURL = Integer.toString(commentVO.getCommentTargetContentNum());

        return "redirect:/front/detail/"+targetURL;
    }

    /**
     * drop comment from content
     */

    @RequestMapping("/removecomment/{commentNum}")
    public String removeComment(@PathVariable int commentNum, HttpServletRequest request) {
        boardService.removeComment(commentNum);
        String referer = request.getHeader("referer");
        String targetURL = referer.substring(referer.lastIndexOf("/"), referer.length());

        return "redirect:/front/detail/"+targetURL;
    }
}