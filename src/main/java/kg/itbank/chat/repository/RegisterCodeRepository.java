package kg.itbank.chat.repository;

import kg.itbank.chat.model.Code;
import kg.itbank.chat.model.RegisterCode;
import kg.itbank.chat.model.enums.CodeType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisterCodeRepository extends JpaRepository<RegisterCode, Long> {
    RegisterCode findFirstByEmailAndCodeAndUsedIsFalseOrderByCreateDateDesc(String email, int code);
}
