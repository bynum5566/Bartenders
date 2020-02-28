package bar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.CartService;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.EventsAndNews;
import bar.model.EventsAndNewsDAO;
import bar.model.MyBar;
import bar.model.MyBarService;
import bar.model.ProductData;
import bar.model.ProductDataDAO;
import bar.model.ProductDataService;

@SessionAttributes(names = { "Caccount" })
@Controller
public class MyBarController {
	@Autowired
	private HttpServletRequest request;
	private MyBarService mBS;
	private CompanyService companyService;
	private ProductDataService pds;
	private ProductDataDAO pdao;
	private EventsAndNewsDAO eAnDAO;
	private CartService Cservice;

	@Autowired
	public MyBarController(MyBarService mBS, CompanyService companyService, ProductDataService pds, ProductDataDAO pdao,
			EventsAndNewsDAO eAnDAO, CartService Cservice) {
		this.mBS = mBS;
		this.companyService = companyService;
		this.pds = pds;
		this.pdao = pdao;
		this.eAnDAO = eAnDAO;
		this.Cservice = Cservice;
	}

	@RequestMapping(value = "/My.Bar", method = RequestMethod.GET)
	public String myBarPage(@ModelAttribute(name = "Caccount") String account, Model m) {
		Company companyX = companyService.select(account);
		int companyId = companyX.getCompanyId();
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
		MyBar Detail = mBS.selectBarDetail(companyId);
		if (Detail == null) {
			mBS.insertBar(companyId);
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			listOfProduct.addAll(pdao.selectPdsLaunched(companyId));
			listOfProduct.addAll(pdao.selectTKPdsLaunched(companyId));
			List<EventsAndNews> listOfEventOfOneBar = eAnDAO.selectAllEN(companyId);
			m.addAttribute("myBarX", Cservice.selectMyBarByCompanyId(companyId));
			m.addAttribute("CompanyName", companyX.getCompanyName());
			m.addAttribute("Address", companyX.getAddress());
			m.addAttribute("listOfProduct", listOfProduct);
			m.addAttribute("barAccount", account);
			m.addAttribute("companyId", companyId);
			m.addAttribute("listOfEventOfOneBar", listOfEventOfOneBar);

			return "MyBarReview";
		} else {
			listOfProduct.addAll(pdao.selectPdsLaunched(companyId));
			listOfProduct.addAll(pdao.selectTKPdsLaunched(companyId));
			List<EventsAndNews> listOfEventOfOneBar = eAnDAO.selectAllEN(companyId);
			m.addAttribute("myBarX", Cservice.selectMyBarByCompanyId(companyId));
			m.addAttribute("CompanyName", companyX.getCompanyName());
			m.addAttribute("Address", companyX.getAddress());
			m.addAttribute("listOfProduct", listOfProduct);
			m.addAttribute("barAccount", account);
			m.addAttribute("companyId", companyId);
			m.addAttribute("listOfEventOfOneBar", listOfEventOfOneBar);

			return "MyBarReview";
		}
	}

	@RequestMapping(value = "/Bar.edit", method = RequestMethod.GET)
	public String editBarPage(@ModelAttribute(name = "Caccount") String account) {
		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		MyBar Detail = mBS.selectBarDetail(companyId);
		if (Detail == null) {
			mBS.insertBar(companyId);

			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

			MyBar Detail2 = mBS.selectBarDetail(companyId);

			Company Data2 = mBS.selectBarData(companyId);

			request.setAttribute("barId", companyId);

			request.setAttribute("barName", Data2.getCompanyName());
			request.setAttribute("barAdd", Data2.getAddress());
			request.setAttribute("barPhone", Data2.getPhone());

			request.setAttribute("barLogoUrl", Detail2.getLogoUrl());
			request.setAttribute("barImgUrl1", Detail2.getCoverUrl1());
			request.setAttribute("barImgUrl2", Detail2.getCoverUrl2());
			request.setAttribute("barImgUrl3", Detail2.getCoverUrl3());
			request.setAttribute("barImgUrl4", Detail2.getCoverUrl4());
			request.setAttribute("barImgUrl5", Detail2.getCoverUrl5());
			request.setAttribute("aboutBar", Detail2.getAboutBar());
			request.setAttribute("barMenu", Detail2.getBarMenu());
			request.setAttribute("barFb", Detail2.getBarFb());
			request.setAttribute("barLine", Detail2.getBarLine());
			request.setAttribute("barIg", Detail2.getBarIg());

			return "myBar";
		}
		Company Data = mBS.selectBarData(companyId);

		String about = Detail.getAboutBar().replaceAll("<br>", "");
		
		request.setAttribute("barId", companyId);

		request.setAttribute("barName", Data.getCompanyName());
		request.setAttribute("barAdd", Data.getAddress());
		request.setAttribute("barPhone", Data.getPhone());

		request.setAttribute("barLogoUrl", Detail.getLogoUrl());
		request.setAttribute("barImgUrl1", Detail.getCoverUrl1());
		request.setAttribute("barImgUrl2", Detail.getCoverUrl2());
		request.setAttribute("barImgUrl3", Detail.getCoverUrl3());
		request.setAttribute("barImgUrl4", Detail.getCoverUrl4());
		request.setAttribute("barImgUrl5", Detail.getCoverUrl5());
		request.setAttribute("aboutBar", about);
		request.setAttribute("barMenu", Detail.getBarMenu());
		request.setAttribute("barFb", Detail.getBarFb());
		request.setAttribute("barLine", Detail.getBarLine());
		request.setAttribute("barIg", Detail.getBarIg());

		return "editMyBar";
	}

	@RequestMapping(value = "/editBar", method = RequestMethod.POST)
	public String editMyBar(@ModelAttribute(name = "Caccount") String account,
			@RequestParam("barName") String companyName, @RequestParam("barPhone") String phone,
			@RequestParam("barAddress") String address, @RequestParam(name = "pdImg", required = false) String logoUrl,
			@RequestParam(name = "cover1", required = false) String coverUrl1,
			@RequestParam(name = "cover2", required = false) String coverUrl2,
			@RequestParam(name = "cover3", required = false) String coverUrl3,
			@RequestParam(name = "cover4", required = false) String coverUrl4,
			@RequestParam(name = "cover5", required = false) String coverUrl5,
			@RequestParam("aboutBar") String aboutBar, @RequestParam("barMenu") String barMenu,
			@RequestParam("barFb") String barFb, @RequestParam("barLine") String barLine,
			@RequestParam("barIG") String barIg) {
		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		aboutBar = aboutBar.replaceAll("\n", "<br>");
		barMenu = barMenu.replaceAll("\n", "<br>");

		mBS.updateBarPage(companyName, phone, address, logoUrl, coverUrl1, coverUrl2, coverUrl3, coverUrl4, coverUrl5,
				aboutBar, barMenu, barFb, barLine, barIg, companyId);

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		return "redirect:/reBr";
	}

	@RequestMapping(value = "/reBr", method = RequestMethod.GET)
	public String reFresh() {
		try {
			Thread.currentThread().sleep(1000);
		} catch (Exception e) {
		}
		return "redirect:/My.Bar";
	}

	@RequestMapping(value = "/Product.All", method = RequestMethod.GET)
	public String allPdPage(@ModelAttribute(name = "Caccount") String account,
			@RequestParam("barName") String companyName) {
		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		String drinks = pds.selectDrinks(companyId);
		String tickets = pds.selectTickets(companyId);
		request.setAttribute("drinkPd", drinks);
		request.setAttribute("ticketPd", tickets);

		return "allProducts";
	}
}