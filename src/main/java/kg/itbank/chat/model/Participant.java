package kg.itbank.chat.model;

import kg.itbank.chat.model.enums.Role;
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
public class Participant implements Serializable {

    @Id
    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    @ManyToOne
    @JoinColumn(name = "roomId")
    private Room room;

    private Role role;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User voteTo;
}
