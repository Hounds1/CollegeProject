package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;

import java.util.List;

public interface BackendBoardDao {
    List<BackendBoardVO> getJavaBoard(Pager pager);

    void contentUpload(BackendBoardVO content);

    void contentDelete(int contentNum);

    int getJavaTotal(Pager pager);


    BackendBoardVO contentEditor(int targetNum);

    int contentUpdate(BackendBoardVO backendBoardVO);

    BackendBoardVO detailView(int contentNum);

    void contentHitter(int contentNum);

    void commentHitter(int commentTargetContentNum);

    int getPythonTotal(Pager pager);

    List<BackendBoardVO> getPythonBoard(Pager pager);

    int getContentsSize();
}
