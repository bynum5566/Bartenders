package bar.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.OrdersService;
import bar.model.ProductData;

@Controller
@SessionAttributes(names = { "Caccount", "CName"})
@EnableTransactionManagement
public class SalesReport {

	private OrdersService ordersService;
	private CompanyService companyService;

	public SalesReport(OrdersService ordersService,CompanyService companyService) {
		this.ordersService = ordersService;
		this.companyService=companyService;

	}
	
	@RequestMapping(path = { "/salesReport.controller" })
	public String salesReportProcessAction(@ModelAttribute(name = "Caccount") String account, Model m) {
		m.addAttribute("Caccount", account);
		Company company = companyService.select(account);		
		Integer companyId = company.getCompanyId();
		
		List<String> productNames = new ArrayList<String>();
		List<Integer> productsSoldQuantity = new ArrayList<Integer>();
		List<ProductData> products = ordersService.selectProductof(companyId);
		for(ProductData productData:products) {
			String productName = productData.getProductName();
			int productSoldQuantity = productData.getPdSoldQuantity();
			productNames.add('"' + productName + '"');
			productsSoldQuantity.add(productSoldQuantity);
		}
		
		
		System.out.println("productNames:"+productNames);
		System.out.println("productsSoldQuantity:"+productsSoldQuantity);

		m.addAttribute("productNames", productNames);
		m.addAttribute("productsSoldQuantity", productsSoldQuantity);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "SalesReport";
	}
}
