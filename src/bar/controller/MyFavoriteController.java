package bar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import bar.model.MyFavoriteBarsService;
import bar.model.MyFavoriteService;
import bar.model.ProductData;
import bar.model.ProductDataDAO;
import bar.model.ProductDataService;
import bar.model.Users;
import bar.model.UsersService;

@SessionAttributes(names = { "account" })
@Controller
public class MyFavoriteController {
	@Autowired
	private HttpServletRequest request;
	private MyFavoriteService mfs;
	private MyFavoriteBarsService mfbs;
	private ProductDataDAO pdao;
	private ProductDataService pds;
	private UsersService usersS;
	private CompanyService compS;

	public MyFavoriteController() {
	}

	@Autowired
	public MyFavoriteController(MyFavoriteService mfs, MyFavoriteBarsService mfbs, ProductDataDAO pdao, ProductDataService pds,
			UsersService usersS, CompanyService compS) {
		this.mfs = mfs;
		this.mfbs=mfbs;
		this.pdao = pdao;
		this.pds = pds;
		this.usersS = usersS;
		this.compS=compS;
	}

	@RequestMapping(value = "/Dashboard.MyFavorite", method = RequestMethod.GET)
	public String showMyFavsPage(@ModelAttribute(name = "account") String account) {
		Users user = usersS.select(account);
		int userId = user.getUserId();

		String myFavbs = mfbs.showAllFavBars(userId);
		request.setAttribute("MyfavB", myFavbs);
		
		String myFavs = mfs.showAllFav(userId);
		request.setAttribute("Myfav", myFavs);
		return "myFavorite";
	}

	@RequestMapping(value = "/Product.show", method = RequestMethod.GET)
	public String showProductPage(@RequestParam(value = "PdId", required = false) String pdId) throws ParseException {
		ProductData prod = pdao.selectP(pdId);
		String ALT = prod.getAutoLaunchTime();
		String APT = prod.getAutoPullTime();
		String p = "目前無法購買此產品。";
		String s = "<input class=\"bT\" type=\"submit\" value=\"加入購物車+\">";
		String pdVD = prod.getValidDate() + " ~ " + prod.getExpiryDate();
		if (pdVD.equals("null ~ null")) {
			pdVD = "";
		} else {
			pdVD = "<label>有效期間: </label>" + pdVD;
		}
		if (APT != null) {
			boolean a = pds.checkTime(ALT);
			boolean b = pds.checkTime(APT);
			boolean c;

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date d = sdf.parse(ALT);
			Date e = sdf.parse(APT);

			if (d.before(e)) {
				c = true;
			} else {
				c = false;
			}

			if ((a == true && b == true && c == false) || (a == true && b == false && c == true)) {
				request.setAttribute("productName", prod.getProductName());
				request.setAttribute("pic", prod.getProductImageUrl());
				request.setAttribute("productId", prod.getPdId());
				request.setAttribute("pdPri", prod.getPdPrice());
				request.setAttribute("pdStk", prod.getPdStock());
				request.setAttribute("pdValD", pdVD);
				request.setAttribute("pdDetail", prod.getPdDetail());
				request.setAttribute("bT", s);
				return "productSinglePage";
			} else {
				request.setAttribute("productName", prod.getProductName());
				request.setAttribute("pic", prod.getProductImageUrl());
				request.setAttribute("productId", prod.getPdId());
				request.setAttribute("pdPri", prod.getPdPrice());
				request.setAttribute("pdStk", prod.getPdStock());
				request.setAttribute("pdValD", pdVD);
				request.setAttribute("pdDetail", prod.getPdDetail());
				request.setAttribute("bT", p);
				return "productSinglePage";
			}

		} else {
			boolean a = pds.checkTime(ALT);
			if (a) {
				request.setAttribute("productName", prod.getProductName());
				request.setAttribute("pic", prod.getProductImageUrl());
				request.setAttribute("productId", prod.getPdId());
				request.setAttribute("pdPri", prod.getPdPrice());
				request.setAttribute("pdStk", prod.getPdStock());
				request.setAttribute("pdValD", pdVD);
				request.setAttribute("pdDetail", prod.getPdDetail());
				request.setAttribute("bT", s);
				return "productSinglePage";
			} else {
				request.setAttribute("productName", prod.getProductName());
				request.setAttribute("pic", prod.getProductImageUrl());
				request.setAttribute("productId", prod.getPdId());
				request.setAttribute("pdPri", prod.getPdPrice());
				request.setAttribute("pdStk", prod.getPdStock());
				request.setAttribute("pdValD", pdVD);
				request.setAttribute("pdDetail", prod.getPdDetail());
				request.setAttribute("bT", p);
				return "productSinglePage";
			}
		}

	}

	@RequestMapping(value = "/addMyFav", method = RequestMethod.GET)
	public String addFav(@ModelAttribute(name = "account") String account,
			@RequestParam(name = "pdidck", required = false) String pdId) {
		Users user = usersS.select(account);
		int userId = user.getUserId();
		int fNum = mfs.getNewFvId(userId);
		mfs.addFav(userId, pdId, fNum);
		return "redirect:/Product.show?PdId=" + pdId;
	}

	@RequestMapping(value = "/pdDisLike", method = RequestMethod.GET)
	public String disLikePd(@ModelAttribute(name = "account") String account, @RequestParam("pdidck") String pdId) {
		Users user = usersS.select(account);
		int userId = user.getUserId();

		mfs.disLreL(userId, pdId);
		return "redirect:/Dashboard.MyFavorite";
//		return "redirect:/Bartenders/Dashboard.MyFavorite?account="+account+"#tabs-1";
	}
	
	@RequestMapping(value = "/addFav.bar", method = RequestMethod.GET)
	public String addFavBar(@ModelAttribute(name = "account") String account,
			@RequestParam(name = "cidck", required = false) int companyId) {
		Users user = usersS.select(account);
		Company Comp = compS.selectCompany(companyId);
		String Caccount = Comp.getAccount();
		int userId = user.getUserId();
		int fNum = mfbs.getNewFvBId(userId);
		mfbs.addFavBar(userId, companyId, fNum);
		return "redirect:/DisplayProductList.controller?barAccount=" + Caccount;
	}

	@RequestMapping(value = "/barDisLike", method = RequestMethod.GET)
	public String disLikeBar(@ModelAttribute(name = "account") String account, @RequestParam("cidck") int companyId) {
		Users user = usersS.select(account);
		int userId = user.getUserId();

		mfbs.disLreLB(userId, companyId);
		return "redirect:/Dashboard.MyFavorite";
//		return "redirect:/Bartenders/Dashboard.MyFavorite?account="+account+"#tabs-2";
	}

}
