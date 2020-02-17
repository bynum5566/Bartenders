package bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.GmailService;
import bar.model.Users;
import bar.model.UsersService;

@Controller
@EnableTransactionManagement
public class Register {

	private UsersService uservice;
	private CompanyService cservice;

	public Register(UsersService uservice, CompanyService cservice) {
		this.uservice = uservice;
		this.cservice = cservice;
	}

	@RequestMapping(path = "/register.do", method = RequestMethod.POST)
	public String userProcessAction(@RequestParam(name = "newAccount") String account,
			@RequestParam(name = "newPassword") String password, @RequestParam(name = "newPassword2") String password2,
			@RequestParam(name = "userName") String userName, @RequestParam(name = "birthday") String birthday,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "email") String email,
			@RequestParam(name = "address") String address, Model m) {

		try {

			if (!password.equals(password2)) {
				m.addAttribute("errorMsg", "請確認密碼是否相符");
				return "Register";
			}

			Users Nuser = new Users(account, password, userName, birthday, phone, email, address, "unverified");

			Users Ruser = uservice.insert(Nuser);

			if (Ruser == null) {
				m.addAttribute("errorMsg", "此帳號已註冊，請換新帳號");

				return "Register";
			}

			m.addAttribute("msg", "註冊成功，請至信箱啟用帳號");
			new GmailService("11129henry@gmail.com", "PassW0rd@aryido").validationLinkUsers(Ruser);
			return "index";
			
		} catch (Exception e) {
			m.addAttribute("errorMsg", "系統忙碌中，請稍後再試");
			return "Register";
		}

	}

	@RequestMapping(path = "/Cregister.do", method = RequestMethod.POST)
	public String companyProcessAction(@RequestParam(name = "newAccount") String account,
			@RequestParam(name = "newPassword") String password, @RequestParam(name = "newPassword2") String password2,
			@RequestParam(name = "companyName") String companyName, @RequestParam(name = "taxId") String taxId,
			@RequestParam(name = "phone") String phone, @RequestParam(name = "email") String email,
			@RequestParam(name = "address") String address, @RequestParam(name = "lineId") String lineId,
			@RequestParam(name = "lineSecret") String lineSecret, Model m) {

		try {

			if (!password.equals(password2)) {
				m.addAttribute("CerrorMsg", "請確認密碼是否相符");
				return "CRegister";
			}

			Company Ncompany = new Company(account, password, companyName, taxId, phone, email, address, lineId,
					lineSecret, "unverified");

			Company Rcompany = cservice.insert(Ncompany);
			if (Rcompany == null) {
				m.addAttribute("CerrorMsg", "此帳號已註冊，請換新帳號");
				return "CRegister";
			}

			m.addAttribute("msg", "註冊成功，請至信箱啟用帳號");
			new GmailService("11129henry@gmail.com", "PassW0rd@aryido").validationLinkCompany(Rcompany);
			return "CLoginPage";
			
		} catch (Exception e) {
			m.addAttribute("CerrorMsg", "系統忙碌中，請稍後再試");
			return "CRegister";
		}

	}
}
