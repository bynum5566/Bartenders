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
public class CancelCartController {
	
	private OrdersService ordersService;
	
	public CancelCartController(OrdersService ordersService) {
		this.ordersService=ordersService;
	}
	
	


	@RequestMapping(path = { "/CancelCart.controller" })
	public String CancelOrderProcessAction(@RequestParam(name="orderId") String orderId,@RequestParam(name="status") Integer status,Model m) {
		
		
		String msg = null;
		Orders Orders = ordersService.selectOrder(orderId);
		if(Orders.getStatus()==3){
			msg = "訂單已付款，無法取消訂單，如有問題請洽客服，謝謝";
		}else if (Orders.getStatus()==4) {
			msg = "訂單已配送，無法取消訂單，如有問題請洽客服，謝謝";
		} else if (Orders.getStatus()==5) {
			msg = "訂單狀態已為取消";
		} else {
			Orders.setStatus(5);
			msg = "訂單已更新";
		}
//		boolean order1 = ordersService.updateToCancel(orderId,5);
		
//		System.out.println("order1"+Orders);
		
		
	//	  boolean result = ordersService.updateToCancel(orderId,5);

		m.addAttribute("msg", msg);
		
		
		return "CancelCart";
	}
	
}
