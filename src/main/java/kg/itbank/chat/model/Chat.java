package kg.itbank.chat.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Chat {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @ManyToOne
    @JoinColumn(name = "roomId")
    private Room room;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @Lob
    private String content;

    @CreationTimestamp
    private Timestamp createDate;
}
