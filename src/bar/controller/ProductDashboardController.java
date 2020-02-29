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

@SessionAttributes(names = { "Caccount" })
@Controller
public class ProductDashboardController {
	@Autowired
	private HttpServletRequest request;
	private ProductDataService pds;
	private CompanyService companyService;

	@Autowired
	public ProductDashboardController(ProductDataService pds, CompanyService companyService) {
		this.pds = pds;
		this.companyService = companyService;
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
			@RequestParam(value = "pdImg", required = false) String productImageUrl,
			@RequestParam("pdImg2") String productImageUrl2, @RequestParam("pdImg3") String productImageUrl3,
			@RequestParam("setTimeAct1") String autoLaunchTime, @RequestParam("setTimeAct2") String autoPullTime) {
		pds.editPd(pdId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl,
				productImageUrl2, productImageUrl3, autoLaunchTime, autoPullTime);

		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("pic1", productImageUrl);
		if (productImageUrl2.length() < 1) {
			request.setAttribute("pic2", productImageUrl);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		} else {
			request.setAttribute("pic2", productImageUrl2);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		}
		request.setAttribute("Tag1", pdTag1);
		request.setAttribute("Tag2", pdTag2);
		request.setAttribute("Tag3", pdTag3);
		pdDetail = pdDetail.replaceAll("\n", "<br>");
		request.setAttribute("pdDetail", pdDetail);

		return "productViewPage";
	}

	@RequestMapping(value = "/editTkPD", method = RequestMethod.POST)
	public String showEditTkPD(@RequestParam("pdId") String pdId, @RequestParam("pdNm") String productName,
			@RequestParam("pdStk") int pdStock, @RequestParam("pdPri") int pdPrice,
			@RequestParam("pdTg1") String pdTag1, @RequestParam("pdTg2") String pdTag2,
			@RequestParam("pdTg3") String pdTag3, @RequestParam("pdDta") String pdDetail,
			@RequestParam(value = "pdImg", required = false) String productImageUrl,
			@RequestParam("pdImg2") String productImageUrl2, @RequestParam("pdImg3") String productImageUrl3,
			@RequestParam("setTKTime1") String validDate, @RequestParam("setTKTime2") String expiryDate,
			@RequestParam("setTimeAct1") String autoLaunchTime, @RequestParam("setTimeAct2") String autoPullTime) {
		pds.editTKPd(pdId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl,
				productImageUrl2, productImageUrl3, validDate, expiryDate, autoLaunchTime, autoPullTime);

		String TkTime = validDate + " ~ " + expiryDate;
		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("pic1", productImageUrl);
		if (productImageUrl2.length() < 1) {
			request.setAttribute("pic2", productImageUrl);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		} else {
			request.setAttribute("pic2", productImageUrl2);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		}
		request.setAttribute("Tag1", pdTag1);
		request.setAttribute("Tag2", pdTag2);
		request.setAttribute("Tag3", pdTag3);
		pdDetail = pdDetail.replaceAll("\n", "<br>");
		request.setAttribute("pdDetail", pdDetail);
		request.setAttribute("pdValD", TkTime);

		return "productViewPage2";
	}

	@RequestMapping(value = "/Product.View", method = RequestMethod.GET)
	public String showViewPD(@RequestParam("pdId") String pdId) {
		ProductData prod = pds.select(pdId);
		request.setAttribute("productName", prod.getProductName());
		request.setAttribute("pdStk", prod.getPdStock());
		request.setAttribute("pdPri", prod.getPdPrice());
		request.setAttribute("pic1", prod.getProductImageUrl());
		if (prod.getProductImageUrl2() == null || prod.getProductImageUrl2().length() < 1) {
			request.setAttribute("pic2", prod.getProductImageUrl());
			if (prod.getProductImageUrl3() == null || prod.getProductImageUrl3().length() < 1) {
				request.setAttribute("pic3", prod.getProductImageUrl());
			} else {
				request.setAttribute("pic3", prod.getProductImageUrl3());
			}
		} else {
			request.setAttribute("pic2", prod.getProductImageUrl2());
			if (prod.getProductImageUrl3() == null || prod.getProductImageUrl3().length() < 1) {
				request.setAttribute("pic3", prod.getProductImageUrl());
			} else {
				request.setAttribute("pic3", prod.getProductImageUrl3());
			}
		}
		request.setAttribute("Tag1", prod.getPdTag1());
		request.setAttribute("Tag2", prod.getPdTag2());
		request.setAttribute("Tag3", prod.getPdTag3());
		request.setAttribute("pdDetail", prod.getPdDetail());

		return "productViewPage";
	}

