package kr.ac.kopo.service;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;

import java.util.HashMap;
import java.util.List;

public interface BackendBoardService {
    List<BackendBoardVO> getJavaBoard(Pager pager);

    void contentUpload(BackendBoardVO backendBoardVO);

    void contentDelete(int contentNum);


    BackendBoardVO contentEditor(int targetNum);

    int contentUpdate(BackendBoardVO backendBoardVO);

    BackendBoardVO detailView(int contentNum);

}
