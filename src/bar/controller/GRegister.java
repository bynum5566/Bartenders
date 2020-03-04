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

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Users;
import bar.model.UsersService;

@Controller
@SessionAttributes(value = { "userName", "email", "gid" , "CName" , "Gname","account","Caccount","getUserId","getCompanyId"})
@EnableTransactionManagement
public class GRegister {

	private UsersService uservice;
	private CompanyService cservice;

	public GRegister(UsersService uservice, CompanyService cservice) {
		this.uservice = uservice;
		this.cservice = cservice;
	}

	@RequestMapping(path = "/checkGLogin", method = RequestMethod.GET)
	public String checkGLogin(@ModelAttribute(name = "gid") String gid,Model m) {
		Users Guser = uservice.select(gid);

		if (Guser != null) {
			m.addAttribute("userName", Guser.getUserName());
			m.addAttribute("account", gid);
			m.addAttribute("getUserId", Guser.getUserId());
			
			//for websocket
			WebSocketTest.setModel(m);
			
			return "UserFirstPage";
		} else {
			return "GRegister";
		}
	}

	@RequestMapping(path = "/Gregister.do", method = RequestMethod.POST)
	public String userProcessAction(@ModelAttribute(name = "gid") String account,
			@RequestParam(name = "newPassword") String password, @RequestParam(name = "newPassword2") String password2,
			@ModelAttribute(name = "Gname") String userName, @RequestParam(name = "birthday") String birthday,
			@RequestParam(name = "phone") String phone, @ModelAttribute(name = "email") String email,
			@RequestParam(name = "address") String address, Model m ) {

		try {

			if (!password.equals(password2)) {
				m.addAttribute("errorMsg", "請確認密碼是否相符");
				return "GRegister";
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
		    
		    if(ta>=la) {
		    	m.addAttribute("errorMsg", "未滿18歲，請勿飲酒。");
				return "GRegister";
		    }

			Users Nuser = new Users(account, password, userName, birthday, phone, email, address, "member");
			Users NIuser = uservice.insert(Nuser);
			m.addAttribute("getUserId", NIuser.getUserId());
			

		} catch (Exception e) {
			m.addAttribute("errorMsg", "系統忙碌中，請稍後再試");
			return "GRegister";
		}
		m.addAttribute("userName", userName);
		m.addAttribute("account", account);
		
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "UserFirstPage";
	}

	
	@RequestMapping(path = "/checkCGLogin", method = RequestMethod.GET)
	public String checkCGLogin(@ModelAttribute(name = "gid") String gid,Model m ) {
		 Company Gcompany = cservice.select(gid);

		if (Gcompany != null) {
			m.addAttribute("CName", Gcompany.getCompanyName());
			m.addAttribute("Caccount", gid);
			m.addAttribute("getCompanyId", Gcompany.getCompanyId());
			
			//for websocket
			WebSocketTest.setModel(m);
			
			return "WelcomeCompany";
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
			@RequestParam(name = "lineSecret") String lineSecret, Model m ) {

		try {

			if (!password.equals(password2)) {
				m.addAttribute("errorMsg", "請確認密碼是否相符");
				return "CGRegister";
			}

			Company Ncompany = new Company(account, password, companyName, taxId, phone, email, address, lineId,
					lineSecret, "unverified");

			Company NIcompany = cservice.insert(Ncompany);
			m.addAttribute("getCompanyId", NIcompany.getCompanyId());

		} catch (Exception e) {
			m.addAttribute("errorMsg", "系統忙碌中，請稍後再試");
			return "CGRegister";
		}

		m.addAttribute("CName", companyName);
		m.addAttribute("Caccount", account);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "WelcomeCompany";
	}
}
