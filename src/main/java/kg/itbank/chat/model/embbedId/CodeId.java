package kg.itbank.chat.model.embbedId;

import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

}
