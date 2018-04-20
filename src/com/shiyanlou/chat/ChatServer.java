package com.shiyanlou.chat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.bind.annotation.PathVariable;

import com.google.gson.Gson;

import net.sf.json.JSONObject;


/**
 * 聊天服务器类
 * @author shiyanlou
 *
 */
@ServerEndpoint(value ="/websocket/{username}")
public class ChatServer {
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd HH:mm");  // 日期格式化
	private static Map<String, Session> sessionMap = new Hashtable<>();
	private static int i = 0;
	private Gson json = new Gson();
	@OnOpen
	public void open(Session session,@PathParam("username")String username) {
		// 添加初始化操作
		i += 1;
		sessionMap.put(""+i, session);
		System.out.println(session);
	}
	
	/**
	 * 接受客户端的消息，并把消息发送给所有连接的会话
	 * @param message 客户端发来的消息
	 * @param session 客户端的会话
	 */
	@OnMessage
	public void getMessage(String message, Session session) {
		// 把客户端的消息解析为JSON对象
		Map<String, Object> conMap = json.fromJson(message, Map.class);
		// 在消息中添加发送日期
		conMap.put("date", DATE_FORMAT.format(new Date()));
		// 把消息发送给所有连接的会话
		Set<String> keySet = sessionMap.keySet();
		for (String userName : keySet) {
			conMap.put("isSelf", false);
			// 添加本条消息是否为当前会话本身发的标志
			if(session.equals(sessionMap.get(userName))) {
				conMap.put("isSelf", true);
			}
			// 发送JSON格式的消息
			Session se = sessionMap.get(userName);
			se.getAsyncRemote().sendText(json.toJson(conMap));
		}
	}
	
	@OnClose
	public void close() {
		// 添加关闭会话时的操作
		System.out.println("我关闭了");
	}
	
	@OnError
	public void error(Throwable t) {
		// 添加处理错误的操作
	}
}
