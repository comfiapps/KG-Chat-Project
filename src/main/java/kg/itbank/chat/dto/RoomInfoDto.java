package kg.itbank.chat.dto;

import kg.itbank.chat.model.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoomInfoDto {
    private long roomId;

    private User owner;
    private User opponent;

    private String roomName;
    private String roomCategory;

    private Timestamp createDate;
    private Timestamp closeDate;
    private Timestamp endDebate;

    private long countOwnerVote;
    private long countOpponentVote;
}
