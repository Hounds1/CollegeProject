package kr.ac.kopo.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TokenVO {

    private int tokenNum;
    private String targetId;
    private String publicToken;
}
