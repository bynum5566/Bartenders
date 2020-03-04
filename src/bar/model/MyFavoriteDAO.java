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
public class MyFavoriteDAO {
	private SessionFactory sessionFactory;
	private MyFavorite myfav;
	
	@Autowired
	public MyFavoriteDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public void addToFav(MyFavorite myfav) {
		Session session = sessionFactory.getCurrentSession();
		if(myfav != null) {
			session.save(myfav);
		}
	}
	
	public List<MyFavorite> selectAllFav (int userId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyFavorite where userId=:uid order by fNum DESC";
		Query query = session.createQuery(hqlStr);
		query.setParameter("uid", userId);
		return (List<MyFavorite>)query.list();
	}
	
	public List<MyFavorite> selectFav (int userId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyFavorite where userId=:uid and disliked=:lik";
		Query query = session.createQuery(hqlStr);
		String L = "L";
		query.setParameter("uid", userId);
		query.setParameter("lik", L);
		return (List<MyFavorite>)query.list();
	}
	
	public MyFavorite selectOneFav (int userId, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyFavorite where userId=:uid and pdId=:pdid";
		Query query = session.createQuery(hqlStr);
		query.setParameter("uid", userId);
		query.setParameter("pdid", pdId);
		return (MyFavorite)query.uniqueResult();
	}
	
	public void dislikePd(int userId, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "Update MyFavorite set disliked=:dis where userId=:uid and pdId=:pdid";
		Query query = session.createQuery(hqlStr);
		String DL = "disL";
		query.setParameter("dis", DL);
		query.setParameter("uid", userId);
		query.setParameter("pdid", pdId);
		query.executeUpdate();
	}
	
	public void likePd(int userId, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "Update MyFavorite set disliked=:lik where userId=:uid and pdId=:pdid";
		Query query = session.createQuery(hqlStr);
		String L = "L";
		query.setParameter("lik", L);
		query.setParameter("uid", userId);
		query.setParameter("pdid", pdId);
		query.executeUpdate();
	}
}
