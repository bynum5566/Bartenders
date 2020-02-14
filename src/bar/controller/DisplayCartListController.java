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

	

	

	@RequestMapping(path = { "/DisplayCartList.controller" })
	public String userOrdersProcessAction(
			@ModelAttribute(name = "account") String account, 
			Model m) {

		Users user = userService.select(account);	/*用account 取得user物件*/
		int userId = user.getUserId();	/*用user物件 取得userId物件*/
		
		List<Orders> listOfOrder = new ArrayList<Orders>();	/*初始化*/
		listOfOrder.addAll(ordersService.selectUser(userId, 1)); /*取得此userId的...所有狀態為1的訂單*/
		
		
		
		m.addAttribute("Corders", listOfOrder);
		m.addAttribute("statusNumToStr", getStatusNumToStr());
		//m.addAttribute("ShippingNumToStr", getShippingNumToStr());
		m.addAttribute("ShippingNumToStr", CartService.getShippingNumToStr());	
		
		printI("3");//3
		List<Company> listOfCompany = new ArrayList<Company>();
		List<String> listOfUserAccount = new ArrayList<String>();
		List<String> listOfAddress = new ArrayList<String>();
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
		List<Orders> listOfOrders = new ArrayList<Orders>();
		
		printI("4");//4
		for (Orders oneOrder : listOfOrder) {
			List<Integer> listOfProductSubtotal = new ArrayList<Integer>();
			String orderId = oneOrder.getOrderId();
			printI("5");//5
			Orders order = ordersService.selectOrder(orderId);
			listOfOrders.add(order);
			
			List<Cart> oneOrderCartsList = cartService.select(orderId);
			listOfProductSubtotal = CartService.calculateListOfProductSubtotal(oneOrderCartsList);
			
			int totalPriceOfOneOrder = 0;
			totalPriceOfOneOrder = CartService.calculateTotalPriceOfOneOrder(listOfProductSubtotal);
			
			int freight = cartService.selectFreightByOrderId(orderId);

			totalPriceOfOneOrder += freight;
			
			order.setAmount(totalPriceOfOneOrder);
			
			
			printI("6");//6
			Company company = companyService.selectCompany(oneOrder.getCompanyId());
			listOfCompany.add(company);
		
			printI("7");//7
			List<Cart> listOfCart = cartService.select(orderId);
			Cart first_chart;
			if (listOfCart.isEmpty()) {
				System.out.println("empty");
				first_chart = null;
			}
			else {
				first_chart = listOfCart.get(0);
			}

			printI("8");//8
			if (first_chart == null) {
				System.out.printf("null ，continue");
				continue;
			}
			
			ProductData product = productService.select(first_chart.getPdId());
			listOfProduct.add(product);
			
			printI("9");//9
			if(oneOrder.getShipping()==1) {
				listOfAddress.add(oneOrder.getAddress1());
				printI("10");//10
			}else
			{
				if(oneOrder.getShipping()==2)
				{
					listOfAddress.add(oneOrder.getAddress2());
					printI("12");//11
				}
				if(oneOrder.getShipping()==0)
				{
					listOfAddress.add("");
					printI("13");//11
				}
				
			}

		}

		m.addAttribute("company", listOfCompany);
		//m.addAttribute("userAccount", listOfUserAccount);	//20200210
		//m.addAttribute("attrAddress", listOfAddress);	 //20200210
		m.addAttribute("productData", listOfProduct);
		m.addAttribute("orders", listOfOrders);
		
		return "DisplayCartList";

	}
	
}


