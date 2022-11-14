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
    public int changePassValChk(MemberVO memberVO) {
        return sqlSession.selectOne("member.changePassValChk", memberVO);
    }

    @Override
    public int changeNewPassVal(MemberVO memberVO) {
        return sqlSession.update("member.changeNewPassVal", memberVO);
    }

//    @Override
//    public int personalInfoChange(MemberVO memberVO) {
//        return sqlSession.update("member.personalInfoChange", memberVO);
//    }

    @Override
    public int getMemberSize() {
        return sqlSession.selectOne("member.getMemberSize");
    }

    @Override
    public int getAdminSize() {
        return sqlSession.selectOne("member.getAdminSize");
    }

    @Override
    public int deleteAccount(String targetId) {
        return sqlSession.delete("member.deleteAccount", targetId);
    }

    @Override
    public void dropMember(String memberId) {
        sqlSession.delete("member.dropMember", memberId);
    }


}
