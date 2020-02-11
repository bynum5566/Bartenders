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

@Controller
@SessionAttributes(names = "Caccount")
@EnableTransactionManagement
public class CompanyOrder {

	private OrdersService ordersService;
	private CompanyService companyService;

	public CompanyOrder(OrdersService ordersService,CompanyService companyService) {
		this.ordersService = ordersService;
		this.companyService=companyService;

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
	
	@RequestMapping(path = { "/companyOrder.controller" })
	public String companyOrdersProcessAction(@ModelAttribute(name = "Caccount") String account, Model m) {

		m.addAttribute("Caccount", account);
		Company company = companyService.select(account);		
		int companyId = company.getCompanyId();

		List<Orders> Corders = new ArrayList<Orders>();
		Corders.addAll(ordersService.selectCompany(companyId, 2));
		Corders.addAll(ordersService.selectCompany(companyId, 3));
		Corders.addAll(ordersService.selectCompany(companyId, 4));
		Corders.addAll(ordersService.selectCompany(companyId, 6));
		m.addAttribute("Corders", Corders);
		m.addAttribute("statusNumToStr", getStatusNumToStr());
		m.addAttribute("ShippingNumToStr", getShippingNumToStr());
		List<Users> attr_user = new ArrayList<Users>();
		List<String> attr_user_account = new ArrayList<String>();
		List<String> attr_address = new ArrayList<String>();
		List<ProductData> attr_product = new ArrayList<ProductData>();
		List<Orders> attr_orders = new ArrayList<Orders>();
		

//		for (Orders Corder : Corders) {
		for (int index = 0; index < Corders.size(); index++) {
			Orders Corder = Corders.get(index);
			
			Orders order = ordersService.selectOrder(Corder.getOrderId());
			attr_orders.add(order);
			
			Users user = ordersService.selectUser(Corder.getUserId());
//**		Users user = userService.selectUser(Corder.getUserId());
			attr_user.add(user);
			attr_user_account.add(user.getAccount());

			
			List<Cart> carts = ordersService.select(Corder.getOrderId());
//**		List<Cart> carts = cartService.select(Corder.getOrderId());
			Cart first_chart = carts.get(0);
			ProductData product = ordersService.selectP(first_chart.getPdId());
//**		ProductData product = productService.select(first_chart.getPdId());
			attr_product.add(product);
			
			if(Corder.getShipping()==1) {
				attr_address.add(Corder.getAddress1());
			}else if(Corder.getShipping()==2){
				attr_address.add(Corder.getAddress2());
			}else {
				attr_address.add(Corder.getQrUrl());
			}

		}

		m.addAttribute("user", attr_user);
		m.addAttribute("userAccount", attr_user_account);
		m.addAttribute("attrAddress", attr_address);
		m.addAttribute("productData", attr_product);
		m.addAttribute("orders", attr_orders);
		return "CompanyOrder";

	}
}