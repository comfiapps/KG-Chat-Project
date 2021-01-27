package kg.itbank.chat.service;

import kg.itbank.chat.model.Code;
import kg.itbank.chat.model.RegisterCode;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.embbedId.CodeId;
import kg.itbank.chat.model.enums.CodeType;
import kg.itbank.chat.repository.CodeRepository;
import kg.itbank.chat.repository.RegisterCodeRepository;
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

    @Autowired
    RegisterCodeRepository registerCodeRepository;

    @Transactional
    public int generateModifyCode(long userId, String email) {
        if(userRepository.existsByEmail(email)) return -1;
        Code codeObj = codeRepository.findByIdUserIdAndIdType(userId, CodeType.MODIFY);

        int code = Integer.parseInt(String.format("%06d", new Random().nextInt(999999)));

        if(codeObj == null) {
            codeRepository.save(
                    Code.builder()
                            .id(CodeId.builder()
                                    .user(userRepository.findById(userId).orElseThrow(()
                                            -> new UsernameNotFoundException("User Not Found - Id : " + userId)))
                                    .type(CodeType.MODIFY)
                                    .build())
                            .email(email)
                            .code(code)
                            .build());
        } else {
            codeObj.setEmail(email);
            codeObj.setCode(code);
            codeObj.setUsed(false);
        }

        return code;
    }

    @Transactional
    public int generateLoginCode(String email) {
        User user = userRepository.findByEmailAndCreateDateIsNotNull(email);
        if(user == null) return -1;

        Code codeObj = codeRepository.findByIdUserIdAndIdType(user.getId(), CodeType.LOGIN);

        int code = Integer.parseInt(String.format("%04d", new Random().nextInt(9999)));

        if(codeObj == null) {
            codeRepository.save(Code.builder()
                    .id(CodeId.builder().user(user).type(CodeType.LOGIN).build())
                    .code(code)
                    .build());
        } else {
            codeObj.setCode(code);
            codeObj.setUsed(false);
        }

        return code;
    }

    @Transactional
    public int generateRegisterCode(String email) {
        User user = userRepository.findByEmailAndCreateDateIsNotNull(email);
        if(user != null) return -1;

        int code = Integer.parseInt(String.format("%04d", new Random().nextInt(9999)));
        registerCodeRepository.save(RegisterCode.builder()
                .email(email)
                .code(code)
                .build());

        return code;
    }

}
