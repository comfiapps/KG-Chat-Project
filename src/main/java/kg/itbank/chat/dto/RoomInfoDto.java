package kg.itbank.chat.dto;

import kg.itbank.chat.model.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RoomInfoDto {
    private User owner;
    private User opponent;

    private String roomName;
    private String roomCategory;
    private Timestamp startDebate;
}
