package bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.Company;
import bar.model.ResetPasswordService;
import bar.model.Users;

@Controller
public class VerifyController {

	private ResetPasswordService resetPasswordService;

	public VerifyController(ResetPasswordService resetPasswordService) {
		this.resetPasswordService = resetPasswordService;
	}

	@RequestMapping(path = { "/verify" }, method = { RequestMethod.GET })
	public String processAction(@RequestParam(name = "account") String account,
			@RequestParam(name = "email") String email, @RequestParam(name = "token") String token) {

		Users obuser = resetPasswordService.selectByEmail(account, email);
		obuser.getPassword().equals(token);// 對比驗證碼
		System.out.println(obuser.getPassword().equals(token));

		if (obuser.getPassword().equals(token)) {
			boolean verifyStatus = resetPasswordService.activateAccount(obuser);
			if (verifyStatus) {
				return "VerifyPage";
			}
			return "index";
		}

		return "index";
	}

	@RequestMapping(path = { "/verifyCompany" }, method = { RequestMethod.GET })
	public String processActionCompany(@RequestParam(name = "account") String account,
			@RequestParam(name = "email") String email, @RequestParam(name = "token") String token) {

		Company obcompany = resetPasswordService.selectByEmailCompany(account, email);
		obcompany.getPassword().equals(token);// 對比驗證碼
		System.out.println(obcompany.getPassword().equals(token));

		if (obcompany.getPassword().equals(token)) {
			boolean verifyStatus = resetPasswordService.activateAccountCompany(obcompany);
			if (verifyStatus) {
				return "VerifyPage";
			}
			return "index";
		}

		return "index";
	}

}
