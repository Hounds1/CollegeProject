package kr.ac.kopo.dao;

import kr.ac.kopo.vo.BackendBoardFileVO;

public interface BackendBoardFileDao {
    void filesUpload(BackendBoardFileVO fileVO);

    void clearFiles(int contentNum);
}