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

//	
//	public boolean checkLogin(Account users) {
//		try {
//			
//		Session session = sessionFactory.getCurrentSession();
//		String hqlStr = "from UserAccount where username=:name and userpwd=:pwd";
//		Query query = session.createQuery(hqlStr);
//		query.setParameter("name", users.getUsername());
//		query.setParameter("pwd", users.getUserpwd());
//		Account account = (Account)query.uniqueResult();
//		if(account!=null) {
//			return true;
//		}
//		return false;
//		} catch(Exception e) {
//			System.out.println("e:"+e);
//			return false;
//		}
//	}
//	
//	public int countUser(int number) {
//		try {
//			
//		Session session = sessionFactory.getCurrentSession();
//		String hqlStr = "from Account where id<=:id";
//		Query query = session.createQuery(hqlStr);
//		query.setParameter("id", number);
////		query.setParameter("pwd", users.getUserpwd());
//		List<Account> account = (List<Account>)query.list();
////		Iterator<Account> x = account.iterator();
//		System.out.println(account.size());
//		return account.size();
//		} catch(Exception e) {
//			System.out.println("e:"+e);
//			return 0;
//		}
//	}
//	
//	public List<Account> showUser(int number) {
//		try {
//		Session session = sessionFactory.getCurrentSession();
//		String hqlStr = "from Account where id<=:id";
//		Query query = session.createQuery(hqlStr);
//		query.setParameter("id", number);
////		query.setParameter("pwd", users.getUserpwd());
//		List<Account> account = query.list();
////		resultList = new ArrayList<Account>();
////		resultList.addAll(account);
////		Iterator<Account> userList = account.iterator();
//		System.out.println(account.size());
////		System.out.println(resultList);
//		for (Account user : account) {
//			String result = ("使用者名稱:" + user.getUsername() + " 密碼:" + user.getUserpwd());
//			System.out.println(result);		
//		}
//		
//		return account;
//		} catch(Exception e) {
//			System.out.println("e:"+e);
//			return null;
//		}
//	}

}
