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
		System.out.println(session);
		String hqlStr = "from Company where account=:account";
		Query query = session.createQuery(hqlStr);
		System.out.println(query);
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
	public Company selectCompany(Integer companyId) {	
		Session session = sessionFactory.getCurrentSession();	
		String hqlStr = "from Company where companyId=:id";	
		Query query = session.createQuery(hqlStr);	
		query.setParameter("id", companyId);	
		Company rs = (Company) query.uniqueResult();	
		return rs;	
	}	
		
	// ---(吳昭蓉)-------------------------------	
	public void updateBarData(String companyName, String phone, String address,Integer companyId) {	
		Session session = sessionFactory.getCurrentSession();	
		String hqlStr = "update Company set companyName=:cNm, phone=:tel, address=:add where companyId=:id";	
		Query query = session.createQuery(hqlStr);	
		query.setParameter("cNm", companyName);	
		query.setParameter("tel", phone);	
		query.setParameter("add", address);	
		query.setParameter("id", companyId);	
		query.executeUpdate();	
	}
	
	public List<Company> searchBar(String keyword) {
		keyword = "%" + keyword + "%";
		
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Company where upper(companyName) like '%' || upper(:kWord) || '%'");
		query.setParameter("kWord", keyword);
		return (List<Company>) query.list();
	}
	
}
