/*豪*/
package bar.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Cart;
import bar.model.CartService;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataDAO;
import bar.model.ProductDataService;
import bar.model.UsersService;
import bar.model.Users;
//<td align="center">${Corders[current.index].amount}</td>
@Controller
@SessionAttributes(names = { 
		"account", 
		"listOfProduct", 
		"productName", 
		"amount", 
		"shippingNumber", 
		"address1",
		"phone",
		"orders"
		})


@EnableTransactionManagement
public class DisplayProductListController {

	private int i = 0;
	private OrdersService ordersService;
	private CompanyService companyService;
	private CartService cartService;
	private ProductDataService productService;
	private ProductDataDAO productDataDAO ;
	private UsersService userService;

	public void printI(String s){
		this.i++;
		System.out.printf("【%s】【%d】\n",s,i);
	}
	
	public DisplayProductListController(
			OrdersService ordersService, 
			CompanyService comservice, 
			CartService cartService,
			ProductDataService productService, 
			ProductDataDAO productDataDAO,
			UsersService userService) {
		this.ordersService = ordersService;
		this.companyService = comservice;
		this.cartService = cartService;
		this.productService = productService;
		this.productDataDAO = productDataDAO;
		this.userService = userService;
	}

	public String[] getStatusNumToStr() {
		String returnStatus[] = {
				"",
		        "只先暫存購物車",
		        "未付款",
		        "已付款未配送",
		        "已配送",
		        "已取消"};
		return returnStatus;
	}
	

	

	

	@RequestMapping(path = { "/DisplayProductList.controller" })
	public String userOrdersProcessAction(
			@ModelAttribute(name = "account") 
			String account, 
			@ModelAttribute(name = "barAccount") 
			String barAccount, 
			Model m) {
		//String companyAccount = "Test99999999";
		
		String companyAccount = barAccount;	//【公司】【公司帳號】
		Company companyX = companyService.select(companyAccount);		
		int companyId = companyX.getCompanyId();
		
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
		
		printI("1");//1
		//listOfProduct.addAll(ordersService.selectUser(userId, 1));
		CartService.printValueTypeTime("companyId",companyId    );
		
		/*選擇Launched的*/
		listOfProduct.addAll(productDataDAO.selectPds(companyId, "Launched"));
		
		/*圖片，開始*/
		/*圖片，結束*/
		
		m.addAttribute("listOfProduct", listOfProduct);
		m.addAttribute("account", account);
		m.addAttribute("barAccount", barAccount);
		
		return "displayProductList";
		
//		return "displayProductListMk2";

	}
	
	public List <Integer> calculateListOfProductSubtotal(List <Cart> oneOrderCartsList) {
		int subltotalOfOneProduct = 0;
		List <Integer> listOfProductSubtotal = new ArrayList<Integer>();;
		for (Cart oneOrderCart : oneOrderCartsList)
		{
			int cartCheckoutPrice = oneOrderCart.getCheckoutPrice();
			int cartQuantity = oneOrderCart.getQuantity();
			
			subltotalOfOneProduct = cartCheckoutPrice * cartQuantity;
			listOfProductSubtotal.add(subltotalOfOneProduct);
		}
		return listOfProductSubtotal;
	}
	
	public int calculateFreight(String orderId) { /* 運費 */
		int shippingPrice = 0;
		Orders order = ordersService.selectOrder(orderId);
		int shipping = order.getShipping();
		/* 運費設定 */
		/* ======================== */
		int f0 = 0; /* 未選擇 */
		int f1 = 80;/* 宅配 */
		int f2 = 60;/* 超商 */
		int f3 = 0;/* QR票券 */
		/* ======================== */
		switch (shipping) {
		case 0:
			shippingPrice = f0;
			break;
		case 1:
			shippingPrice = f1;
			break;
		case 2:
			shippingPrice = f2;
			break;
		case 3:
			shippingPrice = f3;
			break;
		default:
			shippingPrice = 0;
		}
		return shippingPrice;
	}
}


