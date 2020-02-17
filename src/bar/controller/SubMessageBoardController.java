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
import bar.model.SubMessageBoard;
import bar.model.UsersDAO;
import bar.model.UsersService;
import bar.model.Users;

@Controller
@SessionAttributes({ "LoginStatus", "account", "resId", "resAccount" })
@EnableTransactionManagement
public class SubMessageBoardController {

	private MessageBoardService messageBoardService;
	private UsersService usersService;

	public SubMessageBoardController(MessageBoardService messageBoardService, UsersService usersService) {
		this.messageBoardService = messageBoardService;
		this.usersService = usersService;
	}

	@RequestMapping(path = { "subMessageBoard.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "blabla") String blabla,
			@RequestParam(name = "pdImg") String picture, @RequestParam(name = "deletePassword") String deletePassword,
			Model m, @ModelAttribute(name = "account") String account, @ModelAttribute(name = "resId") int resId,
			@ModelAttribute(name = "resAccount") String resAccount) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (blabla == null || blabla.length() == 0) {
			errors.put("blabla", "請輸入內文");

			List<MessageBoard> theMessage = messageBoardService.selectTheMessage(resAccount, resId);
			List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(resId);
			m.addAttribute("newest", theMessage);
			m.addAttribute("subnewest", subnewest);
			return "SubMessageBoard";
		}

		if (deletePassword == null || deletePassword.length() == 0) {
			errors.put("deletePassword", "請輸入刪除鍵值");

			List<MessageBoard> theMessage = messageBoardService.selectTheMessage(resAccount, resId);
			List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(resId);
			m.addAttribute("newest", theMessage);
			m.addAttribute("subnewest", subnewest);
			return "SubMessageBoard";
		}

		String rightblabla = blabla.replaceAll("\n", "<br>");
		
		String userName = usersService.select(account).getUserName();

		m.addAttribute("userName", userName);
		m.addAttribute("account", account);
		m.addAttribute("blabla", rightblabla);
		m.addAttribute("picture", picture);
		m.addAttribute("deletePassword", deletePassword);
//		m.addAttribute("resId", resId);
//		m.addAttribute("resAccount", resAccount);
		String time = getDateTime();

		SubMessageBoard subMessageBoard = new SubMessageBoard(resId, 1, account, time, rightblabla, picture,
				deletePassword,userName);
		messageBoardService.createSubMessage(subMessageBoard);

		List<MessageBoard> theMessage = messageBoardService.selectTheMessage(resAccount, resId);
		List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(resId);
		m.addAttribute("newest", theMessage);
		m.addAttribute("subnewest", subnewest);

		return "SubMessageBoard";

	}

	public String getDateTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		// System.out.println(strDate);
		return strDate;
	}

	@RequestMapping(path = { "submessageBoardShow.controller" })
	public String processActionShow(Model m, @ModelAttribute(name = "account") String account,
			@RequestParam(name = "resId") int resId, @RequestParam(name = "resAccount") String resAccount) {
//		System.out.println("resId:" + resId);
//		System.out.println("resAccount:" + resAccount);
		m.addAttribute("resId", resId);
		m.addAttribute("resAccount", resAccount);

		List<MessageBoard> theMessage = messageBoardService.selectTheMessage(resAccount, resId);
		m.addAttribute("newest", theMessage);

		List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(resId);

		m.addAttribute("subnewest", subnewest);
		return "SubMessageBoard";
	}

	@RequestMapping(path = { "subMessageBoardDelete.controller" }, method = { RequestMethod.POST })
	public String processActionDelete(@RequestParam(name = "subId") int subId,
			@RequestParam(name = "deletePassword") String deletePassword, Model m,
			@ModelAttribute(name = "account") String account, @ModelAttribute(name = "resId") int resId,
			@ModelAttribute(name = "resAccount") String resAccount) {

		messageBoardService.subDelete(subId, deletePassword);
		if (messageBoardService.subDelete(subId, deletePassword)) {
			List<MessageBoard> theMessage = messageBoardService.selectTheMessage(resAccount, resId);
			m.addAttribute("newest", theMessage);

			List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(resId);

			m.addAttribute("subnewest", subnewest);
			return "SubMessageBoard";
		}
		List<MessageBoard> theMessage = messageBoardService.selectTheMessage(resAccount, resId);
		m.addAttribute("newest", theMessage);

		List<SubMessageBoard> subnewest = messageBoardService.selectNewestSubMessage(resId);

		m.addAttribute("subnewest", subnewest);
		return "SubMessageBoard";
	}

}
