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
public class SalesReportByPie {
	
	private OrdersService ordersService;
	private CompanyService companyService;

	public SalesReportByPie(OrdersService ordersService,CompanyService companyService) {
		this.ordersService = ordersService;
		this.companyService=companyService;

	}
	
	@RequestMapping(path = { "/salesReportByPie.controller" })
	public String salesReportByPieProcessAction(@ModelAttribute(name = "Caccount") String account, Model m) {
		m.addAttribute("Caccount", account);
		Company company = companyService.select(account);		
		Integer companyId = company.getCompanyId();
		
		List<Orders> OrdersOfCompany = new ArrayList<Orders>();
		OrdersOfCompany.addAll(ordersService.selectCompany(companyId, 3));
		OrdersOfCompany.addAll(ordersService.selectCompany(companyId, 4));
		OrdersOfCompany.addAll(ordersService.selectCompany(companyId, 6));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<String> productNames = new ArrayList<String>();
		List<Integer> productsPrice = new ArrayList<Integer>();
		
		for(Orders orders:OrdersOfCompany) {
			String orderId = orders.getOrderId();
			List<Cart> soldProducts = ordersService.select(orderId);
			for(Cart soldProduct:soldProducts) {
				String productId = soldProduct.getPdId();

				String productName = ordersService.selectP(productId).getProductName();
				int perProductPrice = soldProduct.getCheckoutPrice()*soldProduct.getQuantity();

				if (map.containsKey(productName)) {
					int oldPerProductPrice = map.get(productName);
					int newPerProductPrice = oldPerProductPrice + perProductPrice;
					map.remove(productName);
					map.put(productName, newPerProductPrice);
				} else {
					map.put(productName, perProductPrice);
				}
			}
		}
		
		for (String productName : map.keySet()) {
			int perProductPriceSum = map.get(productName);
			productNames.add('"' + productName + '"');
			productsPrice.add(perProductPriceSum);
		}
		
		
		System.out.println("productNames(pie):"+productNames+"------------------");
		System.out.println("productsPrice(pie):"+productsPrice+"------------------");
		m.addAttribute("productNamesForPie", productNames);
		m.addAttribute("productsPrice", productsPrice);
		
		//for websocket
		WebSocketTest.setModel(m);

		return "SalesReportByPie";
	}
}
