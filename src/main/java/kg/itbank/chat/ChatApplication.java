package kg.itbank.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ChatApplication {

    public static int DEBATE_TIME = 30;

    public static void main(String[] args) {
        SpringApplication.run(ChatApplication.class, args);
    }

}