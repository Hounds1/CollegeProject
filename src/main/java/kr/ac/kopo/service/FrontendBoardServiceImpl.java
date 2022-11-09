package kr.ac.kopo.service;

import kr.ac.kopo.dao.FrontendBoardCommentDao;
import kr.ac.kopo.dao.FrontendBoardDao;
import kr.ac.kopo.dao.FrontendBoardFileDao;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.FrontendBoardCommentVO;
import kr.ac.kopo.vo.FrontendBoardFileVO;
import kr.ac.kopo.vo.FrontendBoardVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class FrontendBoardServiceImpl implements FrontendBoardService{

    private final FrontendBoardDao frontendBoardDao;

    private final FrontendBoardFileDao frontendFileDao;

    private final FrontendBoardCommentDao frontendCommentDao;


    @Override
    @Transactional
    public String contentUpload(FrontendBoardVO content) {
        frontendBoardDao.contentUpload(content);

        for(FrontendBoardFileVO fileVO : content.getParamFileList()){
            fileVO.setTargetContentNum(content.getContentNum());

            frontendFileDao.fileUpload(fileVO);
        }

        String targetURL = Integer.toString(content.getContentNum());
        return targetURL;
    }

    @Override
    @Transactional
    public FrontendBoardVO getContentDetail(int contentNum) {
        frontendBoardDao.contentHitter(contentNum);
        return frontendBoardDao.getContentDetail(contentNum);
    }

    @Override
    public void commentUpload(FrontendBoardCommentVO commentVO) {
        frontendBoardDao.commentHitter(commentVO.getCommentTargetContentNum());

        frontendCommentDao.commentUpload(commentVO);
    }

    @Override
    public FrontendBoardVO contentEditor(int targetNum) {
        return frontendBoardDao.contentEditor(targetNum);
    }

    @Override
    public void contentUpdate(FrontendBoardVO boardVO) {
        frontendBoardDao.contentUpdate(boardVO);
    }

    @Override
    public FrontendBoardCommentVO commentEditor(int targetId) {
        return frontendCommentDao.commentEditor(targetId);
    }

    @Override
    public void commentUpdate(FrontendBoardCommentVO commentVO) {
        frontendCommentDao.commentUpdate(commentVO);
    }

    @Override
    @Transactional
    public void removeComment(int commentNum, int targetNum) {
        frontendBoardDao.reverseCommentHit(targetNum);
        frontendCommentDao.removeComment(commentNum);
    }


    @Override
    public List<FrontendBoardVO> getTargetBoard(Pager pager) {
        int total = frontendBoardDao.getTargetTotal(pager);

        pager.setTotal(total);

        return frontendBoardDao.getTargetBoard(pager);
    }

    @Override
    @Transactional
    public void deleteContent(int contentNum) {

        List<String> list = frontendFileDao.getTargetFileNames(contentNum);

        for(String target : list){
            String filePath = "D:\\test\\upload\\" + target;

            File targetFile = new File(filePath);

            if(targetFile.exists()){
                try {
                    targetFile.delete();
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
            } else {
                log.info("target not found.");
            }
        }

        frontendFileDao.clearFiles(contentNum);
        frontendCommentDao.clearComments(contentNum);
        frontendBoardDao.deleteContent(contentNum);
    }
}
