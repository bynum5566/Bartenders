package bar.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Users;
import bar.model.UsersService;
import util.WebSocketTest;

@Controller
@SessionAttributes(names = { "LoginStatus", "account" , "Caccount","userName"})
@EnableTransactionManagement
public class CheckLogin {

	private UsersService uservice;
	private CompanyService companyService;

	public CheckLogin(UsersService uservice,CompanyService companyService) {
		this.uservice = uservice;
		this.companyService = companyService;
	}

	@RequestMapping(path = { "/UcheckLogin.controller" }, method = { RequestMethod.POST })
	public String userProcessAction(@RequestParam(name = "userAccount") String account,
			@RequestParam(name = "userPwd") String password, Model m , HttpServletRequest request) {

		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (account == null || account.length() == 0) {
			errors.put("account", "請輸入帳號");
		}

		if (password == null || password.length() == 0) {
			errors.put("password", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "index";
		}

		m.addAttribute("account", account);
		m.addAttribute("password", password);

		boolean loginStatus1 = uservice.checkLogin(account, password);
		
		if (loginStatus1) {						
			boolean loginStatus2 = uservice.select(account).getRole().equals("member");	
			if(loginStatus2) {
				HttpSession session = request.getSession();
				WebSocketTest.setHttpSession(session);
				
				m.addAttribute("LoginStatus", "true");
				
				Users user = uservice.select(account);
				m.addAttribute("userName", user.getUserName());
				
				return "UserFirstPage";
			}
			
		}

		m.addAttribute("msg", "帳號或密碼不正確");
		return "index";
	}

	@RequestMapping(path = { "/CcheckLogin.controller" }, method = { RequestMethod.POST })
	public String companyProcessAction(@RequestParam(name = "companyAccount") String account,
			@RequestParam(name = "companyPwd") String password, Model m , HttpServletRequest request) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (account == null || account.length() == 0) {
			errors.put("Caccount", "請輸入帳號");
		}

		if (password == null || password.length() == 0) {
			errors.put("Cpassword", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "CLoginPage";
		}

		m.addAttribute("Caccount", account);
		m.addAttribute("Cpassword", password);

		boolean loginStatus = companyService.checkLogin(account, password);
		boolean loginStatus2 = companyService.select(account).getRole().equals("member");

		if (loginStatus) {
			if (loginStatus2) {
				HttpSession session = request.getSession();
				WebSocketTest.setHttpSession(session);
				
				Company Gcompany = companyService.select(account);
				m.addAttribute("Caccount", account);
				m.addAttribute("CName", Gcompany.getCompanyName());
				m.addAttribute("LoginStatus", "true");
				return "WelcomeCompany";
			} 

		}

		m.addAttribute("msg", "帳號或密碼不正確");
		return "CLoginPage";
	}
}
