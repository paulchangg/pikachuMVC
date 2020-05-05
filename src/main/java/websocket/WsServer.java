package websocket;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/chat/{roomName}/{mId}")
public class WsServer {

    // 使用map來收集session，key為roomName，value為同一個房間的使用者集合
    // concurrentMap的key不存在時報錯，不是返回null
    private static final Map<String, Set<Session>> rooms = new ConcurrentHashMap<>();

    @OnOpen
    public void connect(@PathParam("roomName") String roomName, Session session) throws Exception {
        // 將session按照房間名來儲存，將各個房間的使用者隔離
        if (!rooms.containsKey(roomName)) {
            // 建立房間不存在時，建立房間
            Set<Session> room = new HashSet<>();
            // 新增使用者
            room.add(session);
            rooms.put(roomName, room);
        } else {
            // 房間已存在，直接新增使用者到相應的房間
            rooms.get(roomName).add(session);
        }
        System.out.println("a client has connected!");
    }

    @OnClose
    public void disConnect(@PathParam("roomName") String roomName, Session session) {
        rooms.get(roomName).remove(session);
        System.out.println("a client has disconnected!");
    }

    @OnMessage
    public void receiveMsg(@PathParam("roomName") String roomName,
    						@PathParam("mId") String mId,
                           String msg, Session session) throws Exception {
        // 此處應該有html過濾
        msg = mId + ":" + msg;
        System.out.println(msg);
        // 接收到資訊後進行廣播
        broadcast(roomName, msg);
    }

    // 按照房間名進行廣播
    public static void broadcast(String roomName, String msg) throws Exception {
        for (Session session : rooms.get(roomName)) {
                session.getBasicRemote().sendText(msg);
        }
    }

}