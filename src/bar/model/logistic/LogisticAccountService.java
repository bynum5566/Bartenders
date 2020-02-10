package bar.model.logistic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogisticAccountService {

	private LogisticAccountDAO aDao;

	@Autowired
	public LogisticAccountService(LogisticAccountDAO aDao) {
		this.aDao = aDao;
	}

//	public boolean checkLogin(Account users) {
//		return aDao.checkLogin(users);
//	}
//
//	public int countUser(int number) {
//		return aDao.countUser(number);
//	}
//	
//	public List<Account> showUser(int number) {
//		return aDao.showUser(number);
//	}
}
