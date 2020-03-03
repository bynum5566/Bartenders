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
import bar.model.OrdersService;
import bar.model.logistic.Logistic;
@Repository
public class LogisticDAO {


	private SessionFactory sessionFactory;
	private QRCodeDAO qdao;
	private OrdersService oService;
@Autowired
	public LogisticDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory, QRCodeDAO qdao,OrdersService oService) {
		this.sessionFactory = sessionFactory;
		this.oService = oService;
		this.qdao = qdao;
	}
	
	
	public Logistic uniqueQuery(String condition) {
		try {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery(condition);
		Logistic rs = (Logistic)query.uniqueResult();
		System.out.println("unique result: "+rs);
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public List<Logistic> simpleQuery(String condition) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(condition);
			List<Logistic> rs = query.list();
			System.out.println("query result: "+rs);
			return rs;
			}catch(Exception e) {
				System.out.println("e:"+e);
				return null;
			}
		}

	public String createLogistic(String oID,Integer cID,Integer type,String phone,String name,Integer amount,String address) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Logistic";
			Query query = session.createQuery(hqlStr);
			Logistic logis = new Logistic();
			Date time = getTime();
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			SimpleDateFormat logisticNum = new SimpleDateFormat("yyyyMMdd");//20200217
			String forTime = sdFormat.format(time);
			String forNum = logisticNum.format(time);//20200217 年月日
			System.out.println("forTime:"+forTime+"forNum:"+forNum);
			String last = getLastNum();//2001
			String finalLast;
			if(last=="none") {
				System.out.println("尚未有訂單,today is:"+forTime.substring(8, 10)+"年月is:"+forNum.substring(2, 6));
				finalLast = forNum.substring(2, 6)+forTime.substring(8, 10)+"01"; 
			}else if(Integer.parseInt(forNum.substring(6))!=Integer.parseInt(last.substring(0, 2))){
				System.out.println("上一個訂單日為: "+Integer.parseInt(forNum.substring(6))+"比"+Integer.parseInt(last.substring(0, 2)));
				System.out.println("訂單換日,today is:"+forTime.substring(8, 10)+"年月is:"+forNum.substring(2, 6));
				finalLast = forNum.substring(2, 6)+forTime.substring(8, 10)+"01"; 
			}else{
				System.out.println("今日新訂單:");
				String pre = forNum.substring(2)+last.substring(2);
				int x = Integer.parseInt(pre)+1;
				finalLast = Integer.toString(x);
//				System.out.println("final x lID: "+x);
//				int num = Integer.parseInt(last)+1;//0301
//				String text = Integer.toString(num);
//				System.out.println("lID: "+forNum.substring(2)+" + "+text.substring(2));
//				finalLast = forNum.substring(2)+text.substring(2); 
			}
			int finalInput = Integer.parseInt(finalLast);
			System.out.println("finalLast: "+finalLast);
//			String lID = forNum
			
			logis.setoID(oID);
			logis.setlID(finalInput);
			logis.setcID(cID);
			logis.setoType(type);
			logis.setoAddr(address);
			logis.setoName(name);
			logis.setoPhone(phone);
			logis.setoAmount(amount);
			logis.setoStatus(1);
			logis.setoTimeA(forTime);
			logis.setoComplete(0);
			session.save(logis);
			qdao.CreateQR(oID, 1, name);
//			order.setShippingNumber(finalLast);
			return finalLast;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
		
		
	}

	public String getLastNum() {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Logistic ORDER BY oNo DESC";
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setMaxResults(1);
		Logistic rs = (Logistic) query.uniqueResult();
		System.out.println(rs);
		if(rs==null) {
			System.out.println("no logistic yet");
			return "none";
		}else {
			Integer last = rs.getlID();
			String num = last.toString().substring(4);
			System.out.println("last 4 num:"+num);
			return num;
		}
		
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}

	
	public boolean checkReserveTime(List<Logistic> list) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		try {
			for(Logistic logistic:list) {
				if(logistic.getoTimeR()!=null) {
					String reserveTime = logistic.getoTimeR();
					System.out.println("oTimeR : "+reserveTime);
					System.out.println("current: "+sdf.format(current));
					Date end = sdf.parse(reserveTime);
					System.out.println("deadline: "+end);
					System.out.println("now time: "+current);
					long diff=(end.getTime()-current.getTime())/(1000); //以秒計算
					System.out.println("diff is: "+diff);
					if(diff==0||diff<=0) {
						logistic.setsID(null);
						logistic.setoTimeR(null);
						System.out.println("order has been release");
					}
				}
				
			}
		}catch (Exception e){
			System.out.println("e:"+e);
			return false;
		}
		return true;
	}
	
	public List<Logistic> queryBysID(String sID) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Logistic where sID=:sID";
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter("sID", sID);
		List<Logistic> rs = query.list();
		System.out.println(rs);
		return rs;
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
	
	public Date getTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
//		String strDate = sdFormat.format(date);
//		System.out.println(strDate);
		return date;
	}
}
