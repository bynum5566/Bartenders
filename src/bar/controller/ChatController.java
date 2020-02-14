package bar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import util.WebSocketTest;

@Controller
public class ChatController {

	@RequestMapping(path = "/room.chat", method = RequestMethod.GET)
	public String showChat(HttpServletRequest request) {
		HttpSession session = request.getSession();
		WebSocketTest.setHttpSession(session);
		return "ChatRoom";
	}
	
	@RequestMapping(path = "/Croom.chat", method = RequestMethod.GET)
	public String showCompanyChat(HttpServletRequest request) {
		HttpSession session = request.getSession();
		WebSocketTest.setHttpSession(session);
		return "CompanyChatRoom";
	}
}
