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
import java.util.Random;

@Controller
@SessionAttributes(names = { 
		"account", 
		"listOfBar" 
		})
@EnableTransactionManagement
public class DisplayBarListController {

	private CartService cartService;	/*間接呼叫其他DAO*/
	
	public DisplayBarListController(
			CartService cartService) {
		this.cartService = cartService;
	}

	@RequestMapping(path = { "/DisplayBarList.controller" })
	public String DisplayBarListProcessAction(
			@ModelAttribute(name = "account") 
			String account, 
			Model m) {
		CartService.Pf("/DisplayBarList.controller，開始");
		
		List <Company>	listOfBar =  new ArrayList<>();		/*儲存所有酒吧的列表*/
		
		listOfBar.addAll(cartService.selectAllBar());	/*回傳資料庫中所有的Bar*/

		m.addAttribute("listOfBar", listOfBar);
		m.addAttribute("account", account);
		m.addAttribute("title", "所有酒吧");

		CartService.Pf("/DisplayBarList.controller，結束");
		return "DisplayBarList";

	}

	@RequestMapping(path = { "/DisplayRandomBarList.controller" })
	public String DisplayRandomBarListProcessAction(
			@ModelAttribute(name = "account") 
			String account, 
			Model m) {
		CartService.Pf("/DisplayBarList.controller_TestVer，開始");
		
		List <Company>	listOfBar =  new ArrayList<>();		/*儲存所有酒吧的列表*/
		
		
		int randomNumber = 5;	/*要隨機選取幾個數字*/
		int numbersOfBar = 0;	/*用來存總共有幾個Bar，初始化*/		
		
		listOfBar.addAll(cartService.selectAllBar());	/*回傳資料庫中所有的Bar*/
		
		numbersOfBar = listOfBar.size();	/*目前資料庫有幾個Bar*/
		CartService.printValueTypeTime("numbersOfBar",numbersOfBar);	/*印出*/
		
		/*如果要隨機的數量比，大於等於，總共數量。不需要隨機*/
		if( randomNumber >= numbersOfBar) {
			System.out.println("不需要隨機，因為randomNumber >= numbersOfBar");
			m.addAttribute("listOfBar", listOfBar);
			m.addAttribute("account", account);
			m.addAttribute("title", "精選酒吧");
			return "DisplayBarList";
		}
		
		System.out.println("需要隨機");
		Random random;
		
		List <Company>	randomListOfBar =  new ArrayList<>();	/*儲存隨機酒吧的列表*/
		randomListOfBar = cartService.selectAllBar();
		randomListOfBar.size();
		
		
		//===========
		System.out.println("只是印");
		int index = 0;
		for(Company CompanyX : randomListOfBar) 
		{
			CartService.printValueTypeTime("CompanyX.getCompanyId()",CompanyX.getCompanyId() );
			CartService.printValueTypeTime("index", index);
			index++;
		}
		//===========

		System.out.println("隨機選取開始");
		int numbersToDelete = numbersOfBar - randomNumber;	/*要刪除掉幾個多餘的項目*/
		
		int size=0;
		int randomIndex=0;
		/* 0 ~ numbersOfBar-1 */	/*從這個範圍中選擇1個來刪除*/
		for(int i = 1 ; i <= numbersToDelete ; i++) {		/*多餘幾個項目就跑幾次*/
			size = randomListOfBar.size();					/*目前的大小*/
			CartService.printValueTypeTime("i",i);			/*印出i*/
			CartService.printValueTypeTime("size",size);	/*印出size*/
			
			random = new Random();
			randomIndex = random.nextInt(size);	/*範圍:0~目前的大小-1*/		/*從範圍中選一個來刪除*/
			CartService.printValueTypeTime("randomIndex",randomIndex);	/*印出randomIndex*/
			
			CartService.printValueTypeTime("CompanyId",randomListOfBar.get(randomIndex).getCompanyId());	/*顯示將要刪除的CompanyId*/
			randomListOfBar.remove(randomIndex);	/*刪除掉*/

		}
		
		//===========
		
		System.out.println("只是印");
		index = 0;
		for(Company CompanyX : randomListOfBar) 
		{
			CartService.printValueTypeTime("CompanyX.getCompanyId()",CompanyX.getCompanyId() );
			CartService.printValueTypeTime("index", index);
			index++;
		}
		//===========
		
		m.addAttribute("listOfBar", randomListOfBar);
		m.addAttribute("account", account);
		m.addAttribute("title", "精選酒吧");
		
		CartService.Pf("/DisplayBarList.controller_TestVer，結束");
		return "DisplayBarList";

	}
	
}


