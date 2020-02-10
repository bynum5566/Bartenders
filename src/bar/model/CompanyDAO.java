package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAO {

	private SessionFactory sessionFactory;

	@Autowired
	public CompanyDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Company insert(Company company) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", company.getAccount());
		Company rs = (Company) query.uniqueResult();
		if (rs == null) {
			session.save(company);
			return company;
		}
		return null;
	}

	public Company update(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Company rs = (Company) query.uniqueResult();
		if (rs != null) {
			rs.setAccount(account);
			rs.setPassword(password);
		}
		return rs;
	}

	public boolean delete(String account) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Company rs = (Company) query.uniqueResult();
		if (rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}

	public Company select(String account) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		Company rs = (Company) query.uniqueResult();
		return rs;
	}

	public List<Company> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Company");
		return (List<Company>) query.list();
	}

	public boolean checkLogin(String account, String password) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "from Company where account=:account and password=:password";
			Query query = session.createQuery(hqlStr);
			query.setParameter("account", account);
			query.setParameter("password", password);
			Company rsCompany = (Company) query.uniqueResult();
			if (rsCompany != null) {
				return true;
			}
			return false;
		} catch (Exception e) {
			System.out.println("e:" + e);
			return false;
		}
	}

	// ---(楊書瑜)-------------------------------
	public Company selectCompany(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "From Company where id=:id";
		Query query = session.createQuery(hqlStr);
		query.setParameter("id", id);
		Company rs = (Company) query.uniqueResult();
		return rs;
	}

}
