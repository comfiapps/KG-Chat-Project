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

    private long  chatRoomId;
    private ChatUserDto sender;
    private Timestamp sendTime;
    private String receiver;
    private String message;

}
