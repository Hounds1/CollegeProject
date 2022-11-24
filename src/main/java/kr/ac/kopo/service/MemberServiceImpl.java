package kr.ac.kopo.service;

import kr.ac.kopo.dao.MemberDao;
import kr.ac.kopo.dao.TokenDao;
import kr.ac.kopo.util.PassMaker;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.TokenVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

    private final MemberDao memberDao;

    private final TokenDao tokenDao;

    private final MailSenderService mailSenderService;
    @Override
    @Transactional
    public void memberNewAccount(MemberVO memberVO) {

        String token = mailSenderService.joinEmail(memberVO.getMemberId());

        TokenVO tokenVO = new TokenVO();
        tokenVO.setTargetId(memberVO.getMemberId());
        tokenVO.setPublicToken(token);
        tokenDao.addToken(tokenVO);

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

        if(memberLogin != null && memberLogin.getMemberAuthCheck().equals("Y")) {
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

    @Override
    public int deleteAccount(String targetId) {
        return memberDao.deleteAccount(targetId);
    }

    @Override
    public void resetMemberPass(String memberId) {
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberId(memberId);
        memberVO.setMemberPass(memberId);

        PassMaker passMaker = new PassMaker();
        passMaker.operate(memberVO);

        memberDao.resetMemberPass(memberVO);
    }

    @Override
    @Transactional
    public boolean activeToken(TokenVO tokenVO) {
        if(tokenDao.checkToken(tokenVO) != 0){
            memberDao.authUpdate(tokenVO.getTargetId());
            tokenDao.removeToken(tokenVO);
            return true;
        } else
            return false;

    }

    @Override
    public void editToken(TokenVO tokenVO) {
        tokenDao.addToken(tokenVO);
    }

    @Override
    @Transactional
    public boolean checkToken(TokenVO tokenVO) {
        if(tokenDao.checkToken(tokenVO) != 0){
            MemberVO memberVO = new MemberVO();
            memberVO.setMemberId(tokenVO.getTargetId());
            memberVO.setMemberPass(tokenVO.getTargetId());
            PassMaker passMaker = new PassMaker();
            passMaker.operate(memberVO);

            memberDao.resetMemberPass(memberVO);
            tokenDao.removeToken(tokenVO);
            return true;
        } else
            return false;
    }

}
