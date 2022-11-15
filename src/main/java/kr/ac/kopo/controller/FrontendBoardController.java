package kr.ac.kopo.controller;


import kr.ac.kopo.service.FrontendBoardService;
import kr.ac.kopo.util.LangNameConverter;
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
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/front")
public class FrontendBoardController {

    private final FrontendBoardService boardService;

    /**
     * get target board
     * @return each language board
     */

    @GetMapping("/board")
    public String getTargetBoard(@RequestParam(value = "langname")String target, Model model, Pager pager){
        pager.setLangName(target);
        List<FrontendBoardVO> list = boardService.getTargetBoard(pager);
        model.addAttribute("list", list);

        return "/board/frontend/"+target+"_board";
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

        LangNameConverter converter = new LangNameConverter();

        frontendBoardVO.setContentLangName(converter.convert(frontendBoardVO.getContentLangName()));

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
        return boardService.contentEditor(targetNum);
    }

    /**
     * update param values in target content number
     */

    @PostMapping("/update")
    public String contentUpdate(FrontendBoardVO content, HttpServletRequest request) {

        List<FrontendBoardFileVO> list = new ArrayList<>();
        MultipartBinder binder = new MultipartBinder();

        for(MultipartFile target : content.getParamFiles()){
            if(target != null && !target.isEmpty()) {
                String result = binder.operate(target);

                FrontendBoardFileVO fileVO = new FrontendBoardFileVO();
                fileVO.setFileName(result);

                list.add(fileVO);
            }
        }

        content.setParamFileList(list);

        boardService.contentUpdate(content);

        String targetUrl = request.getHeader("referer");
        return "redirect:" + targetUrl;
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
        String referer = request.getHeader("referer");
        String targetURL = referer.substring(referer.lastIndexOf("/") + 1, referer.length());
        int targetNum = Integer.parseInt(targetURL);

        boardService.removeComment(commentNum, targetNum);


        return "redirect:/front/detail/"+targetURL;
    }

    @RequestMapping("/delete")
    public String deleteContent(@RequestParam(value = "langname") String returnName,
                                @RequestParam(value = "contentnum") int contentNum){
        boardService.deleteContent(contentNum);

        return "redirect:/front/board?langname="+returnName;
    }
}
