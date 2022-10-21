package kr.ac.kopo.service;

import kr.ac.kopo.dao.BackendBoardDao;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.BackendBoardVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BackendBoardServiceImpl implements BackendBoardService {

    private final BackendBoardDao backendBoardDao;

    @Override
    public List<BackendBoardVO> getJavaBoard(Pager pager) {
        int total = backendBoardDao.getJavaTotal(pager);

        pager.setTotal(total);

        return backendBoardDao.getJavaBoard(pager);
    }

    @Override
    public void contentUpload(BackendBoardVO backendBoardVO) {
        backendBoardVO.setContentHit(0);
        backendBoardVO.setContentCommentHit(0);
        backendBoardDao.contentUpload(backendBoardVO);
    }

    @Override
    public void contentDelete(int contentNum) {
        backendBoardDao.contentDelete(contentNum);
    }
}
