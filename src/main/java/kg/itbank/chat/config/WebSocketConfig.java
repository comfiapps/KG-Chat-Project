package kg.itbank.chat.config;

import org.springframework.context.annotation.Configuration;
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
		System.out.println("실행됨");
		config.enableSimpleBroker("/topic", "queue");
		config.setApplicationDestinationPrefixes("/app");
			
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		System.out.println("등록 시도");
		registry.addEndpoint("/chat").withSockJS();
	}

}
