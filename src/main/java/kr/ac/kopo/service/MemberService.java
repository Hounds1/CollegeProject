package kr.ac.kopo.service;

import kr.ac.kopo.vo.MemberVO;

public interface MemberService {
    void memberNewAccount(MemberVO memberVO);

    int memberDuplicateChk(String targetId);

    boolean memberLogin(MemberVO memberVO);

    int nickDuplicateChk(String targetNick);

    int changePassValChk(MemberVO memberVO);

    int changeNewPassVal(MemberVO memberVO);

//    int personalInfoChange(MemberVO memberVO);
}
