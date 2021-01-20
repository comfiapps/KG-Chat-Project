package kg.itbank.chat.model;

import kg.itbank.chat.model.embbedId.ParticipantId;
import kg.itbank.chat.model.embbedId.VoteId;
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
public class Participant {

    @EmbeddedId
    private ParticipantId id;

    @CreationTimestamp
    private Timestamp enterDate;

    private Timestamp exitDate;

}
