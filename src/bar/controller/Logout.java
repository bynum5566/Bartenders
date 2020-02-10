package bar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Logout {

	@RequestMapping(path = "/logout",method = RequestMethod.GET)
	public String ULogout(HttpSession session,Model m) {
		session.invalidate();
		m.addAttribute("msg", "已登出，請重新登入");
		return "LoginPage";
	}
}
