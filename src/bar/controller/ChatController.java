package bar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = {"userName" , "CName"})
public class ChatController {

	@RequestMapping(path = "/room.chat", method = RequestMethod.GET)
	public String showChat(HttpServletRequest request,Model m) {
		
		WebSocketTest.chatList.add((String)m.getAttribute("userName"));
		WebSocketTest.setModel(m);
		
		return "ChatRoom";
	}
	
	@RequestMapping(path = "/Croom.chat", method = RequestMethod.GET)
	public String showCompanyChat(HttpServletRequest request,Model m) {
		
		WebSocketTest.chatList.add((String)m.getAttribute("CName"));
		WebSocketTest.setModel(m);

		return "CompanyChatRoom";
	}
	
	@RequestMapping(path = "/121room.chat", method = RequestMethod.GET)
	public String show121Chat(@RequestParam(name="tarName") String tarName,
			@RequestParam(name="sourName") String sourName,Model m) {
		
		WebSocketTest.chatList.add(sourName);
		WebSocketTest.setModel(m);
		
		m.addAttribute("tarName",tarName);
		m.addAttribute("sourName",sourName);
		
		return "121ChatRoom";
	}
	
	
}
