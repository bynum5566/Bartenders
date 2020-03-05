package bar.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
@SessionAttributes(names = { "LoginStatus", "account" , "Caccount","userName","CName","getUserId","getCompanyId"})
@EnableTransactionManagement
public class CheckLogin {

	private UsersService uservice;
	private CompanyService companyService;

	public CheckLogin(UsersService uservice,CompanyService companyService) {
		this.uservice = uservice;
		this.companyService = companyService;
	}

	@RequestMapping(path = { "/UcheckLogin.controller" }, method = { RequestMethod.POST })
	public String userProcessAction(@RequestParam(name = "userAccount") String account,@RequestParam(name = "requestOrderId") String orderId,
			@RequestParam(name = "userPwd") String password, Model m ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(orderId.equals("")) {
			System.out.println("this is normal login: "+orderId);
		}else {
			System.out.println("order catched: "+orderId);
		}
		
		
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
				
				
				m.addAttribute("LoginStatus", "true");
				
				Users user = uservice.select(account);
				m.addAttribute("userName", user.getUserName());
				////////新增回傳Id方便撈其他資料////////////
				m.addAttribute("getUserId", user.getUserId());
				if(orderId.equals("")) {
					System.out.println("this is normal login");
				}else {
					System.out.println("prepare to redirect, orderId: "+orderId);
					response.sendRedirect("/Bartenders/LogisticArrive.do?orderID="+orderId+"&userId="+user.getUserId());
					return null;
				}
//				HttpSession session = request.getSession();
//				WebSocketTest.setHttpSession(session);
				WebSocketTest.setModel(m);
				
				
				return "UserFirstPage";
			}
			
		}

		m.addAttribute("msg", "帳號、密碼不正確，或未啟用信箱");
		return "index";
	}

	@RequestMapping(path = { "/CcheckLogin.controller" }, method = { RequestMethod.POST })
	public String companyProcessAction(@RequestParam(name = "companyAccount") String account,
			@RequestParam(name = "companyPwd") String password, Model m ,HttpServletRequest request) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (account == null || account.length() == 0) {
			errors.put("Caccount", "請輸入帳號");
		}

		if (password == null || password.length() == 0) {
			errors.put("Cpassword", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "index";
		}

		m.addAttribute("Caccount", account);
		m.addAttribute("Cpassword", password);

		boolean loginStatus = companyService.checkLogin(account, password);
		

		if (loginStatus) {
			boolean loginStatus2 = companyService.select(account).getRole().equals("member");
			if (loginStatus2) {
				
				
				Company Gcompany = companyService.select(account);
				m.addAttribute("Caccount", account);
				m.addAttribute("CName", Gcompany.getCompanyName());
				m.addAttribute("LoginStatus", "true");
				////////新增回傳Id方便撈其他資料////////////
				m.addAttribute("getCompanyId", Gcompany.getCompanyId());
				
//				HttpSession session = request.getSession();
//				WebSocketTest.setHttpSession(session);
				WebSocketTest.setModel(m);
				
				
				
				return "WelcomeCompany";
			} 

		}

		m.addAttribute("msg", "帳號或密碼不正確");
		return "index";
	}
	
	// ---(吳昭蓉)-------------------------------
	@RequestMapping(path = { "/search.Bar" }, method = { RequestMethod.GET })
	public String searchCompany(@RequestParam(name = "KWord") String keyword, Model m ) {
		String res = companyService.searchBarResult(keyword);
		m.addAttribute("kWord", keyword);
		m.addAttribute("barRes", res);
		return "searchBarResult";
	}
	
}
