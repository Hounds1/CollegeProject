package kr.ac.kopo.vo;

import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

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
    private List<MultipartFile> file;
    private List<BackendBoardFileVO> files;
}
