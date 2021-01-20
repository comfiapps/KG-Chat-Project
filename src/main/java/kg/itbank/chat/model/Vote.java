package kg.itbank.chat.model;

import kg.itbank.chat.model.embbedId.VoteId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Vote {

    @EmbeddedId
    private VoteId id;

    private long voteToId;
}