	@RequestMapping(value = "/ProductTicket.View", method = RequestMethod.GET)
	public String showViewTKPD(@RequestParam("pdId") String pdId) {
		ProductData prod = pds.select(pdId);
		String TkTime = prod.getValidDate() + " ~ " + prod.getExpiryDate();
		request.setAttribute("productName", prod.getProductName());
		request.setAttribute("pdStk", prod.getPdStock());
		request.setAttribute("pdPri", prod.getPdPrice());
		request.setAttribute("pic1", prod.getProductImageUrl());
		if (prod.getProductImageUrl2() == null || prod.getProductImageUrl2().length() < 1) {
			request.setAttribute("pic2", prod.getProductImageUrl());
			if (prod.getProductImageUrl3() == null || prod.getProductImageUrl3().length() < 1) {
				request.setAttribute("pic3", prod.getProductImageUrl());
			} else {
				request.setAttribute("pic3", prod.getProductImageUrl3());
			}
		} else {
			request.setAttribute("pic2", prod.getProductImageUrl2());
			if (prod.getProductImageUrl3() == null || prod.getProductImageUrl3().length() < 1) {
				request.setAttribute("pic3", prod.getProductImageUrl());
			} else {
				request.setAttribute("pic3", prod.getProductImageUrl3());
			}
		}
		request.setAttribute("Tag1", prod.getPdTag1());
		request.setAttribute("Tag2", prod.getPdTag2());
		request.setAttribute("Tag3", prod.getPdTag3());
		request.setAttribute("pdDetail", prod.getPdDetail());
		request.setAttribute("pdValD", TkTime);

		return "productViewPage2";
	}

	@RequestMapping(value = "/Dashboard.Products", method = RequestMethod.GET)
	public String showDashboard(@ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		try {
			String Launched = pds.selectLaunched(companyId);
			String Pulled = pds.selectPulled(companyId);

			request.setAttribute("Launched", Launched);
			request.setAttribute("Pulled", Pulled);
			return "shopDashboard";
		} catch (Exception e) {
			e.printStackTrace();
			return "index";
		}
	}

	@RequestMapping(value = "/Dashboard.TkProducts", method = RequestMethod.GET)
	public String showDashboard2(@ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		try {
			String Launched = pds.selectTkLaunched(companyId);
			String Pulled = pds.selectTkPulled(companyId);

			request.setAttribute("Launched", Launched);
			request.setAttribute("Pulled", Pulled);
			return "shopDashboard2";
		} catch (Exception e) {
			e.printStackTrace();
			return "index";
		}
	}

	@RequestMapping(value = "/addPD", method = RequestMethod.POST)
	public String addProd(@RequestParam("pdNm") String productName, @RequestParam("pdStk") int pdStock,
			@RequestParam("pdPri") int pdPrice, @RequestParam("pdTg1") String pdTag1,
			@RequestParam("pdTg2") String pdTag2, @RequestParam("pdTg3") String pdTag3,
			@RequestParam("pdDta") String pdDetail, @RequestParam("pdImg") String productImageUrl,
			@RequestParam("pdImg2") String productImageUrl2, @RequestParam("pdImg3") String productImageUrl3,
			@RequestParam("setTimeAct") String Time, @ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		pds.addNewProduct(companyId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl,
				productImageUrl2, productImageUrl3, Time);
		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("Tag1", pdTag1);
		request.setAttribute("Tag2", pdTag2);
		request.setAttribute("Tag3", pdTag3);
		request.setAttribute("pic1", productImageUrl);
		if (productImageUrl2.length() < 1) {
			request.setAttribute("pic2", productImageUrl);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		} else {
			request.setAttribute("pic2", productImageUrl2);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		}
		pdDetail = pdDetail.replaceAll("\n", "<br>");
		request.setAttribute("pdDetail", pdDetail);
		return "productViewPage";
	}

