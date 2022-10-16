package kr.ac.kopo.service;

import kr.ac.kopo.vo.MemberVO;

public interface MemberService {
    void memberNewAccount(MemberVO memberVO);

    int memberDuplicateChk(String memberId);

    boolean memberLogin(MemberVO memberVO);
}
