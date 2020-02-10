package bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Company;
import bar.model.CompanyService;

import bar.model.Users;
import bar.model.UsersService;

@Controller
@SessionAttributes(value = { "name", "email", "gid" })
@EnableTransactionManagement
public class GRegister {

	private UsersService uservice;
	private CompanyService cservice;

	public GRegister(UsersService uservice, CompanyService cservice) {
		this.uservice = uservice;
		this.cservice = cservice;
	}

	@RequestMapping(path = "/checkGLogin", method = RequestMethod.GET)
	public String checkGLogin(@ModelAttribute(name = "gid") String gid) {
		Users Guser = uservice.select(gid);

		if (Guser != null) {
			return "Welcome";
		} else {
			return "GRegister";
		}
	}

	@RequestMapping(path = "/Gregister.do", method = RequestMethod.POST)
	public String userProcessAction(@ModelAttribute(name = "gid") String account,
			@RequestParam(name = "newPassword") String password, @RequestParam(name = "newPassword2") String password2,
			@ModelAttribute(name = "name") String userName, @RequestParam(name = "birthday") String birthday,
			@RequestParam(name = "phone") String phone, @ModelAttribute(name = "email") String email,
			@RequestParam(name = "address") String address, Model m) {

		try {

			if (!password.equals(password2)) {
				m.addAttribute("errorMsg", "請確認密碼是否相符");
				return "GRegister";
			}

			Users Nuser = new Users(account, password, userName, birthday, phone, email, address, "member");
			uservice.insert(Nuser);

		} catch (Exception e) {
			m.addAttribute("errorMsg", "系統忙碌中，請稍後再試");
			return "GRegister";
		}
		return "Welcome";
	}

	
	@RequestMapping(path = "/checkCGLogin", method = RequestMethod.GET)
	public String checkCGLogin(@ModelAttribute(name = "gid") String gid) {
		 Company Gcompany = cservice.select(gid);

		if (Gcompany != null) {
			return "Welcome";
		} else {
			return "CGRegister";
		}
	}
	
	
	@RequestMapping(path = "/GCregister.do", method = RequestMethod.POST)
	public String userProcessAction(@ModelAttribute(name = "gid") String account,
			@RequestParam(name = "newPassword") String password, @RequestParam(name = "newPassword2") String password2,
			@RequestParam(name = "companyName") String companyName, @RequestParam(name = "taxId") String taxId,
			@RequestParam(name = "phone") String phone, @ModelAttribute(name = "email") String email,
			@RequestParam(name = "address") String address, @RequestParam(name = "lineId") String lineId,
			@RequestParam(name = "lineSecret") String lineSecret, Model m) {

		try {

			if (!password.equals(password2)) {
				m.addAttribute("errorMsg", "請確認密碼是否相符");
				return "CGRegister";
			}

			Company Ncompany = new Company(account, password, companyName, taxId, phone, email, address, lineId,
					lineSecret, "unverified");

			cservice.insert(Ncompany);

		} catch (Exception e) {
			m.addAttribute("errorMsg", "系統忙碌中，請稍後再試");
			return "CGRegister";
		}

		return "Welcome";
	}
}
