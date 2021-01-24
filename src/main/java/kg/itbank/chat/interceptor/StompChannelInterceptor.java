package kg.itbank.chat.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;


public class StompChannelInterceptor implements ChannelInterceptor {

    private static final Logger log = LoggerFactory.getLogger(StompChannelInterceptor.class);


    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {

        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);

        //연결 메시지의 경우
        if(StompCommand.CONNECT.equals(accessor.getCommand())){
            log.info("연결됨: {}", accessor.getSessionAttributes().get("chatUser"));

        }else if(StompCommand.DISCONNECT.equals(accessor.getCommand())){
            log.info("연결이 종료됨");

        }

        return message;
    }

    @Override
    public void postSend(Message<?> message, MessageChannel channel, boolean sent) {

//        log.info("postSend-message: {}", message);
//        log.info("postSend-channel: {}", channel);

    }

    @Override
    public void afterSendCompletion(Message<?> message, MessageChannel channel, boolean sent, Exception ex) {
//        log.info("afterSendCompletion-message: {}", message);
//        log.info("afterSendCompletion-channel: {}", channel);
//        log.info("afterSendCompletion-Exception: {}", ex);
    }

    @Override
    public boolean preReceive(MessageChannel channel) {

//        log.info("channel-MessageChannel: {}", channel);

        return true;
    }

    @Override
    public Message<?> postReceive(Message<?> message, MessageChannel channel) {
//
//        log.info("postReceive-message: {}", message);
//        log.info("postReceive-channel: {}", channel);

        return message;
    }

    @Override
    public void afterReceiveCompletion(Message<?> message, MessageChannel channel, Exception ex) {

//        log.info("afterReceiveCompletion-message: {}", message);
//        log.info("afterReceiveCompletion-channel: {}", channel);
//        log.info("afterReceiveCompletion-Exception: {}", ex);

    }
}
