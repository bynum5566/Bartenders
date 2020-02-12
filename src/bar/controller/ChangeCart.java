/*豪*/
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
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;

@Controller
@EnableTransactionManagement
public class ChangeCart {
	private OrdersService ordersService;
	private CartService cartService;
	private ProductDataService productService;
	
	public ChangeCart(OrdersService ordersService,CartService cartService,ProductDataService productService){
		this.ordersService=ordersService;
		this.cartService=cartService;
		this.productService=productService;
	}
	

	

	@RequestMapping(path = { "/ChangeCart.controller" })
	public String ChangeOrderProcessAction(@RequestParam(name = "orderId") String orderId,Model m) {
		m.addAttribute("orderId", orderId);
		Orders orderX = ordersService.selectOrder(orderId);
		
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
//		List<String> attr_address = new ArrayList<String>();
		String address;
		
		List<Cart> listOfCart = cartService.select(orderId);
		Cart firstCart = listOfCart.get(0);
		ProductData firstProduct = productService.select(firstCart.getPdId());
		listOfProduct.add(firstProduct);
		
		if(orderX.getShipping()==1) {
//			attr_address.add(order.getAddress1());
			address = orderX.getAddress1();
		}else{
//			attr_address.add(order.getAddress2());
			address = orderX.getAddress2();
		}
		
		/*order 改為 orderX*/
		m.addAttribute("orderX", orderX);				/*order物件*/
		//m.addAttribute("product", firstProduct);		/*Cart中第一個產品*/	/*沒用到*/
		m.addAttribute("productData", listOfProduct);	/*購物車中，的產品list*/
		m.addAttribute("ShippingType", CartService.getShippingNumToStr());	//
		m.addAttribute("Address", address);			/*地址*/
		CartService.printValueTypeTime("address", address);
		
		
	
	return "ChangeShipping";
	
	}
}