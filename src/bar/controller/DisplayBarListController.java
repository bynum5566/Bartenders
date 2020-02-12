/*豪*/
package bar.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import bar.model.CartService;
import bar.model.Company;

@Controller
@SessionAttributes(names = { 
		"account", 
		"listOfBar" 
		})
@EnableTransactionManagement
public class DisplayBarListController {

	private int i = 0; /*測式用參數*/
	private CartService cartService;	/*間接呼叫其他DAO*/
	
	//private OrdersService ordersService;
	//private CompanyService companyService;
	//private ProductDataService productService;
	//private ProductDataDAO productDataDAO ;
	//private UsersService userService;

	public void printI(String s){	/*測試用列印函數*/
		this.i++;
		System.out.printf("【%s】【%d】\n",s,i);
	}
	
	public DisplayBarListController(
			CartService cartService) {
		this.cartService = cartService;
	}

	@RequestMapping(path = { "/DisplayBarList.controller" })
	public String displayBarProductProcessAction(
			@ModelAttribute(name = "account") 
			String account, 
			Model m) {
		CartService.Pf("/DisplayBarList.controller，開始");
		
		List <Company>	listOfBar =  new ArrayList<>();		/*儲存所有酒吧的列表*/
		
		printI("1");//1
		
		listOfBar.addAll(cartService.selectAllBar());	/*回傳資料庫中所有的Bar*/

		m.addAttribute("listOfBar", listOfBar);
		m.addAttribute("account", account);
		
		CartService.Pf("/DisplayBarList.controller，結束");
		return "DisplayBarList";

	}
	
}


