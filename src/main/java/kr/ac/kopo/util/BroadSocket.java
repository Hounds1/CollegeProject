package kr.ac.kopo.util;

import org.springframework.web.socket.config.annotation.EnableWebSocket;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/chat")
public class BroadSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);
        synchronized (clients){
            for(Session client : clients){
                if(!client.equals(session)){
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }

    @OnOpen
    public void onOpen(Session session){
        System.out.println(session);
        clients.add(session);
    }

    @OnClose
    public void onClose(Session session){
        System.out.println(session);
        clients.remove(session);
    }
}