	@RequestMapping(value = "/addTkPD", method = RequestMethod.POST)
	public String addTkProd(@RequestParam("pdNm") String productName, @RequestParam("pdStk") int pdStock,
			@RequestParam("pdPri") int pdPrice, @RequestParam("pdTg1") String pdTag1,
			@RequestParam("pdTg2") String pdTag2, @RequestParam("pdTg3") String pdTag3,
			@RequestParam("pdDta") String pdDetail, @RequestParam("pdImg") String productImageUrl,
			@RequestParam("pdImg2") String productImageUrl2, @RequestParam("pdImg3") String productImageUrl3,
			@RequestParam("setTKTime") String TkTime, @RequestParam("setTimeAct") String Time,
			@ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		pds.addNewTKProduct(companyId, productName, pdStock, pdPrice, pdTag1, pdTag2, pdTag3, pdDetail, productImageUrl,
				productImageUrl2, productImageUrl3, TkTime, Time);
		request.setAttribute("productName", productName);
		request.setAttribute("pdStk", pdStock);
		request.setAttribute("pdPri", pdPrice);
		request.setAttribute("Tag1", pdTag1);
		request.setAttribute("Tag2", pdTag2);
		request.setAttribute("Tag3", pdTag3);
		request.setAttribute("pic1", productImageUrl);
		if (productImageUrl2.length() < 1) {
			request.setAttribute("pic2", productImageUrl);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		} else {
			request.setAttribute("pic2", productImageUrl2);
			if (productImageUrl3.length() < 1) {
				request.setAttribute("pic3", productImageUrl);
			} else {
				request.setAttribute("pic3", productImageUrl3);
			}
		}
		pdDetail = pdDetail.replaceAll("\n", "<br>");
		request.setAttribute("pdDetail", pdDetail);
		request.setAttribute("pdValD", TkTime);
		return "productViewPage2";
	}

