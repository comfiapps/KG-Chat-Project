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
public class ChatMsgDto {

    private long chatId;
    private String sender;
    private long senderId;
    private Timestamp sendTime;
    private Object message;
    private String messageType;

}
