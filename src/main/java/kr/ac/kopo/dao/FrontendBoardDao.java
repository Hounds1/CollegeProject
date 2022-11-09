package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.FrontendBoardVO;

import java.util.List;

public interface FrontendBoardDao {

    void contentUpload(FrontendBoardVO content);

    void contentHitter(int contentNum);

    FrontendBoardVO getContentDetail(int contentNum);

    void commentHitter(int commentTargetContentNum);

    FrontendBoardVO contentEditor(int targetNum);

    void contentUpdate(FrontendBoardVO boardVO);

    int getContentSize();

    void reverseCommentHit(int targetNum);

    int getTargetTotal(Pager pager);

    List<FrontendBoardVO> getTargetBoard(Pager pager);

    void deleteContent(int contentNum);
}
