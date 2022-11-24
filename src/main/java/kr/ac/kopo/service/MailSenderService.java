package kr.ac.kopo.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
public class MailSenderService {
    @Autowired
    private JavaMailSenderImpl mailSender;

    private int authNumber;

    public void makeRandomNumber() {
        // 난수의 범위 111111 ~ 999999 (6자리 난수)
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        System.out.println("인증번호 : " + checkNum);
        authNumber = checkNum;
    }

    public String joinEmail(String email) {
        makeRandomNumber();
        String setFrom = "zoodisx@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
        String toMail = email;
        String title = "회원가입 인증 입니다."; // 이메일 제목
        String token = Integer.toString(authNumber);
        String content =
                "홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 !
                        "<br><br>" +
                        "링크를 클릭하면 회원인증이 완료됩니다." +
                        "<br>" +
                        "<a href=" + '"' + "http://localhost:9090/member/active_token?email=" + email + "&publictoken=" + token + '"' + ">" +
                "이 곳을 클릭하면 인증이 완료됩니다.</a>";
        mailSend(setFrom, toMail, title, content);
        return token;
    }

    public String editEmail(String email) {
        makeRandomNumber();
        String setFrom = "zoodisx@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
        String toMail = email;
        String title = "비밀번호 초기화 인증번호 이메일 입니다."; // 이메일 제목
        String token = Integer.toString(authNumber);
        String content =
                "홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 !
                        "<br><br>" +
                        "발급된 토큰 번호를 입력해주세요." +
                        "<br>" +
                        token;
        mailSend(setFrom, toMail, title, content);
        return token;
    }

    //이메일 전송 메소드
    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();
        // true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
            helper.setText(content,true);
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
