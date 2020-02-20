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

@Controller
@SessionAttributes(names = "Caccount")
@EnableTransactionManagement
public class SaleReportByExcel {

	private OrdersService ordersService;
	private CompanyService companyService;

	public SaleReportByExcel(OrdersService ordersService,CompanyService companyService) {
		this.ordersService = ordersService;
		this.companyService=companyService;
	}
	
	@RequestMapping(path = { "/SaleReportByExcel.controller" })
	public String salesReportByExcelProcessAction(@ModelAttribute(name = "Caccount") String account, Model m) {
		m.addAttribute("Caccount", account);
		Company company = companyService.select(account);		
		Integer companyId = company.getCompanyId();
		
		List<Orders> OrdersOfCompany = new ArrayList<Orders>();
		OrdersOfCompany.addAll(ordersService.selectCompany(companyId, 3));
		OrdersOfCompany.addAll(ordersService.selectCompany(companyId, 4));
		OrdersOfCompany.addAll(ordersService.selectCompany(companyId, 6));
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		List<String> productNames = new ArrayList<String>();
		List<Integer> productsPrice = new ArrayList<Integer>();
		List<Integer> productsSoldQuantity = new ArrayList<Integer>();
		
		for(Orders orders:OrdersOfCompany) {
			String orderId = orders.getOrderId();
			List<Cart> soldProducts = ordersService.select(orderId);
			for(Cart soldProduct:soldProducts) {
				String productId = soldProduct.getPdId();

				String productName = ordersService.selectP(productId).getProductName();
				Integer productSoldQuantity = ordersService.selectP(productId).getPdSoldQuantity();
				
				int perProductPrice = soldProduct.getCheckoutPrice()*soldProduct.getQuantity();
				if (map.containsKey(productName)) {
					int oldPerProductPrice = map.get(productName);
					int newPerProductPrice = oldPerProductPrice + perProductPrice;
					map.remove(productName);
					map.put(productName, newPerProductPrice);
					map2.put(productName, productSoldQuantity);
				} else {
					map.put(productName, perProductPrice);
					map2.put(productName, productSoldQuantity);
				}
			}
		}
		
		for (String productName : map.keySet()) {
			for (String productName2 : map2.keySet()) {			
		}
			int perProductPriceSum = map.get(productName);
			productNames.add(productName);
			productsPrice.add(perProductPriceSum);
			int productSoldQuantity = map2.get(productName);			
			productsSoldQuantity.add(productSoldQuantity);
		}
		
		System.out.println("productNames(Excel):"+productNames+"------------------");
		System.out.println("productsPrice(Excel):"+productsPrice+"------------------");
		System.out.println("productsSoldQuantity(Excel):"+productsSoldQuantity+"------------------");
		m.addAttribute("productNames", productNames);
		m.addAttribute("productsPrice", productsPrice);
		m.addAttribute("productsSoldQuantity", productsSoldQuantity);
		return "SalesReportByExcel";
	}
}
