/*豪*/
package bar.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.CartDAO;
import bar.model.CartService;
import bar.model.Orders;
import bar.model.OrdersDAO;
/*===*/
import bar.model.ProductData;
import bar.model.ProductDataService;
import bar.model.UsersService; //C
import bar.model.Users;


/*===*/
@Controller
@SessionAttributes(names = "account")

//

@EnableTransactionManagement
public class AddToCartButtonController {
	private ProductDataService pService;
	private UsersService uService; /* C */
	private CartService cartsSrvice;
	private CartDAO cartDao;
	private OrdersDAO ordersDAO;

	public AddToCartButtonController(
			ProductDataService pService, 
			UsersService uService ,
			CartService cartsSrvice,
			CartDAO cartDao,
			OrdersDAO ordersDAO) {
		CartService.Pf("AddToCartButtonController，Start");
		this.pService = pService;
		this.uService = uService; /* C */
		this.cartsSrvice = cartsSrvice;
		this.cartDao = cartDao;
		this.ordersDAO = ordersDAO;
		CartService.Pf("AddToCartButtonController，End");
	}

	/* @RequestMapping(path = "/AddToCartButton.controller",method = RequestMethod.GET) */
	@RequestMapping(path = "/AddToCartButton.controller")
	public String AddToCartButtonProcessAction(
			@ModelAttribute(name = "account") String account,
			@RequestParam("pdId") String pdId, 
			Model m) {
		CartService.Pf("AddToCartButtonProcessAction，Start"); // A
		//==========================
//		String pdId = "2"; // A
//		int companyId = 500000; // A
		//==========================
//		ProductData pX= pDao.selectProduct(companyId, pdId); /*用dao取*/
//		ProductData pX = pService.editThisPd(companyId, pdId); /* 用service取 */
		System.out.println("pdId = " + pdId);
		ProductData pX = pService.selectProductVer2(pdId);	/* 用service取 */
		System.out.println("【pX.getPdStock()】=" + pX.getPdStock()); // A
		System.out.println("【pX.getProductName()】=" + pX.getProductName()); // A
		System.out.println("【account】=" + account);
		Users uX;/* C */
		uX = uService.select(account); /* C */
		CartService.Pf("您好，" + uX.getUserName()); /* C */
		m.addAttribute("account", account);/* D */
		m.addAttribute("UserName", uX.getUserName());/* D */
		m.addAttribute("ProductName", pX.getProductName());/* D */
		m.addAttribute("PdStock", pX.getPdStock());/* D */
		m.addAttribute("PdId", pX.getPdId());
		m.addAttribute("pdPrice", pX.getPdPrice());
		m.addAttribute("validDate",pX.getValidDate());
		System.out.println("【pX.getPdId()】=" + pX.getPdId()); // D
		CartService.Pf("AddToCartButtonProcessAction，End");
		/*====*/
		List <Orders> orderList;
		Integer companyId, status, userId ,shipping;
		companyId = 500000;
		status = 2;
		userId = 100007;
		shipping = 1;
//		orderList = cartsSrvice.selectOrderListByCompanyIdStatusUserIdNormal(companyId, status, userId, shipping);
		orderList = ordersDAO.selectListUserCompanyStatusOrderNormal(companyId, status, userId, shipping);
		System.out.println(orderList.size());
		/*====*/
		return "AddToCartButton";
	}
}
