package id.git.endpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

import id.git.service.ListChatService;

@ServerEndpoint("/listChat")
public class ListChatEndpoint {
	 private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());
	@OnOpen
    public void onOpen(Session session) {
		 sessions.add(session);
		 String contact = ListChatService.getListChat();
		 try {
			 System.out.println(contact.toString());
			session.getBasicRemote().sendText(contact.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("WebSocket connection opened. Session ID: " + session.getId());
        System.out.println(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("Message received from " + session.getId() + ": " + message);

        // Echo the received message back to the client
        try {
            session.getBasicRemote().sendText(message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @OnClose
    public void onClose(Session session) {
    	sessions.remove(session);
    	System.out.println("WebSocket connection closed. Session ID: " + session.getId());
    }
    
    // Method to broadcast data to all connected sessions
    private static void broadcast(String message) {
        for (Session session : sessions) {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to handle database changes and trigger WebSocket broadcast
    public static void handleDatabaseChange() {
        // Logic to retrieve new data from the database
        String newData = ListChatService.getListChat();
        // Broadcast the new data to all connected sessions
        broadcast(newData);
    }
}
