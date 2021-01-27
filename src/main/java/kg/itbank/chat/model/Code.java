package kg.itbank.chat.model;

import kg.itbank.chat.model.embbedId.CodeId;
import kg.itbank.chat.model.embbedId.ParticipantId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
public class Code {

    @EmbeddedId
    private CodeId id;

    private String email;
    private int code;
    private boolean used;
}
