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

	public boolean checkLogin(String logisticName, String logisticPwd) {
		return aDao.checkLogin(logisticName,logisticPwd);
	}
	
	public LogisticAccount querySender(Integer senderId) {
		return aDao.querySender(senderId);
	}
	public LogisticAccount querySender(String logisticName, String logisticPwd) {
		return aDao.querySender(logisticName,logisticPwd);
	}

}
