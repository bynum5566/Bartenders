package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class EventsAndNewsDAO {
	private SessionFactory sessionFactory;
	private EventsAndNews eAn;
	
	public EventsAndNewsDAO() {
	}
	
	@Autowired
	public EventsAndNewsDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	
	public void insertEN(EventsAndNews eAn) {
		Session session = sessionFactory.getCurrentSession();
		session.save(eAn);
	}
	
	public List<EventsAndNews> selectAllEN(int companyId){
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="from EventsAndNews where companyId=:cId and deleteTag is null";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		return (List<EventsAndNews>)query.list();
		
	}
	
	public EventsAndNews selectOneEN(String neId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr="from EventsAndNews where neId=:neId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("neId", neId);
		return (EventsAndNews)query.uniqueResult();
	}
	
	public void updateEN(String neId, String neTitle, String neText) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update EventsAndNews set neTitle=:neTitle, neText=:neText where neId=:neId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("neTitle", neTitle);
		query.setParameter("neText", neText);
		query.setParameter("neId", neId);
		query.executeUpdate();
	}
	
	public void removeEN(String neId, String deleteTag) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update EventsAndNews set deleteTag=:dTag where neId=:neId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("dTag", deleteTag);
		query.setParameter("neId", neId);
		query.executeUpdate();
	}
}
