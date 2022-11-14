package kr.ac.kopo.dao;

import kr.ac.kopo.vo.BackendBoardFileVO;

import java.util.List;

public interface BackendBoardFileDao {
    void filesUpload(BackendBoardFileVO fileVO);

    void clearFiles(int contentNum);

    List<String> getTargetFileNames(int contentNum);

}
