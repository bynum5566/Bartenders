package bar.model.logistic;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bar.model.Orders;
import bar.model.logistic.Logistic;
@Repository
public class LogisticDAO {


	private SessionFactory sessionFactory;
	private QRCodeDAO qdao;
@Autowired
	public LogisticDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory, QRCodeDAO qdao) {
		this.sessionFactory = sessionFactory;
		this.qdao = qdao;
	}
	
	
	public Logistic createLogistic(String id,int type,String phone,String name,int amount,String address) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Logistic";
			Query query = session.createQuery(hqlStr);
			Logistic logis = new Logistic();
			String time = getTime();
			logis.setoID(id);
			logis.setlID("50001");
			logis.setoType(type);
			logis.setoAddr(address);
			logis.setoName(name);
			logis.setoPhone(phone);
			logis.setoAmount(amount);
			logis.setoStatus(1);
			logis.setoTimeA(time);
			session.save(logis);
			qdao.CreateQR(id, 1, name);
			return null;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
		
		
	}



	public List<Logistic> queryByStatus(Integer status) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Logistic where oStatus=:status";
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter("status", status);
		List<Logistic> rs = query.list();
		System.out.println(rs);
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public List<Logistic> queryByType(int type) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="from Logistic where shipping=:shipping";
		Query query = session.createQuery(hqlStr);
		query.setParameter("shipping", type);
		List<Logistic> orders = query.list();
		if(orders.size()>0) {
			return orders;
		}
		return null;
	}

	public List<Logistic> queryAll() {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="from Logistic";
		Query query = session.createQuery(hqlStr);
		List<Logistic> orders = query.list();
		if(orders.size()>0) {
			System.out.print(orders);
			return orders;
		}
		return null;
	}
	
	public Logistic deliverReady(String ID) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="from Logistic where oID=:oID";
		Query query = session.createQuery(hqlStr);
		query.setParameter("oID", ID);
		Logistic rs = (Logistic)query.uniqueResult();
		if(rs!=null) {
			System.out.println("complete status:"+rs.getoComplete());
			rs.setoComplete(1);
			System.out.println("complete status:"+rs.getoComplete());
			return rs;
		}
//		List<Logistic> rs = query.list();
//		if(rs!=null) {
//			return rs;
//		}
		return null;
	}
	
//	public Logistic ChangeType(String type,int ID) {
//		Session session = sessionFactory.getCurrentSession();
//		String hqlStr="from Logistic where oType=:type and oID=:ID";
//		Query query = session.createQuery(hqlStr);
//		query.setParameter("type", type);
//		query.setParameter("ID", ID);
//		Logistic rs = (Logistic)query.uniqueResult();
//		System.out.println("Query result:"+rs);
//		if(rs!=null) {
//			System.out.println("before update:"+rs.getoType());
//			if(rs.getoType().equals("M")) {
//				rs.setoType("H");
//			}else {
//				rs.setoType("M");
//			}
//			System.out.println("after update:"+rs.getoType());
//		}
//		System.out.println("Update completed");
//		return rs;
//	}
	
//	public Logistic ChangeStatus(int status,String ID) {
//		Session session = sessionFactory.getCurrentSession();
//		String hqlStr="from Logistic where oID=:ID and oStatus=:Status";
//		Query query = session.createQuery(hqlStr);
//		query.setParameter("ID", ID);
//		query.setParameter("Status", status);
//		Logistic rs = (Logistic)query.uniqueResult();
//		System.out.println("Query result:"+rs);
//		if(status==2) {
//			String date = getTime();
//			System.out.println("date:"+date);
//			rs.setoTimeA(date);
//			String name = rs.getoName();
//			qdao.CreateQR(ID,status,name);
//		}else if(status==3) {
//			String date = getTime();
//			System.out.println("date:"+date);
//			rs.setoTimeB(date);
//			String name = rs.getoName();
//			qdao.CreateQR(ID,status,name);
//		}else if(rs!=null&&rs.getoStatus()!=4) {
//			rs.setoStatus(status+1);
//		}
//		return rs;
//	}
	
	public String getTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		System.out.println(strDate);
		return strDate;
	}
}
