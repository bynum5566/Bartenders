package bar.controller;

import java.io.IOException;
import java.util.ArrayList;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import bar.model.MessageDto;

/** * @ServerEndpoint */
@ServerEndpoint("/websocketTest")
@SessionAttributes(value = { "userName", "CName" ,"tarCA"})
public class WebSocketTest {
	// private static int onlineCount = 0;

//存所有進入聊天室者
	public static ArrayList<String> chatList = new ArrayList<String>();

//存放所有登錄用戶的Map集合，account:this 
	private static Map<String, WebSocketTest> webSocketMap = new HashMap<String, WebSocketTest>();

//session作為用戶建立連接的唯一會話，可以用來區別每個用戶 
	private Session session;

	private static Model m;

	public static void setModel(Model m) {
		WebSocketTest.m = m;
	}
	


	/** * 連接建立成功調用的方法 * @param session * 可選的參數。session為與某個客戶端的連接會話，需要通過它來給客戶端發送數據 */
	@OnOpen
	public void onOpen(Session session) {
		Gson gson = new Gson();
		this.session = session;
		

		String onlineUser = (String) m.getAttribute("userName");
		String onlineCompany = (String) m.getAttribute("CName");

		System.out.println("onlineUser:" + onlineUser);
		System.out.println("onlineCompany:" + onlineCompany);

		if (onlineUser != null && onlineUser.length() != 0) {
			webSocketMap.put(onlineUser, this);

			MessageDto md = new MessageDto();
			md.setMessageType("onlineCount");
			String count = Integer.toString(webSocketMap.size());
			md.setData(count);
			sendAll(gson.toJson(md));
			System.out.println("online count"+count);

			for (Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {
				MessageDto md1 = new MessageDto();
				md1.setMessageType("onlineUser");
				md1.setData(entry.getKey());

				sendAll(gson.toJson(md1));
				System.out.println("online:" + entry.getKey());
			}

		} else if (onlineCompany != null && onlineCompany.length() != 0) {
			webSocketMap.put(onlineCompany, this);

			MessageDto md = new MessageDto();
			md.setMessageType("onlineCount");
			String count = Integer.toString(webSocketMap.size());
			md.setData(count);
			sendAll(gson.toJson(md));
			System.out.println("online count:"+count);

			for (Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {
				MessageDto md1 = new MessageDto();
				md1.setMessageType("onlineUser");
				md1.setData(entry.getKey());

				sendAll(gson.toJson(md1));
				System.out.println("online:" + entry.getKey());
			}
			
		}

	}

	/** * 向所有在線用戶發送在線人數 * @param message */
	public static void sendAll(String message) {
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
				System.out.println(entry.getKey()+"已離線");
				break;
			}
		}
		System.out.println("websocket close...");
	}


	/**
	 * * 伺服器接收到客戶端消息時調用的方法
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		Gson gson = new Gson();
		System.out.println("收到客戶端的消息:" + message);
		StringBuffer messageStr = new StringBuffer(message);
		if (messageStr.indexOf("@") != -1) {
			String targetname = messageStr.substring(0, messageStr.indexOf("@"));
			String sourcename = "";
			
			for (Entry<String, WebSocketTest> entry1 : webSocketMap.entrySet()) {
				// session在這裡作為客戶端向伺服器發送信息的會話，用來辨認出信息來源
				if (entry1.getValue().session == session) {
					sourcename = entry1.getKey();
				}
			}
			
			for (Entry<String, WebSocketTest> entry : webSocketMap.entrySet()) {

				// 根據接收用戶名遍歷出接收對象
				System.out.println("1.根據接收用戶名遍歷出接收對象 ");

				if (targetname.equals(entry.getKey())) {

					// 判斷對方是否在聊天室
					System.out.println("2.判斷對方是否在聊天室");

					for (String inRoom : WebSocketTest.chatList) {
						System.out.println("all in room:" + inRoom);
					}

					if (WebSocketTest.chatList.contains(targetname)) {

						System.out.println("3.對方在聊天室");

						try {
							
							MessageDto md = new MessageDto();
							md.setMessageType("message");
							md.setData(sourcename + ":" + message.substring(messageStr.indexOf("@") + 1));
							entry.getValue().sendMessage(gson.toJson(md));

							System.out.println("4.送出訊息");

						} catch (IOException e) {
							e.printStackTrace();
							continue;
						}
						break;
					} else {
						System.out.println("3.對方不在聊天室");

						try {
							System.out.println("Noticify~~~");
						
							MessageDto md = new MessageDto();
							md.setMessageType("noticify");
							md.setData(targetname +"*"+ sourcename +"*" + "傳送訊息給您:" + message.substring(messageStr.indexOf("@") + 1));
							entry.getValue().sendMessage(gson.toJson(md));

							System.out.println("4.送出提醒訊息");

						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		} else if (messageStr.indexOf("%") != -1) {
			
			System.out.println("News push start.");
			
			String companyAccount = messageStr.substring(0, messageStr.indexOf("%"));
			String companyName = messageStr.substring(messageStr.indexOf("%")+1,messageStr.indexOf("*"));
			String title = messageStr.substring(messageStr.indexOf("*")+1);
			MessageDto md = new MessageDto();
			md.setMessageType("pushNews");
			md.setData(companyName + ":" + title + "*"+ companyAccount);
			sendAll(gson.toJson(md));
			
		}else if(messageStr.indexOf("#") != -1) {
			
			System.out.println("Activity push start.");
			
			String actId = messageStr.substring(0, messageStr.indexOf("#"));
			String actName = messageStr.substring(messageStr.indexOf("#")+1);
			MessageDto md = new MessageDto();
			md.setMessageType("pushAct");
			md.setData(actId+"#"+"即將舉辦:"+actName+"<br/>快來報名吧!!!");
			sendAll(gson.toJson(md));
			
		} else {
			chatList.remove(message);
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

//	public static synchronized int getOnlineCount() {
//		return onlineCount;
//	}
//
//	public static synchronized void addOnlineCount() {
//		WebSocketTest.onlineCount++;
//	}
//
//	public static synchronized void subOnlineCount() {
//		WebSocketTest.onlineCount--;
//	}

}