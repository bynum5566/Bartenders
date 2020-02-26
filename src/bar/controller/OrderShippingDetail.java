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
public class OrderShippingDetail {
	private OrdersService ordersService;

	public OrderShippingDetail(OrdersService ordersService) {
		this.ordersService = ordersService;
	}

	public String[] getShippingNumToStr() {
		String returnShipping[] = { "", "宅配", "超商", "QRcode電子票券" };
		return returnShipping;
	}

	@RequestMapping(path = { "/orderShippingDetail.controller" })
	public String ChangeOrderProcessAction(@RequestParam(name = "orderId") String orderId, Model m) {
		m.addAttribute("orderId", orderId);
		Orders order = ordersService.selectOrder(orderId);

		List<ProductData> attr_product = new ArrayList<ProductData>();
		String attr_address;

		List<Cart> carts = ordersService.select(orderId);
		Cart first_chart = carts.get(0);
		ProductData product = ordersService.selectP(first_chart.getPdId());
		attr_product.add(product);

		if (order.getShipping() == 1) {
			attr_address = order.getAddress1();
		} else {
			attr_address = order.getAddress2();
		}

		m.addAttribute("order", order);
		m.addAttribute("product", product);
		m.addAttribute("productData", attr_product);
		m.addAttribute("ShippingNumToStr", getShippingNumToStr());
		m.addAttribute("attrAddress", attr_address);

		return "OrderShippingDetail";

	}
}