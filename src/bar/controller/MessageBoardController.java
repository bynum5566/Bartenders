package bar.controller;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.MessageBoard;

import bar.model.MessageBoardService;
import bar.model.SubMessageBoard;

import bar.model.UsersService;

@Controller
@SessionAttributes({ "LoginStatus", "account", "userName" })
@EnableTransactionManagement
public class MessageBoardController {

	private MessageBoardService messageBoardService;
	private UsersService usersService;

	public MessageBoardController(MessageBoardService messageBoardService, UsersService usersService) {
		this.messageBoardService = messageBoardService;
		this.usersService = usersService;
	}

	@RequestMapping(path = { "messageBoard.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "title") String title,
			@RequestParam(name = "blabla") String blabla, @RequestParam(name = "pdImg") String picture,
			@RequestParam(name = "deletePassword") String deletePassword, Model m,
			@ModelAttribute(name = "account") String account) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (account == null) {
			return "index";
		}

		String rightblabla = blabla.replaceAll("\n", "<br>");

		String userName = usersService.select(account).getUserName();

		m.addAttribute("userName", userName);
		m.addAttribute("account", account);
		m.addAttribute("blabla", rightblabla);
		m.addAttribute("title", title);
		m.addAttribute("picture", picture);
		m.addAttribute("deletePassword", deletePassword);

		String time = getDateTime();

		MessageBoard messageBoard = new MessageBoard(1, title, account, time, rightblabla, picture, deletePassword,
				userName, 0);
		messageBoardService.createMessage(messageBoard);

		List<MessageBoard> newest = messageBoardService.selectNewestMessage();

		m.addAttribute("newest", newest);

		// for websocket
		WebSocketTest.setModel(m);

		return "MessageBoard";

	}

	public String getDateTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss ");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		// System.out.println(strDate);
		return strDate;
	}

	@RequestMapping(path = { "messageBoardShow.controller" })
	public String processActionShow(Model m) {
		List<MessageBoard> newest = messageBoardService.selectNewestMessage();
		m.addAttribute("newest", newest);

		// for websocket
		WebSocketTest.setModel(m);

		return "MessageBoard";
	}

	@RequestMapping(path = { "messageBoardShowList.controller" })
	public String processActionShowList(Model m) {
		List<MessageBoard> newest = messageBoardService.selectNewestMessage();

		for (int i = 0; i <= newest.size() - 1; i++) {
			int id = newest.get(i).getId();
			List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(id);
			int subMessageAmount = subnewest.size();
			newest.get(i).setSubMessageAmount(subMessageAmount);
		}
		Collections.sort(newest, new Comparator<MessageBoard>() {
			public int compare(MessageBoard o1, MessageBoard o2) {
				return o2.getSubMessageAmount() - o1.getSubMessageAmount();
			}
		});

		if (newest.size() < 3) {
			m.addAttribute("famousMessageRank1title", "文章數量不夠");
			m.addAttribute("famousMessageRank2title", "文章數量不夠");
			m.addAttribute("famousMessageRank3title", "文章數量不夠");
			m.addAttribute("newest", newest);

			return "MessageBoardListMode";
		} else {
			String famousMessageRank1PitcureUrl = newest.get(0).getPicture();
			String famousMessageRank1title = newest.get(0).getTitle();

			String famousMessageRank2PitcureUrl = newest.get(1).getPicture();
			String famousMessageRank2title = newest.get(1).getTitle();

			String famousMessageRank3PitcureUrl = newest.get(2).getPicture();
			String famousMessageRank3title = newest.get(2).getTitle();

			m.addAttribute("famousMessageRank1PitcureUrl", famousMessageRank1PitcureUrl);
			m.addAttribute("famousMessageRank1title", famousMessageRank1title);

			m.addAttribute("famousMessageRank2PitcureUrl", famousMessageRank2PitcureUrl);
			m.addAttribute("famousMessageRank2title", famousMessageRank2title);

			m.addAttribute("famousMessageRank3PitcureUrl", famousMessageRank3PitcureUrl);
			m.addAttribute("famousMessageRank3title", famousMessageRank3title);

			m.addAttribute("newest", newest);
			return "MessageBoardListMode";
		}

	}

	@RequestMapping(path = { "messageBoardDelete.controller" }, method = { RequestMethod.POST })
	public String processActionDelete(@RequestParam(name = "id") int id,
			@RequestParam(name = "deletePassword") String deletePassword, Model m) {

		MessageBoard theMessage = messageBoardService.selectTheMessageOnlyById(id);
		
		if(theMessage==null) {

			List<MessageBoard> newest = messageBoardService.selectNewestMessage();

			m.addAttribute("newest", newest);

			return "MessageBoard";
		}
		
		Integer amountSubMessage = theMessage.getSubMessageAmount();						
		if (amountSubMessage==0) {			
			messageBoardService.delete(id, deletePassword);
			
			List<MessageBoard> newest = messageBoardService.selectNewestMessage();

			m.addAttribute("newest", newest);

			return "MessageBoard";
		}

		List<MessageBoard> newest = messageBoardService.selectNewestMessage();

		m.addAttribute("newest", newest);

		return "MessageBoard";

	}

}
