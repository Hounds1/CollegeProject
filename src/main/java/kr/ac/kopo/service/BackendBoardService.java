package kr.ac.kopo.service;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardCommentVO;
import kr.ac.kopo.vo.BackendBoardVO;

import java.util.List;

public interface BackendBoardService {

    String contentUpload(BackendBoardVO content);

    void contentDelete(int contentNum);


    BackendBoardVO contentEditor(int targetNum);

    int contentUpdate(BackendBoardVO backendBoardVO);

    BackendBoardVO detailView(int contentNum);

    void commentUpload(BackendBoardCommentVO commentVO);

    void removeComment(int commentNum, int targetNum);

    BackendBoardCommentVO commentEditor(int targetId);

    void commentUpdate(BackendBoardCommentVO commentVO);

    List<BackendBoardVO> getTargetBoard(Pager pager);
}
