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
	
	public void updateBarPage(String companyName, String phone, String address, String logoUrl, String coverUrl1, String coverUrl2, String coverUrl3, String coverUrl4, String coverUrl5, String aboutBar, String barMenu, String barFb, String barLine, String barIg, int companyId) {
		cDao.updateBarData(companyName, phone, address, companyId);
		mbDao.updateBar(logoUrl, coverUrl1, coverUrl2, coverUrl3, coverUrl4, coverUrl5, aboutBar, barMenu, barFb, barLine, barIg, companyId);
		;
	}
}
