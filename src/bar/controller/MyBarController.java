package bar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.MyBar;
import bar.model.MyBarService;
import bar.model.ProductDataService;

@SessionAttributes(names = { "Caccount" })
@Controller
public class MyBarController {
	@Autowired
	private HttpServletRequest request;
	private MyBarService mBS;
	private CompanyService companyService;
	private ProductDataService pds;

	@Autowired
	public MyBarController(MyBarService mBS, CompanyService companyService, ProductDataService pds) {
		this.mBS = mBS;
		this.companyService = companyService;
		this.pds = pds;
	}

	@RequestMapping(value = "/My.Bar", method = RequestMethod.GET)
	public String myBarPage(@ModelAttribute(name = "Caccount") String account) {
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
			String t3pds2 = pds.selectTop3Pd(companyId);

			request.setAttribute("barName", Data2.getCompanyName());
			request.setAttribute("barAdd", Data2.getAddress());
			request.setAttribute("barPhone", Data2.getPhone());

			request.setAttribute("barImgUrl", Detail2.getCoverUrl());
			request.setAttribute("aboutBar", Detail2.getAboutBar());
			request.setAttribute("barFb", Detail2.getBarFb());
			request.setAttribute("barLine", Detail2.getBarLine());
			request.setAttribute("barIg", Detail2.getBarIg());

			request.setAttribute("pDs", t3pds2);
			request.setAttribute("barId", companyId);

			return "myBar";
		}
		Company Data = mBS.selectBarData(companyId);
		String t3pds = pds.selectTop3Pd(companyId);

		request.setAttribute("barName", Data.getCompanyName());
		request.setAttribute("barAdd", Data.getAddress());
		request.setAttribute("barPhone", Data.getPhone());

		request.setAttribute("barImgUrl", Detail.getCoverUrl());
		request.setAttribute("aboutBar", Detail.getAboutBar());
		request.setAttribute("barFb", Detail.getBarFb());
		request.setAttribute("barLine", Detail.getBarLine());
		request.setAttribute("barIg", Detail.getBarIg());

		request.setAttribute("pDs", t3pds);
		request.setAttribute("barId", companyId);

		return "myBar";
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

			request.setAttribute("barImgUrl", Detail2.getCoverUrl());
			request.setAttribute("aboutBar", Detail2.getAboutBar());
			request.setAttribute("barFb", Detail2.getBarFb());
			request.setAttribute("barLine", Detail2.getBarLine());
			request.setAttribute("barIg", Detail2.getBarIg());

			return "myBar";
		}
		Company Data = mBS.selectBarData(companyId);

		request.setAttribute("barId", companyId);

		request.setAttribute("barName", Data.getCompanyName());
		request.setAttribute("barAdd", Data.getAddress());
		request.setAttribute("barPhone", Data.getPhone());

		request.setAttribute("barImgUrl", Detail.getCoverUrl());
		request.setAttribute("aboutBar", Detail.getAboutBar());
		request.setAttribute("barFb", Detail.getBarFb());
		request.setAttribute("barLine", Detail.getBarLine());
		request.setAttribute("barIg", Detail.getBarIg());

		return "editMyBar";
	}

	@RequestMapping(value = "/editBar", method = RequestMethod.POST)
	public String editMyBar(@ModelAttribute(name = "Caccount") String account,
			@RequestParam("barName") String companyName, @RequestParam("barPhone") String phone,
			@RequestParam("barAddress") String address, @RequestParam(name = "pdImg", required = false) String coverUrl,
			@RequestParam("aboutBar") String aboutBar, @RequestParam("barFb") String barFb,
			@RequestParam("barLine") String barLine, @RequestParam("barIG") String barIg) {
		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		mBS.updateBarPage(companyName, phone, address, coverUrl, aboutBar, barFb, barLine, barIg, companyId);

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		return "redirect:/reBr";
	}
	
	@RequestMapping(value = "/reBr", method = RequestMethod.GET)
	public String reFresh() {
		try
		{
		Thread.currentThread().sleep(1000);
		}
		catch(Exception e){
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