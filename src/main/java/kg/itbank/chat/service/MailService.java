package kg.itbank.chat.service;

import lombok.AllArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MailService {

    private JavaMailSender mailSender;

    private static final String FROM_ADDRESS = "kgdiscussion@gmail.com";

    public void sendCode(String email, int code) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setFrom(MailService.FROM_ADDRESS);
        message.setSubject("이메일 변경을 위한 인증코드(Discussion)");
        message.setText("인증코드는 ["+ String.valueOf(code) + "] 입니다");


        mailSender.send(message);
    }

}
