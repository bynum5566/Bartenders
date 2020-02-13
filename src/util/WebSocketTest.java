package util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.ui.Model;

import com.google.gson.Gson;

import bar.model.MessageDto;

/** * @ServerEndpoint */
@ServerEndpoint("/websocketTest")
public class WebSocketTest {
	private static int onlineCount = 0;
	
//存放所有登錄用戶的Map集合，鍵：每個用戶的唯一標識（用戶名） 
	private static Map<String, WebSocketTest> webSocketMap = new HashMap<String, WebSocketTest>();

//session作為用戶建立連接的唯一會話，可以用來區別每個用戶 
	private Session session;

//httpsession用以在建立連接的時候獲取登錄用戶的唯一標識（登錄名）,獲取到之後以鍵值對的方式存在Map對象裡面 
	private static HttpSession httpSession;

	public static void setHttpSession(HttpSession httpSession) {
		WebSocketTest.httpSession = httpSession;
	}

	/** * 連接建立成功調用的方法 * @param session * 可選的參數。session為與某個客戶端的連接會話，需要通過它來給客戶端發送數據 */
	@OnOpen
	public void onOpen(Session session) {
		Gson gson = new Gson();
		this.session = session;

		String onlineUser = (String) httpSession.getAttribute("userName");
		webSocketMap.put(onlineUser, this);
		addOnlineCount();

		MessageDto md = new MessageDto();
		md.setMessageType("onlineCount");
		md.setData(onlineCount + "");
		sendOnlineCount(gson.toJson(md));
		System.out.println(getOnlineCount());
		
		
		for(Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {
			MessageDto md1 = new MessageDto();
			md1.setMessageType("onlineUser");
			md1.setData(entry.getKey());
			
			sendOnlineCount(gson.toJson(md1));
			System.out.println(entry.getKey());
		}
		
		
	}

	
	
	/** * 向所有在線用戶發送在線人數 * @param message */
	public static void sendOnlineCount(String message) {
		for (Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {
			try {
				entry.getValue().sendMessage(message);
			} catch (IOException e) {
				continue;
			}
		}
	}

	
	
	/** * 連接關閉調用的方法 */
	@OnClose
	public void onClose() {
		for (Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {
			if (entry.getValue().session == this.session) {
				webSocketMap.remove(entry.getKey());
				break;
			}
		}
		subOnlineCount();
// System.out.println(getOnlineCount()); 
	}

	
	
	/**
	 * * 伺服器接收到客戶端消息時調用的方法，（通過「@」截取接收用戶的用戶名） * * @param message * 客戶端發送過來的消息
	 * * @param session * 數據源客戶端的session
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		Gson gson = new Gson();
		System.out.println("收到客戶端的消息:" + message);
		StringBuffer messageStr = new StringBuffer(message);
		if (messageStr.indexOf("@") != -1) {
			String targetname = messageStr.substring(0, messageStr.indexOf("@"));
			String sourcename = "";
			for (Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {
//根據接收用戶名遍歷出接收對象 
				if (targetname.equals(entry.getKey())) {
					try {
						for (Entry<String, WebSocketTest> entry1 : webSocketMap.entrySet()) {
//session在這裡作為客戶端向伺服器發送信息的會話，用來辨認出信息來源 
							if (entry1.getValue().session == session) {
								sourcename = entry1.getKey();
							}
						}
						MessageDto md = new MessageDto();
						md.setMessageType("message");
						md.setData(sourcename + ":" + message.substring(messageStr.indexOf("@") + 1));
						entry.getValue().sendMessage(gson.toJson(md));
					} catch (IOException e) {
						e.printStackTrace();
						continue;
					}
				}
			}
		}
	}

	/** * 發生錯誤時調用 * * @param session * @param error */
	@OnError
	public void onError(Session session, Throwable error) {
		error.printStackTrace();
	}

	/**
	 * * 這個方法與上面幾個方法不一樣。沒有用註解，是根據自己需要添加的方法。 * * @param message * @throws IOException
	 */
	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
// this.session.getAsyncRemote().sendText(message); 
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		WebSocketTest.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		WebSocketTest.onlineCount--;
	}



}