package kr.ac.kopo.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BackendBoardCommentLikeVO {
    private int likeNum;
    private int targetNum;
    private String memberNick;
    private String targetMemberNick;
    private int likeType;
}
