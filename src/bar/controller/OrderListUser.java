package bar.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Cart;
import bar.model.CartService;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;

@Controller
@EnableTransactionManagement
public class OrderListUser {
	
	private OrdersService ordersService;

	public OrderListUser(OrdersService ordersService) {
		this.ordersService=ordersService;

	}
		
	public static int[] getShippingNumToPrice(int shipping) {
		int returnShippingPrice[] = {
				0,
		        80,//宅配
		        60,
		        0};//超商
		return returnShippingPrice;
	}
	
	@RequestMapping(path = { "/OrderListUser.controller" })
	public String OrderListProcessAction(@RequestParam(name="orderId") String orderId,@ModelAttribute(name = "orderId") String orderId1, Model m) {

		List<Cart> oneOrderCarts = ordersService.select(orderId);
//**	List<Cart> oneOrderCarts = cartService.select(orderId);
		m.addAttribute("oneOrderCarts", oneOrderCarts);
		int totalPrice = 0;
		int perProductPrice=0;
		int finalTotalPrice =0;
		int shippingPrice =0;
		List<ProductData> attr_products = new ArrayList<ProductData>();
		List<Integer> productsPrice = new ArrayList<Integer>();
		for (Cart oneOrderCart : oneOrderCarts) {			
			int cartCheckoutPrice = oneOrderCart.getCheckoutPrice();
			int cartQuantity = oneOrderCart.getQuantity();
			perProductPrice = cartCheckoutPrice*cartQuantity;
			productsPrice.add(perProductPrice);
			ProductData products = ordersService.selectP(oneOrderCart.getPdId());
//**		ProductData products = productService.select(oneOrderCart.getPdId());
			attr_products.add(products);
			 totalPrice += perProductPrice;
			 
			
		}
		
		Orders order = ordersService.selectOrder(orderId);
		int shipping = order.getShipping();
		
		if(shipping==1) {
			shippingPrice=80;
			
		}else if(shipping==2){
			shippingPrice=60;
		}else {
			shippingPrice=0;
		};
		
		m.addAttribute("ShippingNumToPrice", getShippingNumToPrice(shipping));
		m.addAttribute("order", order);
		m.addAttribute("shipping", shipping);
		m.addAttribute("productData", attr_products);
		m.addAttribute("productsPrice", productsPrice);	
		m.addAttribute("totalPrice", totalPrice);
		
		finalTotalPrice =totalPrice+shippingPrice;
		m.addAttribute("finalTotalPrice", finalTotalPrice);
		return "OrderListUser";
	}
	
}

