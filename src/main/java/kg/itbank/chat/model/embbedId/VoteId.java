package kg.itbank.chat.model.embbedId;

import kg.itbank.chat.model.Room;
import kg.itbank.chat.model.User;
import kg.itbank.chat.model.Vote;
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
public class VoteId implements Serializable {
    private long userId;
    private long roomId;
}
