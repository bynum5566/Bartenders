package bar.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {

	private UsersDAO userdao;

	@Autowired
	public UsersService(UsersDAO userdao) {
		this.userdao = userdao;
	}

	public Users insert(Users users) {
		return userdao.insert(users);
	}

	public Users update(String account, String password) {
		return userdao.update(account, password);
	}

	public boolean delete(String account) {
		return userdao.delete(account);
	}

	public Users select(String account) {
		return userdao.select(account);
	}

	public List<Users> selectAll() {
		return userdao.selectAll();
	}

	public boolean checkLogin(String account, String password) {
		return userdao.checkLogin(account, password);
	}

	public boolean updateInfo(String account,String email,String name,String phone,String birthday,String address) {
		return userdao.updateInfo(account, email, name, phone, birthday, address);
	 }

}
