package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MyFavoriteBarsDAO {
	private SessionFactory sessionFactory;
	private MyFavoriteBars myfavB;
	
	@Autowired
	public MyFavoriteBarsDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void addToFavBar(MyFavoriteBars myfavB) {
		Session session = sessionFactory.getCurrentSession();
		if(myfavB != null) {
			session.save(myfavB);
		}
	}
	
	public List<MyFavoriteBars> selectAllFavBars (int userId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyFavoriteBars where userId=:uid";
		Query query = session.createQuery(hqlStr);
		query.setParameter("uid", userId);
		return (List<MyFavoriteBars>)query.list();
	}
	
	public List<MyFavoriteBars> selectFavBars (int userId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyFavoriteBars where userId=:uid and disliked=:lik";
		Query query = session.createQuery(hqlStr);
		String L = "L";
		query.setParameter("uid", userId);
		query.setParameter("lik", L);
		return (List<MyFavoriteBars>)query.list();
	}
	
	public MyFavoriteBars selectOneFavBar (int userId, int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyFavoriteBars where userId=:uid and companyId=:cid";
		Query query = session.createQuery(hqlStr);
		query.setParameter("uid", userId);
		query.setParameter("cid", companyId);
		return (MyFavoriteBars)query.uniqueResult();
	}
	
	public void dislikeBar(int userId, int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "Update MyFavoriteBars set disliked=:dis where userId=:uid and companyId=:cid";
		Query query = session.createQuery(hqlStr);
		String DL = "disL";
		query.setParameter("dis", DL);
		query.setParameter("uid", userId);
		query.setParameter("cid", companyId);
		query.executeUpdate();
	}
	
	public void likeBar(int userId, int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "Update MyFavoriteBars set disliked=:lik where userId=:uid and companyId=:cid";
		Query query = session.createQuery(hqlStr);
		String L = "L";
		query.setParameter("lik", L);
		query.setParameter("uid", userId);
		query.setParameter("cid", companyId);
		query.executeUpdate();
	}
}