	@RequestMapping(value = "/pulPD", method = RequestMethod.GET)
	public String pPd(@RequestParam("pdidckL") String pdidckL) {
		boolean x = pds.pdPull(pdidckL);
		if (x) {
			return "redirect:/reFr";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/lauPD", method = RequestMethod.GET)
	public String lPd(@RequestParam("pdidckP") String pdidckP) {
		boolean x = pds.pdLaunch(pdidckP);
		if (x) {
			return "redirect:/reFr";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/reFr", method = RequestMethod.GET)
	public String reFresh() {
		try {
			Thread.currentThread().sleep(1000);
		} catch (Exception e) {
			return "index";
		}
		return "redirect:/Dashboard.Products";
	}

	@RequestMapping(value = "/pulTkPD", method = RequestMethod.GET)
	public String pTkPd(@RequestParam("pdidckL") String pdidckL) {
		boolean x = pds.pdPull(pdidckL);
		if (x) {
			return "redirect:/reFrT";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/lauTkPD", method = RequestMethod.GET)
	public String lTkPd(@RequestParam("pdidckP") String pdidckP) {
		boolean x = pds.pdLaunch(pdidckP);
		if (x) {
			return "redirect:/reFrT";
		} else {
			return "index";
		}
	}

	@RequestMapping(value = "/reFrT", method = RequestMethod.GET)
	public String reFreshT() {
		try {
			Thread.currentThread().sleep(1000);
		} catch (Exception e) {
			return "index";
		}
		return "redirect:/Dashboard.TkProducts";
	}

	@RequestMapping(value = "/Product.EditPDL", method = RequestMethod.GET)
	public String editProdL(@RequestParam("pdidckL") String pdId, @ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		ProductData pd = pds.editThisPd(companyId, pdId);
		String detail = pd.getPdDetail().replaceAll("<br>", "");
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", detail);
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pic1", pd.getProductImageUrl());
		request.setAttribute("pic2", pd.getProductImageUrl2());
		request.setAttribute("pic3", pd.getProductImageUrl3());
		return "editProduct";
	}

	@RequestMapping(value = "/Product.EditPDP", method = RequestMethod.GET)
	public String editProdP(@RequestParam("pdidckP") String pdId, @ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		ProductData pd = pds.editThisPd(companyId, pdId);
		String detail = pd.getPdDetail().replaceAll("<br>", "");
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", detail);
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pic1", pd.getProductImageUrl());
		request.setAttribute("pic2", pd.getProductImageUrl2());
		request.setAttribute("pic3", pd.getProductImageUrl3());
		return "editProduct";
	}

	@RequestMapping(value = "/Product.EditTkPDL", method = RequestMethod.GET)
	public String editTkProdL(@RequestParam("pdidckL") String pdId, @ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		ProductData pd = pds.editThisTkPd(companyId, pdId);
		String detail = pd.getPdDetail().replaceAll("<br>", "");
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", detail);
		request.setAttribute("valideT", pd.getValidDate());
		request.setAttribute("expiryT", pd.getExpiryDate());
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pic1", pd.getProductImageUrl());
		request.setAttribute("pic2", pd.getProductImageUrl2());
		request.setAttribute("pic3", pd.getProductImageUrl3());
		return "editTicketProduct";
	}

	@RequestMapping(value = "/Product.EditTkPDP", method = RequestMethod.GET)
	public String editTkProdP(@RequestParam("pdidckP") String pdId, @ModelAttribute(name = "Caccount") String account) {

		Company comp = companyService.select(account);
		int companyId = comp.getCompanyId();

		ProductData pd = pds.editThisTkPd(companyId, pdId);
		String detail = pd.getPdDetail().replaceAll("<br>", "");
		request.setAttribute("pdId", pd.getPdId());
		request.setAttribute("pdNm", pd.getProductName());
		request.setAttribute("pdStk", pd.getPdStock());
		request.setAttribute("pdPri", pd.getPdPrice());
		request.setAttribute("pdT1", pd.getPdTag1());
		request.setAttribute("pdT2", pd.getPdTag2());
		request.setAttribute("pdT3", pd.getPdTag3());
		request.setAttribute("pdDT", detail);
		request.setAttribute("valideT", pd.getValidDate());
		request.setAttribute("expiryT", pd.getExpiryDate());
		request.setAttribute("autoLT", pd.getAutoLaunchTime());
		request.setAttribute("autoPT", pd.getAutoPullTime());
		request.setAttribute("pic1", pd.getProductImageUrl());
		request.setAttribute("pic2", pd.getProductImageUrl2());
		request.setAttribute("pic3", pd.getProductImageUrl3());
		return "editTicketProduct";
	}
	
	@RequestMapping(value = "/Product.Del", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("pdId") String pdId) {
		pds.removeProduct(pdId);
		return "redirect:/reFr";
	}
	
	@RequestMapping(value = "/TicketProduct.Del", method = RequestMethod.GET)
	public String deleteTicketProduct(@RequestParam("pdId") String pdId) {
		pds.removeProduct(pdId);
		return "redirect:/reFrT";
	}

	@RequestMapping(value = "/search.Product", method = RequestMethod.GET)
	public String getSearchResult(@RequestParam("keyword") String keyword) {
		String res = pds.searchResult(keyword);
		request.setAttribute("kWord", keyword);
		request.setAttribute("drinkPd", res);
		return "searchProductsResult";
	}
}
