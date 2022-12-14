package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@RequiredArgsConstructor
public class BackendBoardDaoImpl implements BackendBoardDao {

    private final SqlSession sqlSession;


    @Override
    public void contentUpload(BackendBoardVO content) {
        sqlSession.insert("backendBoard.contentUpload", content);
    }

    @Override
    public void contentDelete(int contentNum) {

        sqlSession.delete("backendBoard.contentDelete", contentNum);
    }


    @Override
    public BackendBoardVO contentEditor(int targetNum) {
        return sqlSession.selectOne("backendBoard.contentEditor", targetNum);
    }

    @Override
    public int contentUpdate(BackendBoardVO content) {
        return sqlSession.update("backendBoard.contentUpdate", content);
    }

    @Override
    public BackendBoardVO detailView(int contentNum) {
        return sqlSession.selectOne("backendBoard.detailView", contentNum);
    }

    @Override
    public void contentHitter(int contentNum) {
        sqlSession.update("backendBoard.contentHitter", contentNum);
    }

    @Override
    public void commentHitter(int commentTargetContentNum) {
        sqlSession.update("backendBoard.commentHitter", commentTargetContentNum);
    }


    @Override
    public int getContentsSize() {
        return sqlSession.selectOne("backendBoard.getContentsSize");
    }


    @Override
    public void reverseCommentHit(int targetNum) {
        sqlSession.update("backendBoard.reverseCommentHit", targetNum);
    }

    @Override
    public int getTargetTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getTargetTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getTargetBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getTargetBoard", pager);
    }



}
