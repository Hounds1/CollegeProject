package kr.ac.kopo.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class BackendBoardVO {
    private int contentNum;
    private String contentTitle;
    private String contentDetail;
    private String contentUploader;
    private Date contentRegDate;
    private String contentLangName;
    private int contentHit;
    private int contentCommentHit;
}
