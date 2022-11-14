package kr.ac.kopo.service;

import kr.ac.kopo.dao.AdminDao;
import kr.ac.kopo.dao.MemberDao;
import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{

    private final AdminDao adminDao;

    private final MemberDao memberDao;
    @Override
    public List<MemberVO> getMemberControl(Pager pager) {
        int total = adminDao.getMemberTotal(pager);

        pager.setTotal(total);

        return adminDao.getMemberControl(pager);
    }

    @Override
    public void dropMember(String memberId) {
        memberDao.dropMember(memberId);
    }
}
