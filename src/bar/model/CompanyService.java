package bar.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

	private CompanyDAO companyDAO;

	@Autowired
	public CompanyService(CompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}

	public Company insert(Company company) {
		return companyDAO.insert(company);
	}

	public Company update(String account, String password) {
		return companyDAO.update(account, password);
	}

	public boolean delete(String account) {
		return companyDAO.delete(account);
	}

	public Company select(String account) {
		return companyDAO.select(account);
	}

	public List<Company> selectAll() {
		return companyDAO.selectAll();
	}

	public boolean checkLogin(String account, String password) {
		return companyDAO.checkLogin(account, password);
	}
	
	public Company selectCompany(Integer companyId) {
		  return companyDAO.selectCompany(companyId);
		 }
	
	// ---(吳昭蓉)-------------------------------
	public String searchBarResult(String keyword) {
		String res = "";
		List<Company> comps = companyDAO.searchBar(keyword);
		if(comps.size()==0) {
			res = "<tr><td><img width=\"500px\" src=\"/Bartenders/images/No_Result_Icon2.png\"></td></tr>";
			return res;
		}
		for (Company comp : comps) {
			res = res + "<tr><td><a href=\"/Bartenders/DisplayProductList.controller?barAccount=" + comp.getAccount()
					+ "\">" + comp.getCompanyName() + "</a></td></tr>";
		}
		return res;
	}
	
}
