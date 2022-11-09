package kr.ac.kopo.dao;

import kr.ac.kopo.vo.BackendBoardFileVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    @Override
    public List<String> getTargetFileNames(int contentNum) {
        return sqlSession.selectList("backendFile.getTargetFileNames", contentNum);
    }
}
