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
	
	public List<Logistic> queryBysID(String sID) {
		return lDao.queryBysID(sID);
	}
	
	public String createLogistic(String oID,String cID,Integer type,String phone,String name,Integer amount,String address) {
		return lDao.createLogistic(oID,cID,type, phone, name, amount, address);
	}
	
	public Logistic deliverReady(String id) {
		return lDao.deliverReady(id);
	}
}
