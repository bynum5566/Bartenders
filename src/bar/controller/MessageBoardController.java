package bar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.tomcat.jni.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.MessageBoard;
import bar.model.MessageBoardDAO;
import bar.model.MessageBoardService;
import bar.model.UsersDAO;
import bar.model.UsersService;
import bar.model.Users;

@Controller
@SessionAttributes({ "LoginStatus", "account" })
@EnableTransactionManagement
public class MessageBoardController {

	private MessageBoardService messageBoardService;

	public MessageBoardController(MessageBoardService messageBoardService) {
		this.messageBoardService = messageBoardService;
	}

	@RequestMapping(path = { "messageBoard.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "title") String title,
			@RequestParam(name = "blabla") String blabla, 
			@RequestParam(name = "picture") String picture,
			@RequestParam(name = "deletePassword") String deletePassword,
			Model m, @ModelAttribute(name = "account") String account) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (title == null || title.length() == 0) {
			errors.put("title", "請輸入標題");
			List<MessageBoard> newest = messageBoardService.selectNewestMessage();

			m.addAttribute("newest", newest);
			return "MessageBoard";
		}
		
		
		if (blabla == null || blabla.length() == 0) {
			errors.put("blabla", "請輸入內文");
			List<MessageBoard> newest = messageBoardService.selectNewestMessage();

			m.addAttribute("newest", newest);
			return "MessageBoard";
		}
		
		if (deletePassword == null || deletePassword.length() == 0) {
			errors.put("deletePassword", "請輸入刪除鍵值");
			List<MessageBoard> newest = messageBoardService.selectNewestMessage();

			m.addAttribute("newest", newest);
			return "MessageBoard";
		}

		m.addAttribute("account", account);
		m.addAttribute("blabla", blabla);
		m.addAttribute("title", title);
		m.addAttribute("picture", picture);
		m.addAttribute("deletePassword", deletePassword);
		
		String time = getDateTime();

		MessageBoard messageBoard = new MessageBoard(1, title, account, time, blabla, picture, deletePassword);
		messageBoardService.createMessage(messageBoard);

		List<MessageBoard> newest = messageBoardService.selectNewestMessage();

		
		m.addAttribute("newest", newest);

		return "MessageBoard";

	}

	public String getDateTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		// System.out.println(strDate);
		return strDate;
	}

	@RequestMapping(path = { "messageBoardShow.controller" })
	public String processActionShow(Model m, @ModelAttribute(name = "account") String account) {
		List<MessageBoard> newest = messageBoardService.selectNewestMessage();

		m.addAttribute("newest", newest);

		return "MessageBoard";
	}

	
	@RequestMapping(path = { "messageBoardDelete.controller" }, method = { RequestMethod.POST })
	public String processActionDelete(@RequestParam(name = "id") int id, 
			@RequestParam(name = "deletePassword") String deletePassword,
			Model m, @ModelAttribute(name = "account") String account) {
	
		
		
		messageBoardService.delete(id, deletePassword);
		
		List<MessageBoard> newest = messageBoardService.selectNewestMessage();

		m.addAttribute("newest", newest);

		return "MessageBoard";
	}
	
	
	
	
}
