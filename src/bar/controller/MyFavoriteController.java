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
	private ProductDataDAO pdao;
	private ProductDataService pds;
	private UsersService usersS;

	public MyFavoriteController() {
	}

	@Autowired
	public MyFavoriteController(MyFavoriteService mfs, ProductDataDAO pdao, ProductDataService pds,
			UsersService usersS) {
		this.mfs = mfs;
		this.pdao = pdao;
		this.pds = pds;
		this.usersS = usersS;
	}

	@RequestMapping(value = "/Dashboard.MyFavorite", method = RequestMethod.GET)
	public String showMyFavsPage(@ModelAttribute(name = "account") String account) {// (int userId) {
		// 之後要帶入使用者ID
//		int userId=100000;
		Users user = usersS.select(account);
		int userId = user.getUserId();

		String myFavs = mfs.showAllFav(userId);
		request.setAttribute("Myfav", myFavs);
		return "myFavorite";
	}

	@RequestMapping(value = "/Product.show", method = RequestMethod.GET)
	public String showProductPage(@RequestParam(value = "pdidck", required = false) String pdId) throws ParseException {
		ProductData prod = pdao.selectP(pdId);
		String ALT = prod.getAutoLaunchTime();
		String APT = prod.getAutoPullTime();
		String p = "目前無法購買此產品。";
		String s = "<input class=\"bt0\" type=\"submit\" value=\"加入購物車+\">";
		String pdVD = prod.getValidDate() + " ~ " + prod.getExpiryDate();
		if(pdVD.equals("null ~ null")) {
			pdVD="";
		}else {
			pdVD="<label>有效期間: </label>"+pdVD;
		}
		if (APT != null) {
			boolean a = pds.checkTime(ALT);// true=before now
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
//				String pdVD = prod.getValidDate() + " ~ " + prod.getExpiryDate();
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
//				String pdVD = prod.getValidDate() + " ~ " + prod.getExpiryDate();
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
			boolean a = pds.checkTime(ALT);// true=before now
			if (a) {
//				String pdVD = prod.getValidDate() + " ~ " + prod.getExpiryDate();
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
//				String pdVD = prod.getValidDate() + " ~ " + prod.getExpiryDate();
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

	@RequestMapping(value = "/addMyFav", method = RequestMethod.POST)
	public String addFav(@ModelAttribute(name = "account") String account, @RequestParam("pdidck") String pdId) {
		Users user = usersS.select(account);
		int userId = user.getUserId();
		int fNum = mfs.getNewFvId(userId);
		mfs.addFav(userId, pdId, fNum);
		return "redirect:/Product.show?pdidck=" + pdId;
	}

	@RequestMapping(value = "/pdDisLike", method = RequestMethod.POST)
	public String disLikePd(@ModelAttribute(name = "account") String account, @RequestParam("pdidck") String pdId) {
		Users user = usersS.select(account);
		int userId = user.getUserId();

		mfs.disLreL(userId, pdId);
		return "redirect:/Dashboard.MyFavorite";
	}

}
