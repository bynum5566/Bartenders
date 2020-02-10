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
import bar.model.ProductDataService;
import bar.model.UsersService;
import bar.model.Users;
//<td align="center">${Corders[current.index].amount}</td>
@Controller
@SessionAttributes(names = { ""
		+ 
		"account", 
		"recipient", 
		"orderId", 
		"productName", 
		"amount", 
		"shippingNumber", 
		"address1",
		"phone",
		"orders" })
@EnableTransactionManagement
public class DisplayCartListController {

	private int i = 0;
	private OrdersService ordersService;
	private CompanyService companyService;
	private CartService cartService;
	private ProductDataService productService;
	private UsersService userService;

	public void printI(String s){
		this.i++;
		System.out.printf("【%s】【%d】\n",s,i);
	}
	
	public DisplayCartListController(
			OrdersService ordersService, 
			CompanyService comservice, 
			CartService cartService,
			ProductDataService productService, 
			UsersService userService) {
		this.ordersService = ordersService;
		this.companyService = comservice;
		this.cartService = cartService;
		this.productService = productService;
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
	
	public String[] getShippingNumToStr() {
		String returnShipping[] = {
				"未選擇",
		        "宅配",
		        "超商",
		        "QR票券"};
		return returnShipping;
	}
	

	

	@RequestMapping(path = { "/DisplayCartList.controller" })
	public String userOrdersProcessAction(
			@ModelAttribute(name = "account") String account, 
			Model m) {

		Users user = userService.select(account);
		int userId = user.getId();
		
		List<Orders> listOfOrder = new ArrayList<Orders>();
		
		printI("1");//1
		listOfOrder.addAll(ordersService.selectUser(userId, 1));
		
		
		
		printI("2");//2
//		List<Orders> Corders = ordersService.selectLoginUser(userId);
		m.addAttribute("Corders", listOfOrder);
		m.addAttribute("statusNumToStr", getStatusNumToStr());
		m.addAttribute("ShippingNumToStr", getShippingNumToStr());
		printI("3");//3
		List<Company> attr_company = new ArrayList<Company>();
		List<String> attr_user_account = new ArrayList<String>();
		List<String> attr_address = new ArrayList<String>();
		List<ProductData> attr_product = new ArrayList<ProductData>();
		List<Orders> attr_orders = new ArrayList<Orders>();
		
		printI("4");//4
		for (Orders oneOrder : listOfOrder) {
			List<Integer> listOfProductSubtotal = new ArrayList<Integer>();
			String orderId = oneOrder.getOrderId();
			printI("5");//5
			Orders order = ordersService.selectOrder(orderId);
			attr_orders.add(order);
			
			List<Cart> oneOrderCartsList = cartService.select(orderId);
			listOfProductSubtotal = calculateListOfProductSubtotal(oneOrderCartsList);
			
			int totalPriceOfOneOrder = 0;
			for (Integer oneProductSubtotal : listOfProductSubtotal) {
				totalPriceOfOneOrder += oneProductSubtotal;
			}
			
			int freight = calculateFreight(orderId);
			totalPriceOfOneOrder += freight;
			
			order.setAmount(totalPriceOfOneOrder);
			
			//int amount = 
			
			printI("6");//6
			Company company = companyService.selectCompany(oneOrder.getCompanyId());
			attr_company.add(company);
		
			printI("7");//7
			List<Cart> carts = cartService.select(orderId);
			Cart first_chart;
			if (carts.isEmpty()) {
				System.out.println("empty");
				first_chart = null;
			}
			else {
				first_chart = carts.get(0);
			}

			printI("8");//8
			if (first_chart == null) {
				System.out.printf("null ，continue");
				continue;
			}
			
			ProductData product = productService.select(first_chart.getPdId());
			attr_product.add(product);
			
			printI("9");//9
			if(oneOrder.getShipping()==1) {
				attr_address.add(oneOrder.getAddress1());
				printI("10");//10
			}else
			{
				if(oneOrder.getShipping()==2)
				{
					attr_address.add(oneOrder.getAddress2());
					printI("12");//11
				}
				if(oneOrder.getShipping()==0)
				{
					attr_address.add("");
					printI("13");//11
				}
				
			}

		}

		m.addAttribute("company", attr_company);
		m.addAttribute("userAccount", attr_user_account);
		m.addAttribute("attrAddress", attr_address);
		m.addAttribute("productData", attr_product);
		m.addAttribute("orders", attr_orders);
		
		return "CartList";

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


