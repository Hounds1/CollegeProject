package kr.ac.kopo.dao;

import kr.ac.kopo.vo.FrontendBoardFileVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
@RequiredArgsConstructor
public class FrontendBoardFileDaoImpl implements FrontendBoardFileDao{

    private final SqlSession sqlSession;

    @Override
    public void fileUpload(FrontendBoardFileVO fileVO) {
        sqlSession.insert("frontendBoardFile.fileUpload", fileVO);
    }
}
