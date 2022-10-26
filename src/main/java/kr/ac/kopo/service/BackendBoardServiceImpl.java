package kr.ac.kopo.service;

import kr.ac.kopo.dao.BackendBoardDao;
import kr.ac.kopo.dao.BackendBoardFileDao;
import kr.ac.kopo.util.MultipartBinder;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BackendBoardServiceImpl implements BackendBoardService {

    private final BackendBoardDao backendBoardDao;

    private final BackendBoardFileDao backendBoardFileDao;

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


}
