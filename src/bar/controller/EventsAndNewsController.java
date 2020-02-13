package bar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.EventsAndNews;
import bar.model.EventsAndNewsService;

@SessionAttributes(names= {"Caccount"})
@Controller
public class EventsAndNewsController {
	private EventsAndNewsService eanS;
	private CompanyService companyService;
	private EventsAndNews eAn;
	
	public EventsAndNewsController() {
	}
	
	@Autowired
	public EventsAndNewsController(EventsAndNewsService eanS,CompanyService companyService,EventsAndNews eAn) {
		this.eanS=eanS;
		this.companyService=companyService;
		this.eAn=eAn;
	}
	
	@RequestMapping(value="/NewsAndEvents.All",method = RequestMethod.GET)
	public String showAllENs(@ModelAttribute(name="Caccount") String account, Model m) {
		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();
		String EN = eanS.showAllEN(companyId);
		m.addAttribute("NewsEvents", EN);
		return "EventsAndNews";
	}
	
	@RequestMapping(value = "/NewsAndEvents.Add",method = RequestMethod.GET)
	public String addEnPage() {
		return "addEventsAndNews";
	}
	
	@RequestMapping(value = "/addNew.EN",method = RequestMethod.POST)
	public String addNewEn(@ModelAttribute(name="Caccount") String account, @RequestParam("neTitle") String neTitle, @RequestParam("neText") String neText) {
		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();
		String neId = eanS.getNewneId(companyId);
		eanS.addEN(neId, companyId, neTitle, neText);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "redirect:/NewsAndEvents.All";
	}
	
	@RequestMapping(value = "/NewsAndEvents.Edit",method = RequestMethod.GET)
	public String editPage(@RequestParam("ckEN1") String neId, Model m) {
		EventsAndNews eAn=eanS.editThisEN(neId);
		m.addAttribute("neTitle", eAn.getNeTitle());
		m.addAttribute("neText", eAn.getNeText());
		m.addAttribute("neId", eAn.getNeId());
		return "editEventsAndNews";
	}
	
	@RequestMapping(value = "/EN.edit",method = RequestMethod.POST)
	public String editTheEN(@RequestParam("neId") String neId, @RequestParam("neTitle") String neTitle, @RequestParam("neText") String neText) {
		eanS.editEN(neId, neTitle, neText);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "redirect:/NewsAndEvents.All";
	}

	@RequestMapping(value = "/EN.remove",method = RequestMethod.POST)
	public String removeTheEN(@RequestParam("ckEN2") String neId) {
		eanS.delEN(neId);
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		return "redirect:/NewsAndEvents.All";
	}
	
}
