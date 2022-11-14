package kr.ac.kopo.dao;

import kr.ac.kopo.util.Pager;
import kr.ac.kopo.vo.MemberVO;

import java.util.List;

public interface AdminDao {
    List<MemberVO> getMemberControl(Pager pager);

    int getMemberTotal(Pager pager);
}
