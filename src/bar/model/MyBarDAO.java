package bar.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MyBarDAO {
	private SessionFactory sessionFactory;
	private MyBar myBar;
	
	@Autowired
	public MyBarDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	public boolean newBar(MyBar myBar) {
		Session session = sessionFactory.getCurrentSession();
		if(myBar != null) {
			session.save(myBar);
			return true;
		}
		return false;
	}
	
	public MyBar selectBar(int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MyBar where companyId=:cId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		MyBar myBar = (MyBar)query.uniqueResult();
		return myBar;
	}
	
	public void updateBar(String coverUrl, String aboutBar, String barFb, String barLine, String barIg, int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update MyBar set coverUrl=:cUrl, aboutBar=:aBar, barFb=:bFb, barLine=:bLine, barIg=:bIg where companyId=:cId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cUrl", coverUrl);
		query.setParameter("aBar", aboutBar);
		query.setParameter("bFb", barFb);
		query.setParameter("bLine", barLine);
		query.setParameter("bIg", barIg);
		query.setParameter("cId", companyId);
		query.executeUpdate();
	}
	
}