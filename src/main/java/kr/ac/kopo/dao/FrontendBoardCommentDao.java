package kr.ac.kopo.dao;

import kr.ac.kopo.vo.FrontendBoardCommentVO;

public interface FrontendBoardCommentDao {
    void commentUpload(FrontendBoardCommentVO commentVO);

    FrontendBoardCommentVO commentEditor(int targetId);

    void commentUpdate(FrontendBoardCommentVO commentVO);

    int getCommentSize();

    void removeComment(int commentNum);
}
