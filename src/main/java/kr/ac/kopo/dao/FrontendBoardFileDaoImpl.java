package kr.ac.kopo.dao;

import kr.ac.kopo.vo.FrontendBoardFileVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@RequiredArgsConstructor
public class FrontendBoardFileDaoImpl implements FrontendBoardFileDao{

    private final SqlSession sqlSession;

    @Override
    public void fileUpload(FrontendBoardFileVO fileVO) {
        sqlSession.insert("frontendFile.fileUpload", fileVO);
    }

    @Override
    public List<String> getTargetFileNames(int contentNum) {
        return sqlSession.selectList("frontendFile.getTargetFileNames", contentNum);
    }

    @Override
    public void clearFiles(int contentNum) {
        sqlSession.delete("frontendFile.clearFiles", contentNum);
    }
}
