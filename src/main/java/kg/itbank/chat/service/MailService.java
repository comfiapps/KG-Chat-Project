package kg.itbank.chat.service;

import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MailService {

    private JavaMailSender mailSender;

    private static final String FROM_ADDRESS = "kgdiscussion@gmail.com";

    public void sendCode(String title, String email, int code) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setFrom(FROM_ADDRESS);
        message.setSubject(title + " 위한 인증코드(Discussion)");
        message.setText("인증코드는 ["+ code + "] 입니다");

        mailSender.send(message);
    }

}
