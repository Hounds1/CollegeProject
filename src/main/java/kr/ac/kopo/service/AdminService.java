package kr.ac.kopo.service;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.MemberVO;

import java.util.List;

public interface AdminService {
    List<MemberVO> getMemberControl(Pager pager);

    void dropMember(String memberId);
}
