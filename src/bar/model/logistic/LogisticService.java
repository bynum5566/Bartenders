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

	public Logistic uniqueQuery(Object Param,Object obj) {
		String condition = "from Logistic where "+Param+"="+obj;
		System.out.println("searching condition: "+condition);
		return lDao.uniqueQuery(condition);
	}
	
	public List<Logistic> queryJoker(Object Param,Object obj){
		String condition = "from Logistic where "+Param+"="+obj;
		System.out.println("searching condition: "+condition);
		return lDao.simpleQuery(condition);
	}
	
	public List<Logistic> queryJoker(Object Param,Object obj,Object Param2,Object obj2){
		String condition = "from Logistic where "+Param+"="+obj+" and "+Param2+"="+obj2;
		System.out.println("searching condition: "+condition);
		return lDao.simpleQuery(condition);
	}
	
	///////////////以下待整理
	
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
	
	public String createLogistic(String oID,Integer cID,Integer type,String phone,String name,Integer amount,String address) {
		return lDao.createLogistic(oID,cID,type, phone, name, amount, address);
	}
	
	public Logistic deliverReady(String id) {
		return lDao.deliverReady(id);
	}
}
