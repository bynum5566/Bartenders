package bar.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyBarService {
	private MyBar myBar;
	private MyBarDAO mbDao;
	private CompanyDAO cDao;
	
	public MyBarService() {
	}
	
	@Autowired
	public MyBarService(MyBar myBar,MyBarDAO mbDao, CompanyDAO cDao) {
		this.myBar=myBar;
		this.mbDao=mbDao;
		this.cDao=cDao;
	}
	
	public void insertBar(int companyId) {
		myBar.setCompanyId(companyId);
		mbDao.newBar(myBar);
	}
	
	public Company selectBarData(int companyId) {
		return cDao.selectCompany(companyId);
	}
	
	public MyBar selectBarDetail(int companyId) {
		return mbDao.selectBar(companyId);
	}
	
	public void updateBarPage(String companyName, String phone, String address, String coverUrl, String aboutBar, String barFb, String barLine, String barIg, int companyId) {
		cDao.updateBarData(companyName, phone, address, companyId);
		mbDao.updateBar(coverUrl, aboutBar, barFb, barLine, barIg, companyId);
	}
}
