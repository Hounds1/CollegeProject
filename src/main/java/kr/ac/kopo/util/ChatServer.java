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
        list.add(session);
    }

    @OnMessage
    public void handleMessage(String msg, Session session) {

        // 로그인할 때: 1#유저명
        // 대화  할 때: 2유저명#메세지
        int index = msg.indexOf("#", 2);
        String no = msg.substring(0, 1);
        String user = msg.substring(2, index);
        String txt = msg.substring(index + 1);

        if (no.equals("1")) {
            // 누군가 접속 > 1#아무개
            for (Session s : list) {
                if (s != session) { // 현재 접속자가 아닌 나머지 사람들

                    try {
                        s.getBasicRemote().sendText("1#" + user + "#");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }
            }

        } else if (no.equals("2")) {
            // 누군가 메세지를 전송
            for (Session s : list) {

                if (s != session) { // 현재 접속자가 아닌 나머지 사람들
                    try {
                        s.getBasicRemote().sendText("2#" + user + ":" + txt);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }

                }

            }
        } else if (no.equals("3")) {
            // 누군가 접속 > 3#아무개
            for (Session s : list) {

                if (s != session) { // 현재 접속자가 아닌 나머지 사람들
                    try {
                        s.getBasicRemote().sendText("3#" + user + "#");
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
    public void handleError(Throwable t){
        
    }
}
