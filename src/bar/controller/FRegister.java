package bar.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Users;
import bar.model.UsersService;

@Controller
@SessionAttributes(value = { "getUserId", "userName", "account" ,"LoginStatus"})
@EnableTransactionManagement
public class FRegister {

	private UsersService uservice;

	public FRegister(UsersService uservice) {
		this.uservice = uservice;
	}

	@RequestMapping(path = "/checkFLogin", method = RequestMethod.POST)
	public String checkFLogin(@RequestParam(name = "facebookAccount") String account,
			@RequestParam(name = "facebookName") String userName, @RequestParam(name = "newPassword") String password,
			Model m) {

		boolean loginStatus1 = uservice.checkLogin(account, password);

		if (loginStatus1) {

			
			Users user = uservice.select(account);
			m.addAttribute("userName", user.getUserName());

			m.addAttribute("LoginStatus", "true");
			m.addAttribute("account", account);
			m.addAttribute("userName", userName);
			
			WebSocketTest.setModel(m);

			return "UserFirstPage";

		}

		m.addAttribute("errorMsg", "密碼不正確，或未登入Facebook");
		return "FLogin";
	}

	@RequestMapping(path = "/Fregister.do", method = RequestMethod.POST)
	public String userProcessAction(@RequestParam(name = "facebookAccount") String facebookAccount,
			@RequestParam(name = "newPassword") String password, @RequestParam(name = "newPassword2") String password2,
			@RequestParam(name = "facebookName") String facebookName, @RequestParam(name = "birthday") String birthday,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "email") String email,
			@RequestParam(name = "address") String address, Model m) {


		try {

			if (!password.equals(password2)) {
				m.addAttribute("errorMsg", "請確認密碼是否相符");
				return "FRegister";
			}

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date birthDate = sdf.parse(birthday);

			Calendar c = Calendar.getInstance();
			c.setTime(birthDate);
			int ta = c.get(Calendar.YEAR);

			Calendar c1 = Calendar.getInstance();
			c1.setTime(new Date());
			c1.add(Calendar.YEAR, -18);
			int la = c1.get(Calendar.YEAR);

			if (ta >= la) {
				m.addAttribute("errorMsg", "未滿18歲，請勿飲酒。");
				return "FRegister";
			}
			
			
			

			Users Nuser = new Users(facebookAccount, password, facebookName, birthday, phone, email, address, "member");
			Users Ruser = uservice.insert(Nuser);

			if (Ruser == null) {
				m.addAttribute("errorMsg", "此帳號已註冊，請換新帳號");

				return "FRegister";
			}
			
			
			m.addAttribute("getUserId", Ruser.getUserId());

		} catch (Exception e) {
			m.addAttribute("errorMsg", "系統忙碌中，請稍後再試");
			return "FRegister";
		}

		// for websocket
		WebSocketTest.setModel(m);

		m.addAttribute("msg", "facebook註冊成功，請登入");
		return "index";
	}

}
