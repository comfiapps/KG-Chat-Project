package kg.itbank.chat.model;

import kg.itbank.chat.model.embbedId.ParticipantId;
import kg.itbank.chat.model.enums.Role;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
public class Participant {

    @Id
    private ParticipantId id;

    private Role role;
    private long voteTo; // userId
}
