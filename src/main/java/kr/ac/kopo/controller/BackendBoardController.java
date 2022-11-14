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

import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class BackendBoardController {

    private final BackendBoardService boardService;

    /**
     * common method
     * @return target language board
     */
    @GetMapping("/board")
    public String getTargetBoard(@RequestParam(value = "langname")String target,Model model, Pager pager){
        pager.setLangName(target);
        List<BackendBoardVO> list = boardService.getTargetBoard(pager);
        model.addAttribute("list", list);

        return "board/backend/"+target+"_board";
    }



    /**
     * common upload method
     * @return target detail page
     */
    @PostMapping("/upload")
    public String contentUpload(BackendBoardVO content) {

        List<BackendBoardFileVO> list = new ArrayList<>();
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

        String targetUrl = boardService.contentUpload(content);

        return "redirect:/back/detail/"+targetUrl;

    }


    /**
     * common delete method
     * @return target board page
     */
    @RequestMapping("/delete")
    public String contentDelete(@RequestParam(value = "contentnum") int contentNum,
                                @RequestParam(value = "langname") String returnName) {
        log.info("-----------------------val check-------------------");
        log.info(String.valueOf(contentNum));
        log.info(returnName);
        log.info("-----------------------val check-------------------");

        boardService.contentDelete(contentNum);
        return "redirect:/back/board?langname="+returnName;
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
     */
    @PostMapping("/update")
    public String contentUpdate(BackendBoardVO content, HttpServletRequest request){

        List<BackendBoardFileVO> list = new ArrayList<>();
        MultipartBinder binder = new MultipartBinder();

        for(MultipartFile paramFile : content.getParamFiles()){
            if(paramFile != null && !paramFile.isEmpty()){
                String fileName = binder.operate(paramFile);

                BackendBoardFileVO fileVO = new BackendBoardFileVO();
                fileVO.setFileName(fileName);

                list.add(fileVO);
            }
        }

        content.setParamFileList(list);

        boardService.contentUpdate(content);

        String targetUrl = request.getHeader("referer");
        return "redirect:" + targetUrl;
    }

    /**
     * common details method
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
     * @return ajax
     */
    @PostMapping("/commenteditor")
    public @ResponseBody BackendBoardCommentVO commentEditor(@RequestParam(value = "targetId") int targetId) {
        return boardService.commentEditor(targetId);
    }

    /**
     * comment update ajax
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
