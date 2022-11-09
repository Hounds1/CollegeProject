package kr.ac.kopo.controller;


import kr.ac.kopo.service.QnaService;
import kr.ac.kopo.vo.QnaVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/qna")
@RequiredArgsConstructor
public class QnaController {

    private final QnaService qnaService;

    @PostMapping("/send")
    public @ResponseBody String saveQna(@RequestParam(value = "qnaName") String qnaName,
                                        @RequestParam(value = "qnaEmail") String qnaEmail,
                                        @RequestParam(value = "qnaTitle") String qnaTitle,
                                        @RequestParam(value = "qnaDetail") String qnaDetail){
        QnaVO qnaVO = new QnaVO();
        qnaVO.setQnaName(qnaName);
        qnaVO.setQnaEmail(qnaEmail);
        qnaVO.setQnaTitle(qnaTitle);
        qnaVO.setQnaDetail(qnaDetail);
        if(qnaService.saveQna(qnaVO) != 0){
            return "OK";
        } else
            return "Fail";
    }
}
