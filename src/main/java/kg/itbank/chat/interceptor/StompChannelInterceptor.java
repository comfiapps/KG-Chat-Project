package kg.itbank.chat.interceptor;

import kg.itbank.chat.config.PrincipalDetail;
import kg.itbank.chat.service.ParticipantService;
import kg.itbank.chat.util.ApplicationContextProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Component;


@Component
public class StompChannelInterceptor implements ChannelInterceptor {

    private static final Logger log = LoggerFactory.getLogger(StompChannelInterceptor.class);

    @Override
    public Message<?> preSend(Message<?> message, MessageChannel channel) {

        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(message);
        long roomId = (long)accessor.getSessionAttributes().get("roomId");

        //연결 메시지의 경우
        if(StompCommand.CONNECT.equals(accessor.getCommand())){
            ((ParticipantService) ApplicationContextProvider.getBean("participantService"))
                    .join(roomId, ((PrincipalDetail)((UsernamePasswordAuthenticationToken)accessor.getUser()).getPrincipal()).getUser().getId() );

        }else if(StompCommand.DISCONNECT.equals(accessor.getCommand()) && accessor.getNativeHeader("receipt") == null){
            ((ParticipantService) ApplicationContextProvider.getBean("participantService"))
                    .leave(roomId, ((PrincipalDetail)((UsernamePasswordAuthenticationToken)accessor.getUser()).getPrincipal()).getUser().getId() );
        }

        return message;
    }



}
