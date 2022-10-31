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

}
