package kg.itbank.chat.model.embbedId;

import kg.itbank.chat.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ParticipantId implements Serializable {

    private long roomId;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

}
