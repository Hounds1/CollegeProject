package kr.ac.kopo.dao;

import kr.ac.kopo.vo.TokenVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class TokenDaoImpl implements TokenDao{

    private final SqlSession sqlSession;

    @Override
    public void addToken(TokenVO tokenVO) {
        sqlSession.insert("token.addToken", tokenVO);
    }

    @Override
    public int checkToken(TokenVO tokenVO) {
        return sqlSession.selectOne("token.checkToken", tokenVO);
    }

    @Override
    public void removeToken(TokenVO tokenVO) {
        sqlSession.delete("token.removeToken", tokenVO);
    }
}
