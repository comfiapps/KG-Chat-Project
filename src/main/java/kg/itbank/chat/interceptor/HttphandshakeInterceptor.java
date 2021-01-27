package kg.itbank.chat.interceptor;

import kg.itbank.chat.controller.PathController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import java.util.Collection;
import java.util.Map;

public class HttphandshakeInterceptor extends HttpSessionHandshakeInterceptor {

    private static final Logger log = LoggerFactory.getLogger(HttphandshakeInterceptor.class);

    @Override
    public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
        attributes.put("roomId", ((ServletServerHttpRequest)request).getServletRequest().getSession().getAttribute("roomId"));
        log.info("Before HandShake {}", wsHandler);
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }




}

