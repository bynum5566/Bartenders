package bar.model.logistic;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import bar.model.logistic.LogisticAccount;
@Repository
public class LogisticAccountDAO {

	private SessionFactory sessionFactory;

@Autowired
	public LogisticAccountDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean checkLogin(String logisticName, String logisticPwd) {
		try {
			
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from LogisticAccount where logisticName=:name and logisticPwd=:pwd";
		Query query = session.createQuery(hqlStr);
		query.setParameter("name", logisticName);
		query.setParameter("pwd", logisticPwd);
		LogisticAccount account = (LogisticAccount)query.uniqueResult();
		if(account!=null) {
			return true;
		}else {
			return false;
		}
		
		} catch(Exception e) {
			System.out.println("e:"+e);
			return false;
		}
	}
	
	public LogisticAccount querySender(String logisticName, String logisticPwd) {
		try {
			
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from LogisticAccount where logisticName=:name and logisticPwd=:pwd";
		Query query = session.createQuery(hqlStr);
//		query.setParameter("senderId", senderId);
		query.setParameter("name", logisticName);
		query.setParameter("pwd", logisticPwd);
		LogisticAccount account = (LogisticAccount)query.uniqueResult();
		if(account!=null) {
			return account;
		}else {
			return null;
		}
		
		} catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public LogisticAccount querySender(Integer senderId) {
		try {
			
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from LogisticAccount where senderId=:senderId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("senderId", senderId);
//		query.setParameter("name", logisticName);
//		query.setParameter("pwd", logisticPwd);
		LogisticAccount account = (LogisticAccount)query.uniqueResult();
		if(account!=null) {
			return account;
		}else {
			return null;
		}
		
		} catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}


}
