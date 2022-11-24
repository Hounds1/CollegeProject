package kr.ac.kopo.dao;

import kr.ac.kopo.vo.TokenVO;

public interface TokenDao {
    void addToken(TokenVO tokenVO);

    int checkToken(TokenVO tokenVO);

    void removeToken(TokenVO tokenVO);
}
