package kr.ac.kopo.service;


import kr.ac.kopo.dao.BackendBoardCommentDao;
import kr.ac.kopo.dao.BackendBoardDao;
import kr.ac.kopo.dao.BackendBoardFileDao;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardCommentVO;
import kr.ac.kopo.vo.BackendBoardFileVO;
import kr.ac.kopo.vo.BackendBoardVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
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


    @Override
    @Transactional
    public void contentDelete(int contentNum) {
        List<String> list = backendBoardFileDao.getTargetFileNames(contentNum);

        for(String target : list){
            String filePath = "D:\\test\\upload\\" + target;

            File targetFile = new File(filePath);

            if(targetFile.exists()){
                try {
                    targetFile.delete();
                    log.info("----------------file delete log-----------------");
                    log.info(filePath);
                    log.info("delete complete");
                    log.info("----------------file delete log-----------------");
                } catch (Exception e) {
                    log.info("----------------file delete log-----------------");
                    log.info("delete fail");
                    log.info("----------------file delete log-----------------");
                    throw new RuntimeException(e);
                }
            } else {
                log.info("----------------file delete log-----------------");
                log.info("No file in directory");
                log.info("----------------file delete log-----------------");
            }
        }

        backendBoardFileDao.clearFiles(contentNum);

        backendBoardCommentDao.clearComments(contentNum);


        backendBoardDao.contentDelete(contentNum);

    }

    @Override
    public BackendBoardVO contentEditor(int targetNum) {
        return backendBoardDao.contentEditor(targetNum);
    }

    @Override
    @Transactional
    public void contentUpdate(BackendBoardVO content) {


            List<String> list = backendBoardFileDao.getTargetFileNames(content.getContentNum());

            if(!content.getParamFileList().isEmpty()) {
                for (String target : list) {
                    String filePath = "D:\\test\\upload\\" + target;

                    File targetFile = new File(filePath);

                    if (targetFile.exists()) {
                        try {
                            targetFile.delete();
                            log.info("----------------file delete log-----------------");
                            log.info(filePath);
                            log.info("delete complete");
                            log.info("----------------file delete log-----------------");
                        } catch (Exception e) {
                            log.info("----------------file delete log-----------------");
                            log.info("delete fail");
                            log.info("----------------file delete log-----------------");
                            throw new RuntimeException(e);
                        }
                    } else {
                        log.info("----------------file delete log-----------------");
                        log.info("No file in directory");
                        log.info("----------------file delete log-----------------");
                    }
                }

                backendBoardFileDao.clearFiles(content.getContentNum());

                backendBoardDao.contentUpdate(content);

                for (BackendBoardFileVO fileVO : content.getParamFileList()) {
                    fileVO.setTargetContentNum(content.getContentNum());

                    backendBoardFileDao.filesUpload(fileVO);
                }
            } else {
                backendBoardDao.contentUpdate(content);
            }
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
