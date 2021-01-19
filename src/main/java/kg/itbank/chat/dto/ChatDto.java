package kg.itbank.chat.dto;


import kg.itbank.chat.model.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ChatDto {

    private String token;
    private String chatRoomId;
    private String sender;
    private Timestamp sendTime;
    private String senderType;
    private String message;
    private String messageType;

}
