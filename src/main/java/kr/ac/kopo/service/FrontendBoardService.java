package kr.ac.kopo.service;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.FrontendBoardCommentVO;
import kr.ac.kopo.vo.FrontendBoardVO;

import java.util.List;

public interface FrontendBoardService {
    List<FrontendBoardVO> getJSBoard(Pager pager);

    String contentUpload(FrontendBoardVO content);

    FrontendBoardVO getContentDetail(int contentNum);

    void commentUpload(FrontendBoardCommentVO commentVO);

    FrontendBoardVO contentEditor(int targetNum);

    void contentUpdate(FrontendBoardVO boardVO);

    FrontendBoardCommentVO commentEditor(int targetId);

    void commentUpdate(FrontendBoardCommentVO commentVO);

    void removeComment(int commentNum, int targetNum);

    List<FrontendBoardVO> getTSBoard(Pager pager);

    List<FrontendBoardVO> getReactBoard(Pager pager);

    List<FrontendBoardVO> getVueBoard(Pager pager);

    List<FrontendBoardVO> getAngularBoard(Pager pager);

    List<FrontendBoardVO> getTargetBoard(Pager pager);
}
