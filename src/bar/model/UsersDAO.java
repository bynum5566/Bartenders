package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAO {

	private SessionFactory sessionFactory;

	@Autowired
	public UsersDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Users insert(Users users) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", users.getAccount());
		Users rs = (Users) query.uniqueResult();
		if (rs == null) {
			session.save(users);
			return users;
		}
		return null;
	}

	public Users update(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Users rs = (Users) query.uniqueResult();
		if (rs != null) {
			rs.setAccount(account);
			rs.setPassword(password);
		}
		return rs;
	}

	public boolean delete(String account) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Users rs = (Users) query.uniqueResult();
		if (rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}

	public Users select(String account) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Users where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Users rs = (Users) query.uniqueResult();
		return rs;
	}

	public List<Users> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Users");
		return (List<Users>) query.list();
	}

	public boolean checkLogin(String account, String password) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Users where account=:account and password=:password";
			Query query = session.createQuery(hqlStr);
			query.setParameter("account", account);
			query.setParameter("password", password);
			Users rsUser = (Users) query.uniqueResult();
			if (rsUser != null) {
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("e:" + e);
			return false;
		}

	}

	 public Users selectUser(Integer id) {
		  Session session = sessionFactory.getCurrentSession();
		  String hqlStr = "From Users where id=:id";
		  Query query = session.createQuery(hqlStr);
		  query.setParameter("id", id);
		  Users rs = (Users) query.uniqueResult();
		  return rs;
		 }
}
