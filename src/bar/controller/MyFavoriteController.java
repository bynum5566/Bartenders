package bar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.MyFavoriteService;
import bar.model.ProductData;
import bar.model.ProductDataDAO;

@Controller
public class MyFavoriteController {
	@Autowired
	private HttpServletRequest request;
	private MyFavoriteService mfs;
	@Autowired
	private ProductDataDAO pdao;
	
	public MyFavoriteController() {
	}
	
	@Autowired
	public MyFavoriteController(MyFavoriteService mfs) {
		this.mfs=mfs;
	}

	@RequestMapping(value = "/Dashboard.MyFavorite", method = RequestMethod.GET)
	public String showMyFavsPage() {//(int userId) {
		//之後要帶入使用者ID
		int userId=100000;
		String myFavs = mfs.showAllFav(userId);
		request.setAttribute("Myfav", myFavs);
		return "myFavorite";
	}
	
	@RequestMapping(value = "/Product.show", method = RequestMethod.GET)
	public String showProductPage(@RequestParam(value = "pdidck",required = false)String pdId) {
		ProductData prod = pdao.selectP(pdId);
		String pdVD=prod.getValidDate() + " ~ " + prod.getExpiryDate();
		request.setAttribute("productName", prod.getProductName());
		request.setAttribute("pic", prod.getProductImageUrl());
		request.setAttribute("productId", prod.getPdId());
		request.setAttribute("pdPri", prod.getPdPrice());
		request.setAttribute("pdStk", prod.getPdStock());
		request.setAttribute("pdValD", pdVD);
		request.setAttribute("pdDetail", prod.getPdDetail());
		return "productSinglePage";
	}
	
	@RequestMapping(value = "/addMyFav", method = RequestMethod.POST)
	public String addFav(@RequestParam("pdidck") String pdId) {
		//之後要帶入使用者ID
		int userId=100000;
		
		mfs.addFav(userId, pdId);
//		request.setAttribute("pdidck", pdId);
		return "redirect:/Product.show?pdidck="+pdId;
//		return "redirect:/Product.show";
	}
	
	@RequestMapping(value = "/pdDisLike", method = RequestMethod.POST)
	public String disLikePd(@RequestParam("pdidck") String pdId) {
		//之後要帶入使用者ID
		int userId=100000;
		
		mfs.disLreL(userId, pdId);
		return "redirect:/Dashboard.MyFavorite";
	}

}
