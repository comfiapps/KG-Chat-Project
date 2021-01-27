package kg.itbank.chat.model.embbedId;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


public interface RoomLookup {
    long getRoomId();
    long getCount();
}
