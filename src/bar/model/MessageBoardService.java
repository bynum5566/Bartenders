package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageBoardService {

	private MessageBoardDAO messageBoardDAO;

	@Autowired
	public MessageBoardService(MessageBoardDAO messageBoardDAO) {
		this.messageBoardDAO = messageBoardDAO;
	}


	public MessageBoard createMessage(MessageBoard messageBoard) {
		return messageBoardDAO.createMessage(messageBoard);
	}

	public boolean delete(Integer id, String deletePassword) {
		return messageBoardDAO.deleteMessage(id, deletePassword);
	}

	public List<MessageBoard> selectNewestMessage() {

		return messageBoardDAO.selectNewestMessage();
	}
	
	public List<MessageBoard> selectTheMessage(String account, Integer id) {
		return messageBoardDAO.selectTheMessage(account, id);
	}
	
	public MessageBoard selectTheMessageOnlyById(Integer id) {
		
		return messageBoardDAO.selectTheMessageOnlyById(id);
	}
	
	//////////////////////////////
	public List<SubMessageBoard> selectNewestSubMessage(Integer id) {
		return messageBoardDAO.selectNewestSubMessage(id);
	}
	
	public SubMessageBoard createSubMessage(SubMessageBoard subMessageBoard) {
		return messageBoardDAO.createSubMessage(subMessageBoard);
	}
	
	public boolean subDelete(Integer subId, String deletePassword) {
		return messageBoardDAO.deleteSubMessage(subId, deletePassword);
	}
}
