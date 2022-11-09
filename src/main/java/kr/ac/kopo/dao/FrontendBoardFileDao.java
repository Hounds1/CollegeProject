package kr.ac.kopo.dao;

import kr.ac.kopo.vo.FrontendBoardFileVO;

import java.util.List;

public interface FrontendBoardFileDao {
    void fileUpload(FrontendBoardFileVO fileVO);

    List<String> getTargetFileNames(int contentNum);

    void clearFiles(int contentNum);
}
