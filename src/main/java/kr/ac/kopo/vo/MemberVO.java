package kr.ac.kopo.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class MemberVO {
    private int memberNum;
    private String memberId;
    private String memberNick;
    private String memberPass;
    private String memberSalt;
    private Date memberRegDate;
    private String memberAuthority;
    private String memberAuthCheck;
}
