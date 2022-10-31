package kr.ac.kopo.dao;


import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.FrontendBoardVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class FrontendBoardDaoImpl implements FrontendBoardDao{

    private final SqlSession sqlSession;

    @Override
    public int getJSTotal(Pager pager) {
        return sqlSession.selectOne("frontendBoard.getJSTotal", pager);
    }

    @Override
    public List<FrontendBoardVO> getJSBoard(Pager pager) {
        return sqlSession.selectList("frontendBoard.getJSBoard", pager);
    }

    @Override
    public void contentUpload(FrontendBoardVO content) {
        sqlSession.insert("frontendBoard.contentUpload", content);
    }

    @Override
    public void contentHitter(int contentNum) {
        sqlSession.update("frontendBoard.contentHitter", contentNum);
    }

    @Override
    public FrontendBoardVO getContentDetail(int contentNum) {
        return sqlSession.selectOne("frontendBoard.getContentDetail", contentNum);
    }

    @Override
    public void commentHitter(int commentTargetContentNum) {
        sqlSession.selectOne("frontendBoard.commentHitter", commentTargetContentNum);
    }

    @Override
    public FrontendBoardVO contentEditor(int targetNum) {
        return sqlSession.selectOne("frontendBoard.contentEditor", targetNum);
    }

    @Override
    public void contentUpdate(FrontendBoardVO boardVO) {
        sqlSession.update("frontendBoard.contentUpdate", boardVO);
    }

    @Override
    public int getContentSize() {
        return sqlSession.selectOne("frontendBoard.getContentSize");
    }
}
