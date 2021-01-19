package kg.itbank.chat.util;

import io.jsonwebtoken.*;
import kg.itbank.chat.controller.ChatController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtToken {

    @Value("${jwt.secret.key}")
    String key;

    private static final Logger log = LoggerFactory.getLogger(ChatController.class);

    public String getToken(String value){
        Date date = new Date();
        String jwtKey =
                Jwts.builder()
                .setId(value + ":"+date.getTime())                               // 암호화할 데이터
                .setIssuedAt(date)                          // 토큰 발행일자
//                .setExpiration()                          // 토큰 만료시간 1000L * 60 * 60 한시간 토큰 유효
                .signWith(SignatureAlgorithm.HS256, key)    // 암호화 방식
                .compact();

        return jwtKey;
    }

    public String decodingToken(String jwt){
        String result = this.getClaims(jwt).getBody().getId();
        return  result.substring(0, result.lastIndexOf(":"));
    }

    public boolean validateToken(String jwt){
        return this.getClaims(jwt) != null;
    }

    public Map<String, String> getMessageMap(String jwt){
        Map<String, String> map =  new HashMap<>();

        String[] val = decodingToken(jwt).split("/",4);
        map.put("chatId", val[0]);
        map.put("userId", val[1]);
        map.put("userName", val[2]);
        map.put("senderType", val[3]);

        return map;
    }

    private Jws<Claims> getClaims(String token){
        Jws<Claims> result = null;
        try {
            result = Jwts.parser().setSigningKey(key).parseClaimsJws(token);
        }catch (SignatureException ex) {
            log.warn("시그니처 검증 에러");
        }catch (ClaimJwtException ex){
            log.warn("JWT 권한 claim 검사 실패");
        }catch (UnsupportedJwtException ex) {
            log.warn("형식 에러");
        }catch (MalformedJwtException ex){
            log.warn("구조 에러");
        }

        return result;
    }

}
