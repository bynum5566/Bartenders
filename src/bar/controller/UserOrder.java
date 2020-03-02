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

import bar.model.Users;
import bar.model.UsersService;

@Controller
@SessionAttributes(names = { "account", "recipient", "orderId", "productName", "amount", "shippingNumber", "address1",
		"phone","orders","userName" })
@EnableTransactionManagement
public class UserOrder {

	private OrdersService ordersService;
	private UsersService userService;

	public UserOrder(OrdersService ordersService,UsersService userService) {
		this.ordersService=ordersService;
		this.userService=userService;
	}

	public String[] getStatusNumToStr() {
		String returnStatus[] = {
				"",
		        "只先暫存購物車",
		        "未付款",
		        "已付款",
		        "配送中",
		        "已取消",
		        "已到貨"};
		return returnStatus;
	}
	
	public String[] getShippingNumToStr() {
		String returnShipping[] = {
				"",
		        "宅配",
		        "超商",
		        "QRcode電子票券"};
		return returnShipping;
	}
	
	

	@RequestMapping(path = { "/userOrder.controller" })
	public String userOrdersProcessAction(@ModelAttribute(name = "account") String account, Model m) {

		Users user = userService.select(account);
		int userId = user.getUserId();
		
		List<Orders> Corders = new ArrayList<Orders>();
		Corders.addAll(ordersService.selectUser(userId, 2));
		Corders.addAll(ordersService.selectUser(userId, 3));
		Corders.addAll(ordersService.selectUser(userId, 4));
		Corders.addAll(ordersService.selectUser(userId, 6));
		m.addAttribute("Corders", Corders);
		m.addAttribute("statusNumToStr", getStatusNumToStr());
		m.addAttribute("ShippingNumToStr", getShippingNumToStr());
		List<Company> attr_company = new ArrayList<Company>();
		List<String> attr_user_account = new ArrayList<String>();
		List<String> attr_address = new ArrayList<String>();
		List<List<ProductData>> attr_product = new ArrayList<List<ProductData>>();
		List<Orders> attr_orders = new ArrayList<Orders>();	

		for (Orders Corder : Corders) {
		
			Orders order = ordersService.selectOrder(Corder.getOrderId());
			attr_orders.add(order);
					
			Company company = ordersService.selectCompany(Corder.getCompanyId());
			attr_company.add(company);
		
			List<Cart> carts = ordersService.select(Corder.getOrderId());
			List<ProductData> tmp_attr_product = new ArrayList<ProductData>();
			for (Cart cart : carts) {
				ProductData product = ordersService.selectP(cart.getPdId());		
				tmp_attr_product.add(product);	
			}
			attr_product.add(tmp_attr_product);
			
			if(Corder.getShipping()==1) {
				attr_address.add(Corder.getAddress1());
			}else if(Corder.getShipping()==2){
				attr_address.add(Corder.getAddress2());
			}else {
				attr_address.add(Corder.getQrUrl());
			}
		}

		m.addAttribute("company", attr_company);
		m.addAttribute("userAccount", attr_user_account);
		m.addAttribute("attrAddress", attr_address);
		m.addAttribute("productData", attr_product);
		m.addAttribute("orders", attr_orders);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "UserOrder";

	}
}


