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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Cart;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;

@Controller
@SessionAttributes(names = {"Caccount", "CName"})
@EnableTransactionManagement
public class SalesReportSelectTime {
	
	private OrdersService ordersService;
	private CompanyService companyService;

	public SalesReportSelectTime(OrdersService ordersService,CompanyService companyService) {
		this.ordersService = ordersService;
		this.companyService=companyService;
	}
	
	@RequestMapping(path = { "/salesReportSelectTime.controller" })
	public String salesReportByPieProcessAction(@ModelAttribute(name = "Caccount") String account,@RequestParam(name = "startTime") String startTime,@RequestParam(name = "endTime") String endTime,Model m) {
		m.addAttribute("Caccount", account);
		Company company = companyService.select(account);		
		Integer companyId = company.getCompanyId();
		
		List<Orders> OrdersOfCompany = new ArrayList<Orders>();
		OrdersOfCompany.addAll(ordersService.selectOrdersByTime(companyId, 3, startTime+" 00:00:00.000", endTime+" 23:59:59.000"));
		OrdersOfCompany.addAll(ordersService.selectOrdersByTime(companyId, 4, startTime+" 00:00:00.000", endTime+" 23:59:59.000"));
		OrdersOfCompany.addAll(ordersService.selectOrdersByTime(companyId, 6, startTime+" 00:00:00.000", endTime+" 23:59:59.000"));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<String> productNames = new ArrayList<String>();
		List<Integer> productsSoldQuantity = new ArrayList<Integer>();
		
		for(Orders orders:OrdersOfCompany) {
			String orderId = orders.getOrderId();
			List<Cart> soldProducts = ordersService.select(orderId);
			for(Cart soldProduct:soldProducts) {
				String productId = soldProduct.getPdId();

				String productName = ordersService.selectP(productId).getProductName();
				int soldQuantity =soldProduct.getQuantity();

				if (map.containsKey(productName)) {
					int oldPerProductSoldQuantity = map.get(productName);
					int newPerProductSoldQuantity = oldPerProductSoldQuantity + soldQuantity;
					map.remove(productName);
					map.put(productName, newPerProductSoldQuantity);
				} else {
					map.put(productName, soldQuantity);
				}
			}
		}
		
		for (String productName : map.keySet()) {
			int perProductSoldQuantitySum = map.get(productName);
			productNames.add('"' + productName + '"');
			productsSoldQuantity.add(perProductSoldQuantitySum);
		}
		
		
		System.out.println("productNames:"+productNames+"------------------");
		System.out.println("productsSoldQuantity:"+productsSoldQuantity+"------------------");
		m.addAttribute("productNames", productNames);
		m.addAttribute("productsSoldQuantity", productsSoldQuantity);
		
		//for websocket
		WebSocketTest.setModel(m);

		return "SalesReportSelectTime";
	}
}
