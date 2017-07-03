package com.mycompany.myapp.websocket;

import java.util.List;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ChatHandler extends TextWebSocketHandler {
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatHandler.class);

	private List<WebSocketSession> list = new Vector<>(); // 멀티 스레드 환경에서는 ArrayList가 아닌 Vector를 사용한다. (더 안전)

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		LOGGER.info("실행");
		list.add(session);
	}

	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		LOGGER.info("실행");
		for(WebSocketSession wss : list){
			wss.sendMessage(message);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		LOGGER.info("실행");
		list.remove(session);
	}

}
