package kr.ac.kopo.vo;


import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class QnaVO {

    private int qnaNum;
    private String qnaName;
    private String qnaEmail;
    private String qnaTitle;
    private String qnaDetail;
    private Date qnaYmdhms;

}
