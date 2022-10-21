package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@RequiredArgsConstructor
public class BackendBoardDaoImpl implements BackendBoardDao{

    private final SqlSession sqlSession;
    @Override
    public List<BackendBoardVO> getJavaBoard(Pager pager) {

        return sqlSession.selectList("backendBoard.getJavaBoard", pager);
    }

    @Override
    public void contentUpload(BackendBoardVO backendBoardVO) {
        sqlSession.insert("backendBoard.contentUpload", backendBoardVO);
    }

    @Override
    public void contentDelete(int contentNum) {
        sqlSession.delete("backendBoard.contentDelete", contentNum);
    }

    @Override
    public int getJavaTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getJavaTotal", pager);
    }
}
