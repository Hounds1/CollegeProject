package kr.ac.kopo.dao;

import kr.ac.kopo.vo.MemberVO;

public interface MemberDao {
    int memberDuplicateChk(String targetId);

    void memberNewAccount(MemberVO memberVO);

    MemberVO memberLogin(MemberVO memberVO);

    int nickDuplicateChk(String targetNick);

    String duplicateMemberPass(String dupMemberId);

    void memberInfoUpdate(MemberVO newMemberInfo);
}
