package kr.ac.kopo.dao;

import kr.ac.kopo.vo.MemberVO;

public interface MemberDao {
    int memberDuplicateChk(String memberId);

    void memberNewAccount(MemberVO memberVO);

    MemberVO memberLogin(MemberVO memberVO);
}
