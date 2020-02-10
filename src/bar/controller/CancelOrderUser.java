package bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Orders;
import bar.model.OrdersService;

@Controller
@EnableTransactionManagement
public class CancelOrderUser {
	
	private OrdersService ordersService;
	
	public CancelOrderUser(OrdersService ordersService) {
		this.ordersService=ordersService;
	}
	
	


	@RequestMapping(path = { "/CancelOrderUser.controller" })
	public String CancelOrderProcessAction(@RequestParam(name="orderId") String orderId,@RequestParam(name="status") Integer status,Model m) {
		
		
		String msg = null;
		Orders Orders = ordersService.selectOrder(orderId);
		if (Orders.getStatus() == 3) {
			msg = "訂單已付款，無法取消訂單，如有問題請洽客服，謝謝";
		} else if (Orders.getStatus() == 4) {
			msg = "訂單配送中，無法取消訂單，如有問題請洽客服，謝謝";
		} else if (Orders.getStatus() == 5) {
			msg = "訂單狀態已為取消";
		} else if (Orders.getStatus() == 6) {
			msg = "訂單已到貨，無法取消訂單，如有問題請洽客服，謝謝";
		} else {
			ordersService.updateToCancel(orderId, 5);
			msg = "訂單已更新";
		}

		m.addAttribute("msg", msg);
		
		return "CancelOrderUser";
	}
	
}
