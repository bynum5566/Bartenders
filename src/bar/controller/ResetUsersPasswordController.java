package bar.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.Session;

import org.apache.tomcat.jni.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.GmailService;
import bar.model.ResetPasswordService;
import bar.model.Users;
import bar.model.UsersService;

@Controller
@EnableTransactionManagement
public class ResetUsersPasswordController {

	private UsersService uservice;
	private ResetPasswordService resetPasswordService;

	public ResetUsersPasswordController(ResetPasswordService resetPasswordService, UsersService uservice) {

		this.resetPasswordService = resetPasswordService;
		this.uservice = uservice;
	}

	@RequestMapping(path = { "/resetPassword.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "userAccount") String account,
			@RequestParam(name = "userphone") String phone,
			@RequestParam(name = "useremail") String email, @RequestParam(name = "newPassword") String password,
			@RequestParam(name = "newPassword2") String password2, Model m) {

		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (account == null || account.length() == 0) {
			errors.put("account", "請輸入帳號");
		}

		if (email == null || email.length() == 0) {
			errors.put("email", "請輸入email");
		}
		
		if (phone == null || phone.length() == 0) {
			errors.put("phone", "請輸入手機");
		}

		if (!password.equals(password2)) {
			errors.put("pswd", "請確認密碼是否相符");
		}

		if (errors != null && !errors.isEmpty()) {
			return "ResetPassword";
		}
		
		m.addAttribute("account", account);
		m.addAttribute("email", email);
		m.addAttribute("phone", phone);
		
		Users rs = uservice.select(account);
		if(rs==null) {
			errors.put("msg", "資料不正確");	
			return "ResetPassword";
		}
		
		String rsPhone = rs.getPhone();
		if(!rsPhone.equals(phone)) {
			errors.put("msg", "資料不正確");	
			return "ResetPassword";
		}
		
		
		String rsEmail = rs.getEmail();
		boolean searchStatus = rsEmail.equals(email);

		if (searchStatus) {
			Users updateUsers = resetPasswordService.updateNewPassword(account, password);

			Session session;
			new GmailService("11129henry@gmail.com", "PassW0rd@aryido").validationLinkUsers(updateUsers);
			errors.put("msg", "請至信箱啟用帳號");

		} else {
			errors.put("msg", "帳號或email不正確");

		}
		return "ResetPassword";

	}

}
