package bar.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResetPasswordService {

	private ResetPasswordDAO resetPasswordDAO;

	@Autowired
	public ResetPasswordService(ResetPasswordDAO resetPasswordDAO) {
		this.resetPasswordDAO = resetPasswordDAO;
	}

	public Users selectByEmail(String account, String email) {
		return resetPasswordDAO.selectByEmail(account, email);
	}

	public boolean activateAccount(Users users) {
		return resetPasswordDAO.activateAccount(users);
	}

	public Users updateNewPassword(String account, String password) {
		return resetPasswordDAO.updateNewPassword(account, password);
	}

	public Company selectByEmailCompany(String account, String email) {
		return resetPasswordDAO.selectByEmailCompany(account, email);
	}

	public boolean activateAccountCompany(Company company) {
		return resetPasswordDAO.activateAccountCompany(company);
	}

	public Company updateNewPasswordCompany(String account, String password) {
		return resetPasswordDAO.updateNewPasswordCompany(account, password);
	}
}
