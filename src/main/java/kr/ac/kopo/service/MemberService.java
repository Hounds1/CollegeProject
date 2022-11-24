package kr.ac.kopo.service;

import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.TokenVO;

public interface MemberService {
    void memberNewAccount(MemberVO memberVO);

    int memberDuplicateChk(String targetId);

    boolean memberLogin(MemberVO memberVO);

    int nickDuplicateChk(String targetNick);

    int changePassValChk(MemberVO memberVO);

    int changeNewPassVal(MemberVO memberVO);

    int deleteAccount(String targetId);

    void resetMemberPass(String memberId);

    boolean activeToken(TokenVO tokenVO);

    void editToken(TokenVO tokenVO);

    boolean checkToken(TokenVO tokenVO);

//    int personalInfoChange(MemberVO memberVO);
}
