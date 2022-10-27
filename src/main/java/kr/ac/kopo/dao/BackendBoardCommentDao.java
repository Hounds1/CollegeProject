package kr.ac.kopo.dao;

import kr.ac.kopo.vo.BackendBoardCommentVO;

public interface BackendBoardCommentDao {
    void commentUpload(BackendBoardCommentVO commentVO);

    void removeComment(int commentNum);

    BackendBoardCommentVO commentEditor(int targetId);

    void commentUpdate(BackendBoardCommentVO commentVO);
}
