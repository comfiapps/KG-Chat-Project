package kg.itbank.chat.model.embbedId;

import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.enums.CodeType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Embeddable
public class CodeId implements Serializable {

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private CodeType type;

}
