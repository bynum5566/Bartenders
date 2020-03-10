package bar.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAO {

	private SessionFactory sessionFactory;
	private Orders orders;

	@Autowired
	public OrdersDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean updateStatusAndQR(String orderId, Integer status, String qrUrl) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update Orders set status=:status,qrUrl=:qrUrl where orderId=:orderId";
		try {	
			Query query = session.createQuery(hqlStr);
			query.setParameter("status", status);
			query.setParameter("qrUrl", qrUrl);
			query.setParameter("orderId", orderId);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateToCancel(String orderId, Integer status) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update Orders set status=:status where orderId=:orderId";
		try {	
			Query query = session.createQuery(hqlStr);
			query.setParameter("status", status);
			query.setParameter("orderId", orderId);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean update(String orderId, Integer amount, String recipient, Integer shipping, String address1,
			String address2, String phone) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update Orders set amount=:amount,recipient=:recipient,shipping=:shipping,address1=:address1,address2=:address2,phone=:phone where orderId=:orderId";
		try {
			Query query = session.createQuery(hqlStr);
			query.setParameter("orderId", orderId);
			query.setParameter("amount", amount);
			query.setParameter("recipient", recipient);
			query.setParameter("shipping", shipping);
			query.setParameter("address1", address1);
			query.setParameter("address2", address2);
			query.setParameter("phone", phone);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
			e.printStackTrace();
		}
		return false;
	}

	public List<Orders> select(Integer companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Orders where companyId=:companyId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("companyId", companyId);
		return (List<Orders>) query.list();
	}

	public List<Orders> selectLoginUser(Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Orders where userId=:userId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("userId", userId);
		return (List<Orders>) query.list();
	}

	public List<Orders> selectUser(Integer userId, Integer status) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "From Orders where userId=:userId and status=:status";
		Query query = session.createQuery(hqlStr);
		query.setParameter("userId", userId);
		query.setParameter("status", status);
		return (List<Orders>) query.list();
	}

	public Orders selectOrder(String orderId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Orders where orderId=:orderId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("orderId", orderId);
		Orders rs = (Orders) query.uniqueResult();
		return rs;
	}

	public List<Orders> selectCompany(Integer companyId, Integer status) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "From Orders where companyId=:company and status=:oStatus";
		Query query = session.createQuery(hqlStr);
		query.setParameter("company", companyId);
		query.setParameter("oStatus", status);
		return (List<Orders>) query.list();
	}
	
	public boolean updateBeforeShipping(String orderId,String recipient,String address1,String address2,String phone) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="update Orders set recipient=:recipient,address1=:address1,address2=:address2,phone=:phone where orderId=:orderId";
		try {
		Query query = session.createQuery(hqlStr);
		query.setParameter("orderId",orderId);
		query.setParameter("recipient",recipient);
		query.setParameter("address1",address1);
		query.setParameter("address2",address2);
		query.setParameter("phone",phone);
		query.executeUpdate();
		return true;
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return false;
	}
	
	public List<Orders> selectOrdersByTime(Integer companyId,Integer status,String startTime,String endTime) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Orders where companyId=:companyId and status=:status and ( createTime > :startTime and createTime < :endTime )";
		Query query = session.createQuery(hqlStr);
		query.setParameter("companyId", companyId);
		query.setParameter("status", status);
		query.setParameter("startTime", startTime);
		query.setParameter("endTime", endTime);
		System.out.println("query:"+query+"-------------------------------");
		return (List<Orders>) query.list();
	}
	// --(王選豪)------------------

	public boolean insert(Orders orders) {
		  Session session = sessionFactory.getCurrentSession();
		  String hqlStr = "from Orders where orderId=:orderId";
		  Query query = session.createQuery(hqlStr);
		  query.setParameter("orderId", orders.getOrderId());
		  Orders rs = (Orders) query.uniqueResult();
		  if (rs == null) {
		   session.save(orders);
		   return true;
		  }
		  return false;
		 }


	public Orders selectUserCompanyStatusOrder(Integer companyId, Integer status, Integer userId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "From Orders where companyId=:companyId and status=:status and userId=:userId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("companyId", companyId);
		query.setParameter("status", status);
		query.setParameter("userId", userId);
		return (Orders) query.uniqueResult();
	}
	
	public List<Orders> selectListUserCompanyStatusOrderNormal(Integer companyId, Integer status, Integer userId, Integer shipping) {//豪
		Session session = sessionFactory.getCurrentSession();
		String hqlStr =   "From Orders where companyId=:companyId and status=:status and userId=:userId and shipping!=:shipping";
		Query query = session.createQuery(hqlStr);
		query.setParameter("companyId", companyId);
		query.setParameter("status", status);
		query.setParameter("userId", userId);
		query.setParameter("shipping", shipping);
		return (List<Orders>) query.list();
	}
	
	 public List<Orders> selectListUserCompanyStatusOrderQrTicket(Integer companyId, Integer status, Integer userId, Integer shipping) {/*新增20200201_1509*/
		  Session session = sessionFactory.getCurrentSession();
		  int qr = 3;
		  String hqlStr =   "From Orders where companyId=:companyId and status=:status and userId=:userId and shipping=:shipping";
		  Query query = session.createQuery(hqlStr);
		  query.setParameter("companyId", companyId);
		  query.setParameter("status", status);
		  query.setParameter("userId", userId);
		  query.setParameter("shipping", shipping);
		  return (List<Orders>) query.list();
		 }
}