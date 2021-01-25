package kg.itbank.chat.interceptor;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;


public class UserCounter {

    private UserCounter() {
    };

    private static final HashMap<Long, Integer> roomUserCounterMap = new HashMap<Long, Integer>();

    public static int getCountRoomUser(long roomId) {
        return roomUserCounterMap.getOrDefault(roomId, 0);
    }

    public static void upCountRoomUser(long roomId) {
        roomUserCounterMap.put(roomId, roomUserCounterMap.getOrDefault(roomId, 0) + 1);
    }

    public static void downCountRoomUser(long roomId) {
        roomUserCounterMap.put(roomId, (roomUserCounterMap.get(roomId) == null? 0: roomUserCounterMap.get(roomId)-1));
    }

}
