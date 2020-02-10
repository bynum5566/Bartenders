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

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.GmailService;
import bar.model.ResetPasswordService;
import bar.model.Users;
import bar.model.UsersService;

@Controller
@EnableTransactionManagement
public class ResetCompanyPasswordController {

	private CompanyService companyService;
	private ResetPasswordService resetPasswordService;

	public ResetCompanyPasswordController(ResetPasswordService resetPasswordService, CompanyService companyService) {

		this.resetPasswordService = resetPasswordService;
		this.companyService = companyService;
	}

	@RequestMapping(path = { "/resetCompanyPassword.controller" }, method = { RequestMethod.POST })
	public String processAction(@RequestParam(name = "companyAccount") String account,
			@RequestParam(name = "companyemail") String email, @RequestParam(name = "companyphone") String phone,
			@RequestParam(name = "taxId") String taxId, @RequestParam(name = "newPassword") String password,
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
			errors.put("phone", "請輸入電話");
		}

		if (taxId == null || taxId.length() == 0) {
			errors.put("taxId", "請輸入taxId");
		}
		if (!password.equals(password2)) {
			errors.put("pswd", "請確認密碼是否相符");
		}

		if (errors != null && !errors.isEmpty()) {
			return "ResetCompanyPassword";
		}

		m.addAttribute("account", account);
		m.addAttribute("email", email);

		Company rs = companyService.select(account);
		if(rs==null) {
			errors.put("msg", "資料不正確");
			return "ResetCompanyPassword";
		}
		
		String rsEmail = rs.getEmail();
		String rsPhone = rs.getPhone();
		String rstTaxId = rs.getTaxId();

		boolean searchStatus1 = rsEmail.equals(email);
		boolean searchStatus2 = rsPhone.equals(phone);
		boolean searchStatus3 = rstTaxId.equals(taxId);
		boolean FinallySearchStatus = searchStatus1 && searchStatus2 && searchStatus3;
		
		if (FinallySearchStatus) {
			
			Company updateCompany = resetPasswordService.updateNewPasswordCompany(account, password2);
			Session session;
			new GmailService("11129henry@gmail.com", "PassW0rd@aryido").validationLinkCompany(updateCompany);
			errors.put("msg", "請至信箱啟用帳號");

		} else {
			errors.put("msg", "資料不正確");

		}
		return "ResetCompanyPassword";

	}

}
