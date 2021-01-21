package kg.itbank.chat.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;


// 엔티티 객체들은 변경되면 하이버네이트에의해 자동적으로 DB와 접근하여 값을 변경시킴
//

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity     // 해당 클래스가 엔티티 클래스임을 명시하는 어노에티션 -> 하이버네이트가 이를 읽음
@Builder
public class Chat {

    @Id //@Id : 해당 변수는 식별키라는 것을 정의하는 어노테이션
    @GeneratedValue(strategy = GenerationType.AUTO) // 설정한 전략에 따라 키를 자동 생성한다는 어노테이션
    private long id;    // 식별자 이면서 자동으로 키를 생성하겠다라는 의미

    private long roomId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userId")
    private User user;

    @Lob
    private String content;

    @CreationTimestamp
    private Timestamp createDate;
}
