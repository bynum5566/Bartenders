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
	
	public void updateBar(String logoUrl,String coverUrl1,String coverUrl2,String coverUrl3,String coverUrl4,String coverUrl5, String aboutBar, String barMenu, String barFb, String barLine, String barIg, int companyId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update MyBar set logoUrl=:lUrl, coverUrl1=:cUrl1, coverUrl2=:cUrl2, coverUrl3=:cUrl3, coverUrl4=:cUrl4, coverUrl5=:cUrl5, aboutBar=:aBar, barMenu=:barM, barFb=:bFb, barLine=:bLine, barIg=:bIg where companyId=:cId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("lUrl", logoUrl);
		query.setParameter("cUrl1", coverUrl1);
		query.setParameter("cUrl2", coverUrl2);
		query.setParameter("cUrl3", coverUrl3);
		query.setParameter("cUrl4", coverUrl4);
		query.setParameter("cUrl5", coverUrl5);
		query.setParameter("aBar", aboutBar);
		query.setParameter("barM", barMenu);
		query.setParameter("bFb", barFb);
		query.setParameter("bLine", barLine);
		query.setParameter("bIg", barIg);
		query.setParameter("cId", companyId);
		query.executeUpdate();
	}
	
}