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
//@SessionAttributes(names = "orderId")
@EnableTransactionManagement
public class doChangeShippingController {

	private OrdersService ordersService;
	private CartService cartService;
	private ProductDataService productService;

	
	public doChangeShippingController(OrdersService ordersService,CartService cartService,ProductDataService productService) {
		this.ordersService=ordersService;
		this.cartService=cartService;
		this.productService=productService;
	}
	
	@RequestMapping(path = { "/doChangeShipping.controller" })
	public String ChangeOrderProcessAction(
			@RequestParam(name="orderId") String orderId,
			@RequestParam(name = "recipient") String recipient,
			@RequestParam(name = "shippingType") String shippingType,
			@RequestParam(name = "address") String address,
			@RequestParam(name = "phone") String phone,Model m) {
		
		Orders order = ordersService.selectOrder(orderId);
		List<Cart> oneOrderCarts = cartService.select(orderId);
		int totalPrice = 0;
		int perProductPrice = 0;
		int finalTotalPrice = 0;
		int shippingPrice = 0;
		List<ProductData> attr_products = new ArrayList<ProductData>();
		List<Integer> productsPrice = new ArrayList<Integer>();
		for (Cart oneOrderCart : oneOrderCarts) {
			int cartCheckoutPrice = oneOrderCart.getCheckoutPrice();
			int cartQuantity = oneOrderCart.getQuantity();
			perProductPrice = cartCheckoutPrice * cartQuantity;
			productsPrice.add(perProductPrice);
			ProductData products = productService.select(oneOrderCart.getPdId());
			attr_products.add(products);
			totalPrice += perProductPrice;
		}

		String msg = null;
		if (order.getStatus() == 1) {                  
			if (shippingType.equals("HomeDelivery")) {
				order.setRecipient(recipient);
				order.setShipping(1);
				order.setAddress1(address);
				order.setPhone(phone);
				shippingPrice = 80;
				finalTotalPrice = totalPrice + shippingPrice;
				order.setAmount(finalTotalPrice);
			} else if (shippingType.equals("ConvenienceStore")) {
				order.setRecipient(recipient);
				order.setShipping(2);
				order.setAddress2(address);
				order.setPhone(phone);
				shippingPrice = 60;
				finalTotalPrice = totalPrice + shippingPrice;
				order.setAmount(finalTotalPrice);
			}else if (shippingType.equals("QR")) {
				order.setRecipient(recipient);
				order.setShipping(3);
				order.setPhone(phone);
				shippingPrice = 0;
				finalTotalPrice = totalPrice + shippingPrice;
				order.setAmount(finalTotalPrice);
			}
			
			msg = "訂單已更新";
		} else if (order.getStatus() == 3) {           //3:已付款未配送
			order.setRecipient(recipient);
			order.setAddress1(address);
			order.setAddress2(address);
			order.setPhone(phone);
			msg = "訂單已付款，無法更改配送方式，僅可修改收件人姓名、地址及電話，如有問題請洽客服，謝謝";
		} else if (order.getStatus() == 4) {           //4:已配送
			msg = "訂單已配送，無法更改訂單，如有問題請洽客服，謝謝";
		} else if (order.getStatus() == 5) {           //5:已取消
			msg = "訂單狀態已為取消";
		} else {
			msg = "不明的錯誤";
		}

		

		m.addAttribute("msg", msg);
		return "returnToCartList";
	}
}
