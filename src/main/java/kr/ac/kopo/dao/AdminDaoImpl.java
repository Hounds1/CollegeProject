package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminDaoImpl implements AdminDao{

    private final SqlSession sqlSession;
    @Override
    public List<MemberVO> getMemberControl(Pager pager) {
        return sqlSession.selectList("admin.getMemberControl",pager);
    }

    @Override
    public int getMemberTotal(Pager pager) {
        return sqlSession.selectOne("admin.getMemberTotal", pager);
    }
}
