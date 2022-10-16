package kr.ac.kopo.util;

import kr.ac.kopo.vo.MemberVO;

import java.math.BigInteger;
import java.security.MessageDigest;

public class PassMaker {

    public void operate (MemberVO memberVO) {
        String memberPass = memberVO.getMemberPass();
        String memberId = memberVO.getMemberId();

        for(int i = 0; i < 3; i++) {
            MessageDigest md = null;

            try {
                md = MessageDigest.getInstance("SHA-256");
            } catch (Exception e) {
                System.out.println(e);
            }

            md.update(memberId.getBytes());
            md.update(memberPass.getBytes());

            String hex = String.format("%064x", new BigInteger(1, md.digest()));
            memberPass = hex;
        }
        memberVO.setMemberPass(memberPass);
    }
}
