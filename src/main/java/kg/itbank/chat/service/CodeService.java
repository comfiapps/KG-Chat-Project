package kg.itbank.chat.service;

import kg.itbank.chat.model.Code;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.embbedId.CodeId;
import kg.itbank.chat.repository.CodeRepository;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Random;

@Service
public class CodeService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    CodeRepository codeRepository;

    @Transactional
    public int generateCode(long userId, String email) {
        if(userRepository.existsByEmail(email)) return -1;
        Code codeObj = codeRepository.findByIdUserId(userId);

        int code = Integer.parseInt(String.format("%06d", new Random().nextInt(999999)));

        if(codeObj == null) {
            codeRepository.save(
                    Code.builder()
                            .id(CodeId.builder()
                                    .user(userRepository.findById(userId).orElseThrow(()
                                            -> new UsernameNotFoundException("User Not Found - Id : " + userId)))
                                    .build())
                            .email(email)
                            .code(code)
                            .expireDate(null) //TODO set expire date
                            .build());
        } else {
            codeObj.setEmail(email);
            codeObj.setCode(code);
            codeObj.setExpireDate(new Timestamp(System.currentTimeMillis())); //TODO set expire date
            codeObj.setUsed(false);
        }

        return code;
    }

}
