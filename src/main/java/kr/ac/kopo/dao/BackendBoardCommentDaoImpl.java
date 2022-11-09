package kr.ac.kopo.dao;

import kr.ac.kopo.vo.BackendBoardCommentVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BackendBoardCommentDaoImpl implements BackendBoardCommentDao{

    private final SqlSession sqlSession;

    @Override
    public void commentUpload(BackendBoardCommentVO commentVO) {
        sqlSession.insert("backendComment.commentUpload", commentVO);
    }

    @Override
    public void removeComment(int commentNum) {
        sqlSession.delete("backendComment.removeComment", commentNum);
    }

    @Override
    public BackendBoardCommentVO commentEditor(int targetId) {
        return sqlSession.selectOne("backendComment.commentEditor", targetId);
    }

    @Override
    public void commentUpdate(BackendBoardCommentVO commentVO) {
        sqlSession.update("backendComment.commentUpdate", commentVO);
    }

    @Override
    public int getCommentSize() {
        return sqlSession.selectOne("backendComment.getCommentSize");
    }

    @Override
    public void clearComments(int contentNum) {
        sqlSession.delete("backendComment.clearComments");
    }
}
