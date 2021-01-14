package kg.itbank.chat.model;

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
