package kr.ac.kopo.dao;

import kr.ac.kopo.vo.BackendBoardFileVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class BackendBoardFileDaoImpl implements BackendBoardFileDao{

    private final SqlSession sqlSession;
    @Override
    public void filesUpload(BackendBoardFileVO fileVO) {
        sqlSession.insert("backendFile.filesUpload", fileVO);
    }

    @Override
    public void clearFiles(int contentNum) {
        sqlSession.delete("backendFile.clearFiles", contentNum);
    }
}
