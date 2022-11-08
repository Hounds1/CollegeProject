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
    @Transactional
    public String contentUpload(BackendBoardVO content) {
        backendBoardDao.contentUpload(content);

        for (BackendBoardFileVO fileVO : content.getParamFileList()) {
            fileVO.setTargetContentNum(content.getContentNum());

            backendBoardFileDao.filesUpload(fileVO);
        }

        String targetUrl = Integer.toString(content.getContentNum());

        return targetUrl;
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
    @Transactional
    public BackendBoardVO detailView(int contentNum) {
        backendBoardDao.contentHitter(contentNum);

        return backendBoardDao.detailView(contentNum);
    }

    @Override
    @Transactional
    public void commentUpload(BackendBoardCommentVO commentVO) {
        backendBoardDao.commentHitter(commentVO.getCommentTargetContentNum());

        backendBoardCommentDao.commentUpload(commentVO);
    }

    @Override
    @Transactional
    public void removeComment(int commentNum, int targetNum) {
        backendBoardCommentDao.removeComment(commentNum);
        backendBoardDao.reverseCommentHit(targetNum);
    }

    @Override
    public BackendBoardCommentVO commentEditor(int targetId) {
        return backendBoardCommentDao.commentEditor(targetId);
    }

    @Override
    public void commentUpdate(BackendBoardCommentVO commentVO) {
        backendBoardCommentDao.commentUpdate(commentVO);
    }



    @Override
    public List<BackendBoardVO> getTargetBoard(Pager pager) {
        int total = backendBoardDao.getTargetTotal(pager);

        pager.setTotal(total);

        return backendBoardDao.getTargetBoard(pager);
    }


}
