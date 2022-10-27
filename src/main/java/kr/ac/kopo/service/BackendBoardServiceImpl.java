package kr.ac.kopo.service;

import kr.ac.kopo.dao.BackendBoardCommentDao;
import kr.ac.kopo.dao.BackendBoardDao;
import kr.ac.kopo.dao.BackendBoardFileDao;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardCommentVO;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BackendBoardServiceImpl implements BackendBoardService {

    private final BackendBoardDao backendBoardDao;

    private final BackendBoardFileDao backendBoardFileDao;

    private final BackendBoardCommentDao backendBoardCommentDao;

    @Override
    public List<BackendBoardVO> getJavaBoard(Pager pager) {
        int total = backendBoardDao.getJavaTotal(pager);

        pager.setTotal(total);

        return backendBoardDao.getJavaBoard(pager);
    }

    @Override
    @Transactional
    public void contentUpload(BackendBoardVO content) {
        int hitSet = 0;
        content.setContentHit(hitSet);
        content.setContentCommentHit(hitSet);
        backendBoardDao.contentUpload(content);

        for (BackendBoardFileVO fileVO : content.getParamFileList()) {
            fileVO.setTargetContentNum(content.getContentNum());

            backendBoardFileDao.filesUpload(fileVO);
        }

    }

    @Transactional
    @Override
    public void contentDelete(int contentNum) {
        backendBoardFileDao.clearFiles(contentNum);

        backendBoardDao.contentDelete(contentNum);
    }

    @Override
    public BackendBoardVO contentEditor(int targetNum) {
        return backendBoardDao.contentEditor(targetNum);
    }

    @Override
    public int contentUpdate(BackendBoardVO backendBoardVO) {
        return backendBoardDao.contentUpdate(backendBoardVO);
    }

    @Override
    public BackendBoardVO detailView(int contentNum) {
        backendBoardDao.contentHitter(contentNum);
        return backendBoardDao.detailView(contentNum);
    }

    @Override
    public void commentUpload(BackendBoardCommentVO commentVO) {
        backendBoardCommentDao.commentUpload(commentVO);
    }

    @Override
    public void removeComment(int commentNum) {
        backendBoardCommentDao.removeComment(commentNum);
    }

    @Override
    public BackendBoardCommentVO commentEditor(int targetId) {
        return backendBoardCommentDao.commentEditor(targetId);
    }

    @Override
    public void commentUpdate(BackendBoardCommentVO commentVO) {
        backendBoardCommentDao.commentUpdate(commentVO);
    }


}
