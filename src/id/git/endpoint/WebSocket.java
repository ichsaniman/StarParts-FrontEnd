package id.git.endpoint;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class WebSocket {
	
	 @OnOpen
	    public void onOpen(Session session) {
	        System.out.println("WebSocket connection opened. Session ID: " + session.getId());
	        System.out.println(session);
	    }

	    @OnMessage
	    public void onMessage(String message, Session session) {
	        System.out.println("Message received from " + session.getId() + ": " + message);

	        // Echo the received message back to the client
	        try {
	            session.getBasicRemote().sendText( message);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

	    @OnClose
	    public void onClose(Session session) {
	        System.out.println("WebSocket connection closed. Session ID: " + session.getId());
	    }
}
