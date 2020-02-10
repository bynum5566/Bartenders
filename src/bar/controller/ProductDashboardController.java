package bar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.ProductData;
import bar.model.ProductDataService;

@SessionAttributes(names= {"Caccount"})
@Controller
public class ProductDashboardController {
	@Autowired
	private HttpServletRequest request;
	private ProductDataService pds;
	private CompanyService companyService;

	@Autowired
	public ProductDashboardController(ProductDataService pds,CompanyService companyService) {
		this.pds = pds;
		this.companyService=companyService;
	}

	@RequestMapping(value = "/Product.Add", method = RequestMethod.GET)
	public String showAddPD() {
		return "addProduct";
	}
	
	@RequestMapping(value = "/TicketProduct.Add", method = RequestMethod.GET)
	public String showAddTkPD() {
		return "addTicketProduct";
	}

	@RequestMapping(value = "/editPD", method = RequestMethod.POST)
	public String showEditPD(@RequestParam("pdId") String pdId, @RequestParam("pdNm") String productName,
			@RequestParam("pdStk") int pdStock, @RequestParam("pdPri") int pdPrice,
			@RequestParam("pdTg1") String pdTag1, @RequestParam("pdTg2") String pdTag2,
			@RequestParam("pdTg3") String pdTag3, @RequestParam("pdDta") String pdDetail,
			@RequestParam(value="pdImg", required=false) String productImageUrl, @RequestParam("setTimeAct1") String autoLaunchTime, 
			@RequestParam("setTimeAct2") String autoPullTime) {
		pds.editPd(pdId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl, autoLaunchTime, autoPullTime);

		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("pic", productImageUrl);
		request.setAttribute("pdDetail", pdDetail);

		return "productViewPage";
	}
	
	@RequestMapping(value = "/editTkPD", method = RequestMethod.POST)
	public String showEditTkPD(@RequestParam("pdId") String pdId, @RequestParam("pdNm") String productName,
			@RequestParam("pdStk") int pdStock, @RequestParam("pdPri") int pdPrice,
			@RequestParam("pdTg1") String pdTag1, @RequestParam("pdTg2") String pdTag2,
			@RequestParam("pdTg3") String pdTag3, @RequestParam("pdDta") String pdDetail,
			@RequestParam(value="pdImg", required=false) String productImageUrl, @RequestParam("setTKTime1") String validDate,
			@RequestParam("setTKTime2") String expiryDate, @RequestParam("setTimeAct1") String autoLaunchTime, 
			@RequestParam("setTimeAct2") String autoPullTime) {
		pds.editTKPd(pdId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl, validDate, expiryDate, autoLaunchTime, autoPullTime);
		
		String TkTime = validDate + " ~ " + expiryDate;
		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("pic", productImageUrl);
		request.setAttribute("pdDetail", pdDetail);
		request.setAttribute("pdValD", TkTime);

		return "productViewPage2";
	}

	@RequestMapping(value = "/Product.View", method = RequestMethod.GET)
	public String showViewPD() {
		return "productViewPage";
	}
	
	@RequestMapping(value = "/ProductTicket.View", method = RequestMethod.GET)
	public String showViewTKPD() {
		return "productViewPage2";
	}

	@RequestMapping(value = "/Dashboard.Products", method = RequestMethod.GET)
	public String showDashboard(@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
				
		try {
			String Launched = pds.selectLaunched(companyId);
			String Pulled = pds.selectPulled(companyId);

			request.setAttribute("Launched", Launched);
			request.setAttribute("Pulled", Pulled);
			return "shopDashboard";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERRR");
			return "productViewPage";
		}
	}
	
	@RequestMapping(value = "/Dashboard.TkProducts", method = RequestMethod.GET)
	public String showDashboard2(@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
		
		try {
			String Launched = pds.selectTkLaunched(companyId);
			String Pulled = pds.selectTkPulled(companyId);

			request.setAttribute("Launched", Launched);
			request.setAttribute("Pulled", Pulled);
			return "shopDashboard2";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERRR");
			return "productViewPage";
		}
	}

	@RequestMapping(value = "/addPD", method = RequestMethod.POST)
	public String addProd(@RequestParam("pdNm") String productName, @RequestParam("pdStk") int pdStock,
			@RequestParam("pdPri") int pdPrice, @RequestParam("pdTg1") String pdTag1,
			@RequestParam("pdTg2") String pdTag2, @RequestParam("pdTg3") String pdTag3,
			@RequestParam("pdDta") String pdDetail, @RequestParam("pdImg") String productImageUrl,
			@RequestParam("setTimeAct") String Time,@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
		
		pds.addNewProduct(companyId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl, Time);
		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("pic", productImageUrl);
		request.setAttribute("pdDetail", pdDetail);
		return "productViewPage";
	}
	
