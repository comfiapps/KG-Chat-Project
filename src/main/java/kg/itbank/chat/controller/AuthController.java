package kg.itbank.chat.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kg.itbank.chat.config.PrincipalService;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.oauth.KakaoProfile;
import kg.itbank.chat.model.oauth.OAuthToken;
import kg.itbank.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private PrincipalService principalService;

    @Autowired
    private UserService userService;


    // TODO test login
    @GetMapping("/test/register/{name}")
    public String testRegister(@PathVariable String name) {
        User testUser = User.builder()
                .name(name)
                .kakaoId((int) (new Date().getTime()/1000))
                .email(UUID.randomUUID().toString())
                .build();
        System.out.println(testUser.toString());
        userService.register(testUser);

        UserDetails userDetails = principalService.loadUserById(userService.findUserByEmail(testUser.getEmail()).getId());
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails,
                null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return "redirect:/";
    }

    // TODO test login
    @GetMapping("/test/callback/{id}")
    public String testLogin(@PathVariable long id) {
        long currentUser;
        if(!userService.existsById(id)) return "redirect:/login";
        else currentUser = userService.findUserById(id).getId();

        UserDetails userDetails = principalService.loadUserById(currentUser);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails,
                null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return "redirect:/";
    }

    @GetMapping("/kakao/callback")
    public String kakaoCallback(HttpServletRequest request, String code) {
        String baseUrl = ServletUriComponentsBuilder.fromRequestUri(request)
                .replacePath(null)
                .build()
                .toUriString();

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Cohtent-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "2e63b44fb79b64b533648b862668b579");
        params.add("redirect_uri",  baseUrl + "/auth/kakao/callback");
        params.add("code", code);

        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
                new HttpEntity<>(params, headers);

        ResponseEntity<String> response = restTemplate.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = null;
        try {
            oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        RestTemplate restTemplate2 = new RestTemplate();

        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
                new HttpEntity<>(headers2);

        ResponseEntity<String> response2 = restTemplate2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest2,
                String.class
        );

        ObjectMapper objectMapper2 = new ObjectMapper();
        KakaoProfile kakaoProfile = null;
        try {
            kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        if(!kakaoProfile.getKakao_account().getHas_email())
            throw new IllegalArgumentException("OAuth Login Fail - Email Not Found");

        User kakaoUser = User.builder()
                .kakaoId(kakaoProfile.getId())
                .email(kakaoProfile.getKakao_account().getEmail())
                .name(kakaoProfile.getKakao_account().getProfile().getNickname())
                .image(kakaoProfile.getProperties().getProfile_image())
                .ageRange(kakaoProfile.getKakao_account().getAge_range())
                .gender(kakaoProfile.getKakao_account().getGender())
                .build();

        long currentUser;
        if(!userService.existsUserByKakaoId(kakaoUser.getKakaoId())) currentUser = userService.register(kakaoUser);
        else currentUser = userService.findUserByKakaoId(kakaoUser.getKakaoId()).getId();

        UserDetails userDetails = principalService.loadUserById(currentUser);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails,
                null, userDetails.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);

        return "redirect:/";
    }
}
