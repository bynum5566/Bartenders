package bar.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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
@SessionAttributes(names = {"account" ,"showEmail" ,"userName"})
@EnableTransactionManagement
public class UserInformationController {
	
	private UsersService uservice;

	@Autowired
	public UserInformationController(UsersService uservice) {
		this.uservice=uservice;
	}

	@RequestMapping(path = "/Users.Info",method = RequestMethod.GET)
	public String showUserInfornation(@ModelAttribute(name="account") String account,Model m) {
		
		Users ruser=uservice.select(account);
		
		m.addAttribute("showAccount", ruser.getAccount());
		m.addAttribute("showName", ruser.getUserName());
		m.addAttribute("showBirthday", ruser.getBirthday());
		m.addAttribute("showPhone", ruser.getPhone());
		m.addAttribute("showEmail", ruser.getEmail());
		m.addAttribute("showAddress",ruser.getAddress());
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "ShowUserInfo";
	}
	
	@RequestMapping(path="/resetInfo" , method = RequestMethod.GET)
	public String showResetInfo(Model m,@ModelAttribute(name="account") String account) {
		Users ruser=uservice.select(account);
		
		m.addAttribute("showAccount", ruser.getAccount());
		m.addAttribute("showName", ruser.getUserName());
		m.addAttribute("showBirthday", ruser.getBirthday());
		m.addAttribute("showPhone", ruser.getPhone());
		m.addAttribute("showEmail", ruser.getEmail());
		m.addAttribute("showAddress",ruser.getAddress());
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "ResetUserInfo";
	}
	
	@RequestMapping(path = "/resetInfo.do" , method = RequestMethod.POST)
	public void resetInfo(@RequestParam(name = "userName") String name,@ModelAttribute(name = "account") String account,
			@RequestParam(name = "phone")String phone,@RequestParam(name = "birthday")String birthday
			,@ModelAttribute(name = "showEmail")String email,@RequestParam(name = "address")String address,
			HttpServletResponse response , Model m) throws IOException {
		
		try {
			uservice.updateInfo(account, email, name, phone, birthday, address);
			m.addAttribute("userName", name);
			response.sendRedirect("/Bartenders/Users.Info");
		}catch(Exception e) {
			response.sendRedirect("/Bartenders/resetInfo");
			m.addAttribute("errorMsg", "系統異常，請稍後再試。");
		}
	}
}
