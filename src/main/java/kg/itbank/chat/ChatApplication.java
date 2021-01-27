package kg.itbank.chat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ChatApplication extends SpringBootServletInitializer {

    public static int DEBATE_TIME = 30;

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(ChatApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(ChatApplication.class, args);
    }

}