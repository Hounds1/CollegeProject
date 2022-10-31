package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.FrontendBoardVO;

import java.util.List;

public interface FrontendBoardDao {
    int getJSTotal(Pager pager);

    List<FrontendBoardVO> getJSBoard(Pager pager);

    void contentUpload(FrontendBoardVO content);

    void contentHitter(int contentNum);

    FrontendBoardVO getContentDetail(int contentNum);

    void commentHitter(int commentTargetContentNum);

    FrontendBoardVO contentEditor(int targetNum);

    void contentUpdate(FrontendBoardVO boardVO);

    int getContentSize();

    void reverseCommentHit(int targetNum);

    List<FrontendBoardVO> getTSBoard(Pager pager);

    int getTSTotal(Pager pager);

    int getReactTotal(Pager pager);

    List<FrontendBoardVO> getReactBoard(Pager pager);

    int getVueTotal(Pager pager);

    List<FrontendBoardVO> getVueBoard(Pager pager);

    int getAngularTotal(Pager pager);

    List<FrontendBoardVO> getAngularBoard(Pager pager);
}
