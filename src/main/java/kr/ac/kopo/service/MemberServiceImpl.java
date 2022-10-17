package kr.ac.kopo.service;

import kr.ac.kopo.dao.MemberDao;
import kr.ac.kopo.util.PassMaker;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberDao memberDao;

    @Override
    public void memberNewAccount(MemberVO memberVO) {
        PassMaker passMaker = new PassMaker();
        memberVO.setMemberSalt(memberVO.getMemberId());
        passMaker.operate(memberVO);
        memberDao.memberNewAccount(memberVO);
    }

    @Override
    public int memberDuplicateChk(String targetId) {
        return memberDao.memberDuplicateChk(targetId);
    }

    @Override
    public boolean memberLogin(MemberVO memberVO) {
        PassMaker passMaker = new PassMaker();
        passMaker.operate(memberVO);

        MemberVO memberLogin = memberDao.memberLogin(memberVO);

        if(memberLogin != null) {
            memberVO.setMemberId(memberLogin.getMemberId());
            memberVO.setMemberNick(memberLogin.getMemberNick());
            memberVO.setMemberPass(null);
            memberVO.setMemberRegDate(memberLogin.getMemberRegDate());
            memberVO.setMemberSalt(null);
            memberVO.setMemberAuthority(memberLogin.getMemberAuthority());
            return true;
        } else
            return false;
    }

    @Override
    public int nickDuplicateChk(String targetNick) {
        return memberDao.nickDuplicateChk(targetNick);
    }
}