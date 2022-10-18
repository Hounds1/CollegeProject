package kr.ac.kopo.dao;


import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao{

    private final SqlSession sqlSession;
    @Override
    public int memberDuplicateChk(String targetId) {
        return sqlSession.selectOne("member.memberDuplicateChk", targetId);
    }

    @Override
    public void memberNewAccount(MemberVO memberVO) {
        sqlSession.insert("member.memberNewAccount", memberVO);
    }

    @Override
    public MemberVO memberLogin(MemberVO memberVO) {
        return sqlSession.selectOne("member.memberLogin", memberVO);
    }

    @Override
    public int nickDuplicateChk(String targetNick) {
        return sqlSession.selectOne("member.nickDuplicateChk", targetNick);
    }

    @Override
    public String duplicateMemberPass(String dupMemberId) {
        return sqlSession.selectOne("member.duplicateMemberPass", dupMemberId);
    }

    @Override
    public void memberInfoUpdate(MemberVO newMemberInfo) {
        sqlSession.update("member.memberInfoUpdate", newMemberInfo);
    }

}
