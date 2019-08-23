package com.solfood.controller;


import java.util.ArrayList;

import java.util.List;


import org.slf4j.Logger;

import org.slf4j.LoggerFactory;

import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler{

private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);

private List<WebSocketSession> connectedUsers;

public EchoHandler() {
	connectedUsers = new ArrayList<WebSocketSession>();
}

	/*
	 * 접속 관련 이벤트
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info(session.getId() + "님 접속");
		logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
		connectedUsers.add(session);
		System.out.println(connectedUsers);
		
	}
	
	/*
	 * 2가지 이벤트 처리
	 * 1. send : 클라이언트가 서버에게 메시지 보냄
	 * 2. Emit : 서버에 연결되어 있는 클라이언트들에게 메세지 보냄
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// Payload = 사용자가 보낸 메시지
		logger.info(session.getId() + "님이 메시지 전송" + message.getPayload());
		
		for(WebSocketSession wsSession : connectedUsers) {
			//보낸 사용자는 받지 않기 위한 조건문
			if(!session.getId().equals(wsSession)) {
				wsSession.sendMessage( new TextMessage(message.getPayload()));
			}
		}
	}
	
	/*
	 * 클라이언트가 서버와 연결 종료
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info(session.getId() + "님 접속 종료");
		connectedUsers.remove(session);
	}
}

