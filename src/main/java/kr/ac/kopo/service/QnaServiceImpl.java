package kr.ac.kopo.service;

import kr.ac.kopo.dao.QnaDao;
import kr.ac.kopo.vo.QnaVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService{

    private final QnaDao qnaDao;
    @Override
    public int saveQna(QnaVO qnaVO) {
        return qnaDao.saveQna(qnaVO);
    }
}
