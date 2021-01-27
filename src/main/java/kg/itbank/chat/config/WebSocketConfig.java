package kg.itbank.chat.config;

import kg.itbank.chat.interceptor.HttphandshakeInterceptor;
import kg.itbank.chat.interceptor.StompChannelInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

// spring-messaging 와 spring-websocket 모듈이 필요
// maven에서 다운받읍시다.
// 개인적으로 빈으로 등록시켜서 등록도 가능하지만
// component-scan에 의해 자동적으로 빈으로 만들어짐

/*
 * @Configuration 적용
 * 
 * 1) 자바클래스를  사용한 접근 방식, 
 * new AnnotationConfigApplicationContext(SpringConfig.class);
 * 
 * 
 * 2) XML 설정 파일에 적용
 * <bean class="org.springframework.context.annotation.ConfigurationClassPostProcessor"/>
 * <bean class="mad.spring.ch4.config.SpringConfig"/>
 * 와 같이 경로를 맞추어서 작성하게되면 해당 클래스를 빈으로 생성함
 * 
 */

// STOMP 관련 환경 설정부분

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{

	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/topic", "/queue");
		config.setApplicationDestinationPrefixes("/app");
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {

		HttphandshakeInterceptor interceptor = new HttphandshakeInterceptor();
		interceptor.setCopyAllAttributes(false);
		interceptor.setCopyHttpSessionId(false);

		registry.addEndpoint("/ws")
				.addInterceptors(interceptor)	// 인터셉터 부착 : HttpSessionHandshakeInterceptor 기존 섹션의 모든 정보를 복사해 넘김
				.setAllowedOrigins("*")
				.withSockJS();
	}

	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		registration.interceptors(new StompChannelInterceptor());
	}

	//	@Override
//	public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
//		메시지에 최대 크기, 최대 대기시간, 버퍼 사이즈를 정할 수 있음
//		registry.setMessageSizeLimit(160 * 64 * 1024);	default : 64 * 1024
//		registry.setSendTimeLimit();					default : 10 * 10000
//		registry.setSendBufferSizeLimit()				default : 512 * 1024
//
//	}
}
