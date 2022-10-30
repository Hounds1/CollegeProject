package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@RequiredArgsConstructor
public class BackendBoardDaoImpl implements BackendBoardDao {

    private final SqlSession sqlSession;

    @Override
    public List<BackendBoardVO> getJavaBoard(Pager pager) {

        return sqlSession.selectList("backendBoard.getJavaBoard", pager);
    }

    @Override
    public void contentUpload(BackendBoardVO content) {
        sqlSession.insert("backendBoard.contentUpload", content);
    }

    @Override
    public void contentDelete(int contentNum) {

        sqlSession.delete("backendBoard.contentDelete", contentNum);
    }

    @Override
    public int getJavaTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getJavaTotal", pager);
    }

    @Override
    public BackendBoardVO contentEditor(int targetNum) {
        return sqlSession.selectOne("backendBoard.contentEditor", targetNum);
    }

    @Override
    public int contentUpdate(BackendBoardVO backendBoardVO) {
        return sqlSession.update("backendBoard.contentUpdate", backendBoardVO);
    }

    @Override
    public BackendBoardVO detailView(int contentNum) {
        return sqlSession.selectOne("backendBoard.detailView", contentNum);
    }

    @Override
    public void contentHitter(int contentNum) {
        sqlSession.update("backendBoard.contentHitter", contentNum);
    }

    @Override
    public void commentHitter(int commentTargetContentNum) {
        sqlSession.update("backendBoard.commentHitter", commentTargetContentNum);
    }

    @Override
    public int getPythonTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getPythonTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getPythonBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getPythonBoard", pager);
    }

    @Override
    public int getContentsSize() {
        return sqlSession.selectOne("backendBoard.getContentsSize");
    }

    @Override
    public int getNodeJsTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getNodeJsTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getNodeJsBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getNodeJsBoard",pager);
    }

    @Override
    public int getUmmLangTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getUmmLangTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getUmmLangBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getUmmLangBoard", pager);
    }

    @Override
    public int getRubyTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getRubyTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getRubyBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getRubyBoard", pager);
    }

    @Override
    public int getKotlinTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getKotlinTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getKotlinBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getKotlinBoard", pager);
    }

    @Override
    public int getSwiftTotal(Pager pager) {
        return sqlSession.selectOne("backendBoard.getSwiftTotal", pager);
    }

    @Override
    public List<BackendBoardVO> getSwiftBoard(Pager pager) {
        return sqlSession.selectList("backendBoard.getSwiftBoard", pager);
    }


}
