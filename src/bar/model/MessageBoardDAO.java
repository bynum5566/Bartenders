package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class MessageBoardDAO {

	private SessionFactory sessionFactory;

	@Autowired
	public MessageBoardDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public MessageBoard createMessage(MessageBoard messageBoard) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MessageBoard";
		Query query = session.createQuery(hqlStr);
		session.save(messageBoard);
		return messageBoard;

	}

	public boolean deleteMessage(Integer id, String deletePassword) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MessageBoard where id=:id and deletePassword=:deletePassword";
		Query query = session.createQuery(hqlStr);
		query.setParameter("id", id);
		query.setParameter("deletePassword", deletePassword);
		MessageBoard rs = (MessageBoard) query.uniqueResult();
		if (rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}

	public List<MessageBoard> selectNewestMessage() {
		Session session = sessionFactory.getCurrentSession();
		String hsql="From MessageBoard order by ID DESC";
		Query query = session.createQuery(hsql);
		return (List<MessageBoard>) query.list();
	}
	
	public List<MessageBoard> selectTheMessage(String account, Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MessageBoard where account=:account and id=:id";
		Query query = session.createQuery(hqlStr);
		query.setParameter("account", account);
		query.setParameter("id", id);
		return (List<MessageBoard>) query.list();
	}
	
	public MessageBoard selectTheMessageOnlyById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from MessageBoard where id=:id";
		Query query = session.createQuery(hqlStr);		
		query.setParameter("id", id);
		return (MessageBoard) query.uniqueResult();
	}
	
	/////////////////////////////////////////////////////////
	public List<SubMessageBoard> selectNewestSubMessage(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hsql="From SubMessageBoard where id=:id order by time ";
		Query query = session.createQuery(hsql);
		query.setParameter("id", id);
		return (List<SubMessageBoard>) query.list();
	}
	
	public SubMessageBoard createSubMessage(SubMessageBoard subMessageBoard) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from SubMessageBoard";
		Query query = session.createQuery(hqlStr);
		session.save(subMessageBoard);
		return subMessageBoard;

	}
	

	public boolean deleteSubMessage(Integer subId, String deletePassword) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from SubMessageBoard where subId=:subId and deletePassword=:deletePassword";
		Query query = session.createQuery(hqlStr);
		query.setParameter("subId", subId);
		query.setParameter("deletePassword", deletePassword);
		SubMessageBoard rs = (SubMessageBoard) query.uniqueResult();
		if (rs != null) {
			session.delete(rs);
			return true;
		}
		return false;
	}
	
	
}
