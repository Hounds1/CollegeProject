package kr.ac.kopo.util;

import org.apache.ibatis.annotations.One;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@ServerEndpoint("/chatserver")
public class ChatServer {

    private static List<Session> list = new ArrayList<Session>();

    private void print(String msg) {
        System.out.printf("[%tT] %s\n", Calendar.getInstance(), msg);
    }

    @OnOpen
    public void handleOpen(Session session) {
        print("클라이언트 연결");
        list.add(session); // 접속자 관리(****)
    }

    @OnMessage
    public void handleMessage(String msg, Session session) {

        // connection: 1#userName
        // msg : 2userName#msg
        int index = msg.indexOf("#", 2);
        String no = msg.substring(0, 1);
        String user = msg.substring(2, index);
        String txt = msg.substring(index + 1);

        if (no.equals("1")) {
            // someone connect server
            for (Session s : list) {
                if (s != session) { // other users

                    try {
                        s.getBasicRemote().sendText("1#" + user + "#");
                        System.out.println(no + user);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            }

        } else if (no.equals("2")) {
            // someone send msg
            for (Session s : list) {

                if (s != session) { // other users
                    try {
                        s.getBasicRemote().sendText("2#" + user + " : " + txt);
                        System.out.println(msg);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }

            }
        } else if (no.equals("3")) {
            // third user connect
            for (Session s : list) {

                if (s != session) { // other users
                    try {
                        s.getBasicRemote().sendText("3#" + user + "#");
                        System.out.println(no + user);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
            list.remove(session);
        }

    }

    @OnClose
    public void handleClose() {

    }

    @OnError
    public void handleError(Throwable t) {

    }
}
