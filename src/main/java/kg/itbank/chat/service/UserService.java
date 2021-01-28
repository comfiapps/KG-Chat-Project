package kg.itbank.chat.service;

import kg.itbank.chat.model.Code;
import kg.itbank.chat.model.RegisterCode;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.enums.CodeType;
import kg.itbank.chat.repository.CodeRepository;
import kg.itbank.chat.repository.RegisterCodeRepository;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CodeRepository codeRepository;

    @Autowired
    private RegisterCodeRepository registerCodeRepository;

    @Transactional(readOnly = true)
    public User findUserById(long id) {
        return userRepository.findById(id).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Id : " + id));
    }

    @Transactional(readOnly = true)
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Email : " + email));
    }

    @Transactional(readOnly = true)
    public User findUserByKakaoId(int kakaoId) {
        return userRepository.findByKakaoId(kakaoId).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - KakaoId : " + kakaoId));
    }

    @Transactional(readOnly = true)
    public boolean existsById(long id) {
        return userRepository.existsById(id);
    }

    @Transactional(readOnly = true)
    public boolean existsUserByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Transactional(readOnly = true)
    public boolean existsUserByKakaoId(int kakaoID) {
        return userRepository.existsByKakaoId(kakaoID);
    }

    @Transactional
    public long register(User user) {
        User model = User.builder()
                .kakaoId(user.getKakaoId())
                .email(user.getEmail())
                .name(user.getName())
                .image(user.getImage())
                .ageRange(user.getAgeRange())
                .gender(user.getGender())
                .build();

        userRepository.save(model);
        return model.getId();
    }

    @Transactional
    public long registerByCode(String name, String email, int code) {
        RegisterCode codeObj = registerCodeRepository.findFirstByEmailAndCodeAndUsedIsFalseOrderByCreateDateDesc(email, code);
        if(codeObj == null) return -1;
        System.out.println(codeObj.toString());

        User model = User.builder()
                .kakaoId((int) (new Date().getTime()/1000))
                .email(email)
                .name(name)
                .build();

        userRepository.save(model);
        codeObj.setUsed(true);
        return model.getId();
    }

    @Transactional
    public long loginByCode(String email, int code) {
        User model = userRepository.findByEmail(email).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Email : " + email));
        Code codeObj = codeRepository.findByIdUserEmailAndIdTypeAndCodeEqualsAndUsedIsFalse(email, CodeType.LOGIN, code);
        if(codeObj == null) return -1;
        codeObj.setUsed(true);
        return model.getId();
    }

    @Transactional
    public long update(long id, User user, String code) {
        User model = userRepository.findById(id).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Id : " + id));

        if(user.getEmail() != null && Integer.parseInt(code) != 0) {
            Code codeObj = codeRepository.findByIdUserIdAndIdTypeAndEmailEqualsAndCodeEqualsAndUsedIsFalse(id, CodeType.MODIFY, user.getEmail(), Integer.parseInt(code));
            if(codeObj != null) {
                model.setEmail(codeObj.getEmail());
                codeObj.setUsed(true);
            } else return -1;
        }
        if(user.getName() != null) model.setName(user.getName());
        if(user.getImage() != null) model.setImage(user.getImage());
        if(user.getGender() != null) {
            if(user.getGender().equals("null")) model.setGender(null);
            else model.setGender(user.getGender());
        }
        if(user.getAgeRange() != null) model.setAgeRange(user.getAgeRange());

        return id;
    }
}
