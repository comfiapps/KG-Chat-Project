package kg.itbank.chat.repository;

import kg.itbank.chat.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    User findByEmailAndCreateDateIsNotNull(String email);

    Optional<User> findByKakaoId(int kakaoId);
    boolean existsByEmail(String email);
    boolean existsByKakaoId(int kakaoId);
}
