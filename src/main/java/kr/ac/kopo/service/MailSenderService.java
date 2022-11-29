package kr.ac.kopo.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
@RequiredArgsConstructor
@Slf4j
public class MailSenderService {

    private final JavaMailSenderImpl mailSender;

    private int authNumber;

    public void makeRandomNumber() {
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;// 6자리 난수
        authNumber = checkNum;
    }

    public String joinEmail(String email) {
        makeRandomNumber();
        String setFrom = "zoodisx@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력
        String toMail = email;
        String title = "Archivist 회원가입 인증 입니다."; // 이메일 제목
        String token = Integer.toString(authNumber);
        String content =
                "이 메일은 Archivist에서 전송된 회원인증용 이메일 입니다." +
                        "<br><br>" +
                        "링크를 클릭하면 회원인증이 완료됩니다." +
                        "<br>" +
                        "<a href=" + '"' + "http://localhost:9090/member/active_token?email=" + email + "&publictoken=" + token + '"' + ">" +
                "이 곳을 클릭하면 인증이 완료됩니다.</a><br>"
                + "<p> * 본 계정은 발신용 이메일로 답신이 불가능합니다. </p>";
        mailSend(setFrom, toMail, title, content);
        log.info("-----------------------emails away--------------------------");
        log.info("[{}] -> [{}]", setFrom, toMail);
        log.info("[{}], [{}]", email, token);
        log.info("-----------------------emails away--------------------------");
        return token;
    }

    public String editEmail(String email) {
        makeRandomNumber();
        String setFrom = "zoodisx@gmail.com";
        String toMail = email;
        String title = "Archivist 비밀번호 초기화 인증번호 이메일";
        String token = Integer.toString(authNumber);
        String content =
                "<h3>이 메일은 Archivist에서 발송된 인증용 이메일입니다.</h3>" +
                        "<br><br>" +
                        "<p>발급된 토큰 번호를 입력해주세요.</p>" +
                        "<br>" +
                        token;
        mailSend(setFrom, toMail, title, content);
        log.info("-----------------------emails away--------------------------");
        log.info("[{}] -> [{}]", setFrom, toMail);
        log.info("[{}], [{}]", email, token);
        log.info("-----------------------emails away--------------------------");
        return token;
    }

    //이메일 전송 메소드
    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);

            helper.setText(content,true);
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
