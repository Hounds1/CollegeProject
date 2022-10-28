package kr.ac.kopo.service;

import kr.ac.kopo.dao.MemberDao;
import kr.ac.kopo.util.PassMaker;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
            memberVO.setMemberNum(memberLogin.getMemberNum());
            memberVO.setMemberId(memberLogin.getMemberId());
            memberVO.setMemberNick(memberLogin.getMemberNick());
            memberVO.setMemberPass(null);
            memberVO.setMemberRegDate(memberLogin.getMemberRegDate());
            memberVO.setMemberSalt("dummy");
            memberVO.setMemberAuthority(memberLogin.getMemberAuthority());
            return true;
        } else
            return false;
    }

    @Override
    public int nickDuplicateChk(String targetNick) {
        return memberDao.nickDuplicateChk(targetNick);
    }

    @Override
    public int changePassValChk(MemberVO memberVO) {
        PassMaker passMaker = new PassMaker();
        passMaker.operate(memberVO);
        return memberDao.changePassValChk(memberVO);
    }

    @Override
    public int changeNewPassVal(MemberVO memberVO) {
        PassMaker passMaker = new PassMaker();
        passMaker.operate(memberVO);
        return memberDao.changeNewPassVal(memberVO);
    }

//    @Override
//    public int personalInfoChange(MemberVO memberVO) {
//        return memberDao.personalInfoChange(memberVO);
//    }


}
