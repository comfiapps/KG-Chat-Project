package kg.itbank.chat;

import kg.itbank.chat.util.JwtToken;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ChatApplicationTests {

    @Autowired
    JwtToken jwtToken;

    @Test
    void contextLoads() {
        String key = jwtToken.getToken("test");
        System.out.println(key);
        //eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJ0ZXN0IiwiaWF0IjoxNjEwNzI2ODM0fQ.mP7Cqs0YltmUXtL8YVtzK518AscHa2l_e1Pjb_IMYkk
        if(jwtToken.validateToken(key)){
            System.out.println("val: " + jwtToken.decodingToken(key));
        }

    }

}