	@RequestMapping(value = "/addTkPD", method = RequestMethod.POST)
	public String addTkProd(@RequestParam("pdNm") String productName, @RequestParam("pdStk") int pdStock,
			@RequestParam("pdPri") int pdPrice, @RequestParam("pdTg1") String pdTag1,
			@RequestParam("pdTg2") String pdTag2, @RequestParam("pdTg3") String pdTag3,
			@RequestParam("pdDta") String pdDetail, @RequestParam("pdImg") String productImageUrl,
			@RequestParam("setTKTime") String TkTime, @RequestParam("setTimeAct") String Time,@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
		
		pds.addNewTKProduct(companyId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl, TkTime, Time);
		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("pic", productImageUrl);
		request.setAttribute("pdDetail", pdDetail);
		request.setAttribute("pdValD", TkTime);
		return "productViewPage2";
//		return "redirect:/ProductTicket.View";
	}

	@RequestMapping(value = "/pulPD", method = RequestMethod.POST)
	public String pPd(@RequestParam("pdidckL") String pdidckL) {
		boolean x = pds.pdPull(pdidckL);
		if (x) {
			return "redirect:/reFr";
//			return "redirect:/Dashboard.Products";
		} else {
			return "addProduct";
		}
	}

	@RequestMapping(value = "/lauPD", method = RequestMethod.POST)
	public String lPd(@RequestParam("pdidckP") String pdidckP) {
		boolean x = pds.pdLaunch(pdidckP);
		if (x) {
			return "redirect:/reFr";
//			return "redirect:/Dashboard.Products";
		} else {
			return "addProduct";
		}
	}
	
	@RequestMapping(value = "/reFr", method = RequestMethod.GET)
	public String reFresh() {
		try
		{
		Thread.currentThread().sleep(1000);//毫秒
		}
		catch(Exception e){
		}
			return "redirect:/Dashboard.Products";
	}
	
	@RequestMapping(value = "/pulTkPD", method = RequestMethod.POST)
	public String pTkPd(@RequestParam("pdidckL") String pdidckL) {
		boolean x = pds.pdPull(pdidckL);
		if (x) {
			return "redirect:/reFrT";
//			return "redirect:/Dashboard.TkProducts";
		} else {
			return "addProduct";
		}
	}

	@RequestMapping(value = "/lauTkPD", method = RequestMethod.POST)
	public String lTkPd(@RequestParam("pdidckP") String pdidckP) {
		boolean x = pds.pdLaunch(pdidckP);
		if (x) {
			return "redirect:/reFrT";
//			return "redirect:/Dashboard.TkProducts";
		} else {
			return "addProduct";
		}
	}
	
	@RequestMapping(value = "/reFrT", method = RequestMethod.GET)
	public String reFreshT() {
		try
		{
		Thread.currentThread().sleep(1000);//毫秒
		}
		catch(Exception e){
		}
			return "redirect:/Dashboard.TkProducts";
	}

	@RequestMapping(value = "/Product.EditPDL", method = RequestMethod.GET)
	public String editProdL(@RequestParam("pdidckL") String pdId,@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
		
		ProductData pd = pds.editThisPd(companyId, pdId);
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", pd.getPdDetail());
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pdpicUrl", pd.getProductImageUrl());
		return "editProduct";
	}

	@RequestMapping(value = "/Product.EditPDP", method = RequestMethod.GET)
	public String editProdP(@RequestParam("pdidckP") String pdId,@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
		
		ProductData pd = pds.editThisPd(companyId, pdId);
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", pd.getPdDetail());
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pdpicUrl", pd.getProductImageUrl());
		return "editProduct";
	}
	
	@RequestMapping(value = "/Product.EditTkPDL", method = RequestMethod.GET)
	public String editTkProdL(@RequestParam("pdidckL") String pdId,@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();

		ProductData pd = pds.editThisTkPd(companyId, pdId);
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", pd.getPdDetail());
		request.setAttribute("valideT", pd.getValidDate());
		request.setAttribute("expiryT", pd.getExpiryDate());
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pdpicUrl", pd.getProductImageUrl());
		return "editTicketProduct";
	}

	@RequestMapping(value = "/Product.EditTkPDP", method = RequestMethod.GET)
	public String editTkProdP(@RequestParam("pdidckP") String pdId,@ModelAttribute(name="Caccount") String account) {
		// 之後要代入使用者帳號
//		int companyId = 500002;
		Company comp = companyService.select(account);
		int companyId = comp.getId();
		
		ProductData pd = pds.editThisTkPd(companyId, pdId);
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", pd.getPdDetail());
		request.setAttribute("valideT", pd.getValidDate());
		request.setAttribute("expiryT", pd.getExpiryDate());
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pdpicUrl", pd.getProductImageUrl());
		return "editTicketProduct";
	}
}
