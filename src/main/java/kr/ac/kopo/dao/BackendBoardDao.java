package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;

import java.util.List;

public interface BackendBoardDao {
    List<BackendBoardVO> getJavaBoard(Pager pager);

    void contentUpload(BackendBoardVO backendBoardVO);

    void contentDelete(int contentNum);

    int getJavaTotal(Pager pager);
}
