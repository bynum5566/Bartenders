package bar.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventsAndNewsService {
	private EventsAndNews eAn;
	private EventsAndNewsDAO enDao;
	
	public EventsAndNewsService() {
	}
	
	@Autowired
	public EventsAndNewsService(EventsAndNews eAn, EventsAndNewsDAO enDao) {
		this.eAn=eAn;
		this.enDao=enDao;
	}
	
	public String getNewneId(int companyId) {	
		int x = enDao.allENs(companyId).size();	
		String s1 = Integer.toString(companyId); 	
        String s2 = Integer.toString(x); 	
  	
        String neId = "NE"+s1 + s2; 	
  	
		return neId;	
	}
	
	public void addEN(String neId, int companyId, String neTitle, String neText) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String nePostDate = sdFormat.format(date);
		
		eAn.setNeId(neId);
		eAn.setCompanyId(companyId);
		eAn.setNeTitle(neTitle);
		eAn.setNeText(neText);
		eAn.setNePostDate(nePostDate);
		
		enDao.insertEN(eAn);
	}
	
	public String showAllEN(int companyId) {
		String EN = "";
		List<EventsAndNews> evNnes = enDao.selectAllEN(companyId);
		for(EventsAndNews eAn:evNnes) {
			EN = EN
					+"<tr class=\"pdRow\"><td class=\"MidS1\">"
					+ eAn.getNeTitle()
//					+ "<form action=\"/Bartenders/NewsAndEvents.Edit\" method=\"GET\">" 
					+ "</td>"
					+ "<td><img src=\"/Bartenders/images/document.png\" onclick=\"location.href='/Bartenders/NewsAndEvents.Edit?ckEN1="
					+ eAn.getNeId()
					+ "';\" style=\"width: 40px; height: 40px; cursor: pointer;\"></td>"
//					+ "<input type=\"submit\" value=\""
//					+ "\"/>" 
//					+ "</form>"
					+ "<td class=\"RSide\">"
//					+ "<form action=\"/Bartenders/EN.remove\" method=\"POST\">"
//					+ "<input type=\"text\" name=\"ckEN2\" class=\"pdidckLL\" value=\""
					+"<img src=\"/Bartenders/images/delete.png\" onclick=\"location.href='/Bartenders/EN.remove?ckEN2="
					+ eAn.getNeId()
					+ "'\" style=\"width: 40px; height: 40px; cursor: pointer;\">"
//					+ "\" readonly=\"readonly\"><input type=\"submit\" value=\"刪除\"></form>"
					+ "</td></tr>";
		}
		return EN;
	}
	
	public EventsAndNews editThisEN(String neId) {
		return enDao.selectOneEN(neId);
	}
	
	public void editEN(String neId, String neTitle, String neText) {
		enDao.updateEN(neId, neTitle, neText);
	}
	
	public void delEN(String neId) {
		String deleteTag = "deleted";
		enDao.removeEN(neId, deleteTag);
	}
}
