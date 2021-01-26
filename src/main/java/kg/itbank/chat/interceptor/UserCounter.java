package kg.itbank.chat.interceptor;

import java.util.HashMap;

public class UserCounter {

    private static final HashMap<Long, Integer> roomUserCounterMap = new HashMap<Long, Integer>();

    private UserCounter() {
    };

    public static int getCountRoomUser(long roomId) {
        return roomUserCounterMap.getOrDefault(roomId, 0);
    }
    public static void upCountRoomUser(long roomId) {
        roomUserCounterMap.put(roomId, roomUserCounterMap.getOrDefault(roomId, 0) + 1);
    }
    public static void downCountRoomUser(long roomId) {
        if(roomUserCounterMap.containsKey(roomId)){
            if(roomUserCounterMap.get(roomId)>2){
                roomUserCounterMap.put(roomId, roomUserCounterMap.get(roomId)-1);
            }else{
                roomUserCounterMap.remove(roomId);
            }
        }
    }
}
