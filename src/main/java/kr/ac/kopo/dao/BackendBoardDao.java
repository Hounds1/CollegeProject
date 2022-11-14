package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;

import java.util.List;

public interface BackendBoardDao {


    void contentUpload(BackendBoardVO content);

    void contentDelete(int contentNum);


    BackendBoardVO contentEditor(int targetNum);

    int contentUpdate(BackendBoardVO content);

    BackendBoardVO detailView(int contentNum);

    void contentHitter(int contentNum);

    void commentHitter(int commentTargetContentNum);


    int getContentsSize();


    void reverseCommentHit(int targetNum);

    int getTargetTotal(Pager pager);

    List<BackendBoardVO> getTargetBoard(Pager pager);


}
