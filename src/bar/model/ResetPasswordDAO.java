package bar.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ResetPasswordDAO {

	private SessionFactory sessionFactory;

	@Autowired
	public ResetPasswordDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Users selectByEmail(String account,String email) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account and email=:email";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		query.setParameter("email", email);
		Users rs = (Users) query.uniqueResult();
		return rs;
	}

	public boolean activateAccount(Users users) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", users.getAccount());
		Users rs = (Users) query.uniqueResult();
		if (rs != null) {
			rs.setRole("member");
			return true;
		}
		return false;
	}
	
	public Users updateNewPassword(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Users rs = (Users) query.uniqueResult();
		if (rs != null) {
			rs.setRole("unverified");
			rs.setPassword(password);
		}
		return rs;
	}
	
	///////////////////////////////
	public Company selectByEmailCompany(String account,String email) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account and email=:email";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		query.setParameter("email", email);
		Company rs = (Company) query.uniqueResult();
		return rs;
	}

	public boolean activateAccountCompany(Company company) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", company.getAccount());
		Company rs = (Company) query.uniqueResult();
		if (rs != null) {
			rs.setRole("member");
			return true;
		}
		return false;
	}
	
	public Company updateNewPasswordCompany(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Company rs = (Company) query.uniqueResult();
		if (rs != null) {
			rs.setRole("unverified");
			rs.setPassword(password);
		}
		return rs;
	}
	
	
}
