package kg.itbank.chat.service;

import kg.itbank.chat.model.User;
import kg.itbank.chat.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Transactional(readOnly = true)
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email).orElseThrow(()
                -> new UsernameNotFoundException("User Not Found - Email : " + email));
    }

    @Transactional(readOnly = true)
    public boolean existsUserByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    @Transactional
    public Long register(User user) {
        User model = User.builder()
                .email(user.getEmail())
                .name(user.getName())
                .image(user.getImage())
                .ageRange(user.getAgeRange())
                .gender(user.getGender())
                .build();

        userRepository.save(model);
        return model.getId();
    }


}
