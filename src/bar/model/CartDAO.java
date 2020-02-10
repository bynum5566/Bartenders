package bar.model;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository
public class CartDAO
{
	private SessionFactory sessionFactory;
	@Autowired
	public CartDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	public List<Cart> select(String orderId) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="from Cart where orderId=:orderId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("orderId", orderId);
		return (List<Cart>)query.list();
		}catch(Exception e) {
			System.out.println("【CartDAO.selectCart】【error】");
			e.printStackTrace();
			return null;
		}
	}
	public boolean updateQuantity(String orderId, String pdId, int quantity)
	{
		try
		{
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "update Cart set quantity=:quantity where orderId=:orderId and pdId=:pdId";
//			String hqlStr = "update Cart set quantity=:quantity where orderId=:orderId";
			Query query = session.createQuery(hqlStr);
			query.setParameter("orderId", orderId);
			query.setParameter("pdId", pdId);
			query.setParameter("quantity", quantity);
			query.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println("【CartDAO.updateQuantity】【error】");
			System.out.println("【Exception = 】" + e);
			System.out.println("【e.printStackTrace = 】" + e);
			e.printStackTrace();
		}
		return false;
	}
	public Cart selectCart(String orderId, String pdId)
	{
		try
		{
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Cart where orderId=:orderId and pdId=:pdId"; /* error */
//			String hqlStr = "from Cart";
			Query query = session.createQuery(hqlStr);
			query.setParameter("pdId", pdId);
			query.setParameter("orderId", orderId);
			return (Cart) query.uniqueResult();
		} catch (Exception e)
		{
			System.out.println("【CartDAO.selectCart】【error】");
			System.out.println("【Exception = 】" + e);
			System.out.println("【e.printStackTrace = 】" + e);
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean insert(Cart cart)
	{
		Session session = sessionFactory.getCurrentSession();
		if (cart != null)
		{
			session.save(cart);
			return true;
		}
		return false;
	}

	public Cart selectCartByOid(String orderId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Cart where orderId=:orderId";
			Query query = session.createQuery(hqlStr);
			query.setParameter("orderId", orderId);
			return (Cart) query.uniqueResult();
		} catch (Exception e) {
			System.out.println("【CartDAO.selectCartByOid】【error】");
			System.out.println("【Exception = 】" + e);
			System.out.println("【e.printStackTrace = 】" + e);
			e.printStackTrace();
			return null;
		}
	}
	 public Cart selectCartByNum(Integer num)
	 {
	  try
	  {
	   Session session = sessionFactory.getCurrentSession();
	   String hqlStr = "from Cart where num=:num"; 
	   Query query = session.createQuery(hqlStr);
	   String numS = Integer.toString(num);
	   query.setParameter("num", numS);
	   return (Cart) query.uniqueResult();
	  } catch (Exception e)
	  {
	   System.out.println("【CartDAO.selectCart】【error】");
	   System.out.println("【Exception = 】" + e);
	   System.out.println("【e.printStackTrace = 】" + e);
	   e.printStackTrace();
	   return null;
	  }
	 }
}
