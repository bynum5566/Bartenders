package bar.model.logistic;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogisticService {

	private LogisticDAO lDao;

	@Autowired
	public LogisticService(LogisticDAO lDao) {
		this.lDao = lDao;
	}

	public List<Logistic> queryByStatus(Integer status) {
		return lDao.queryByStatus(status);
	}
	
	public List<Logistic> queryByType(int type) {
		return lDao.queryByType(type);
	}

	public List<Logistic> queryAll() {
		return lDao.queryAll();
	}
	
//	public Logistic ChangeStatus(Integer Status,Integer ID) {
//		return lDao.ChangeStatus(Status,ID);
//	}
//	
//	public Logistic ChangeType(String type,Integer ID) {
//		return lDao.ChangeType(type,ID);
//	}
	
	public Logistic createLogistic(String id,int type,String phone,String name,int amount,String address) {
		return lDao.createLogistic(id,type, phone, name, amount, address);
	}
	
	public Logistic deliverReady(String id) {
		return lDao.deliverReady(id);
	}
}
