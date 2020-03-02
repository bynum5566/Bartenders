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
					+"<tr class=\"B1 pdRow\"><td class=\"B1 MidS1\"><h4>"
					+ eAn.getNeTitle() + "</h4></td><td><h4>"
					+ eAn.getNePostDate()
					+ "</h4></td><td class=\"B1\"><img src=\"/Bartenders/images/document.png\" onclick=\"location.href='/Bartenders/NewsAndEvents.Edit?ckEN1="
					+ eAn.getNeId() + "';\" style=\"width: 40px; height: 40px; cursor: pointer;\"></td><td class=\"B1 RSide\">"
					+ "<a class=\"bT4\" href=\"/Bartenders/EN.remove?ckEN2=" + eAn.getNeId() + "\">"
					+ "<img src=\"/Bartenders/images/delete.png\" style=\"width: 40px; height: 40px; cursor: pointer;\">"
					+ "</a></td></tr>";
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
