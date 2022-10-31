package kr.ac.kopo.dao;

import kr.ac.kopo.vo.FrontendBoardCommentVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class FrontendBoardCommentDaoImpl implements FrontendBoardCommentDao{

    private final SqlSession sqlSession;

    @Override
    public void commentUpload(FrontendBoardCommentVO commentVO) {
        sqlSession.insert("frontendComment.commentUpload", commentVO);
    }

    @Override
    public FrontendBoardCommentVO commentEditor(int targetId) {
        return sqlSession.selectOne("frontendComment.commentEditor", targetId);
    }

    @Override
    public void commentUpdate(FrontendBoardCommentVO commentVO) {
        sqlSession.update("frontendComment.commentUpdate", commentVO);
    }

    @Override
    public int getCommentSize() {
        return sqlSession.selectOne("frontendComment.getCommentSize");
    }

    @Override
    public void removeComment(int commentNum) {
        sqlSession.delete("frontendComment.removeComment", commentNum);
    }
}
