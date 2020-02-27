package bar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = {"userName" , "CName"})
public class ChatController {

	@RequestMapping(path = "/room.chat", method = RequestMethod.GET)
	public String showChat(HttpServletRequest request,Model m) {
//		HttpSession session = request.getSession();
//		WebSocketTest.setHttpSession(session);
		WebSocketTest.chatList.add((String)m.getAttribute("userName"));
		WebSocketTest.setModel(m);
		
		return "ChatRoom";
	}
	
	@RequestMapping(path = "/Croom.chat", method = RequestMethod.GET)
	public String showCompanyChat(HttpServletRequest request,Model m) {
//		HttpSession session = request.getSession();
//		WebSocketTest.setHttpSession(session);
		WebSocketTest.chatList.add((String)m.getAttribute("CName"));
		WebSocketTest.setModel(m);

		return "CompanyChatRoom";
	}
}
