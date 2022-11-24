package kr.ac.kopo.dao;

import kr.ac.kopo.vo.MemberVO;

public interface MemberDao {
    int memberDuplicateChk(String targetId);

    void memberNewAccount(MemberVO memberVO);

    MemberVO memberLogin(MemberVO memberVO);

    int nickDuplicateChk(String targetNick);


    int changePassValChk(MemberVO memberVO);

    int changeNewPassVal(MemberVO memberVO);

//    int personalInfoChange(MemberVO memberVO);

    int getMemberSize();

    int getAdminSize();

    int deleteAccount(String targetId);

    void dropMember(String memberId);

    void resetMemberPass(MemberVO memberVO);

    void authUpdate(String targetId);
}
