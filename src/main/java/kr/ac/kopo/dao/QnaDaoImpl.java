package kr.ac.kopo.dao;

import kr.ac.kopo.vo.QnaVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class QnaDaoImpl implements QnaDao{

    private final SqlSession sqlSession;
    @Override
    public int saveQna(QnaVO qnaVO) {
        return sqlSession.insert("qna.saveQna", qnaVO);
    }
}
