package kr.ac.kopo.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class FrontendBoardCommentVO {
    private int commentNum;
    private String commentUploader;
    private Date commentRegDate;
    private String commentDetail;
    private int contentNum;
}
