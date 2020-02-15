package bar.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.CartService;
import bar.model.Company;
import bar.model.ProductData;

@Controller
@EnableTransactionManagement
public class DisplayProductDetailController {
	@Autowired
	private CartService cartService;
	
	
	DisplayProductDetailController(CartService cartService){
		this.cartService = cartService;
	}
	@RequestMapping(path = { "/DisplayProductDetail.controller"})
	public String DisplayProductDetailProcessAction(
			@RequestParam("pdId") String pdId,
			Model m
			) 
	{
		CartService.Pf("DisplayProductDetailProcessAction，開始");
		ProductData productX = cartService.selectProductDataByPdid(pdId);
		Company companyX = cartService.selectCompanyByCompanyId(productX.getCompanyId());
		
		m.addAttribute("barAccount",companyX.getAccount());
		m.addAttribute("productX",productX);
		m.addAttribute("productName",productX.getProductName());
		m.addAttribute("pic",productX.getProductImageUrl());
		m.addAttribute("productId",pdId);
		m.addAttribute("pdStk",productX.getPdStock());
		m.addAttribute("errorMsgOfAddToCartButton","");
		m.addAttribute("pdPri",productX.getPdPrice());
		m.addAttribute("pdValD",productX.getValidDate());
		m.addAttribute("bT","");
		
		
		
		CartService.Pf("DisplayProductDetailProcessAction，結束");
		return"DisplayProductDetail";
	}
}
