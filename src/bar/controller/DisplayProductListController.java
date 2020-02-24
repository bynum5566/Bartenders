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

import bar.model.Cart;
import bar.model.CartService;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.EventsAndNews;
import bar.model.EventsAndNewsDAO;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataDAO;
import bar.model.ProductDataService;
import bar.model.UsersService;
//<td align="center">${Corders[current.index].amount}</td>
@Controller
@SessionAttributes(names = { 
		"account", 
		"listOfProduct", 
		"productName", 
		"amount", 
		"shippingNumber", 
		"address1",
		"phone",
		"orders"
		})


@EnableTransactionManagement
public class DisplayProductListController {

	private int i = 0;
	private OrdersService ordersService;
	private CompanyService companyService;
	private CartService cartService;
	private ProductDataService productService;
	private ProductDataDAO productDataDAO ;
	private UsersService userService;
	private EventsAndNewsDAO eventsAndNewsDAO;	/*載入這個酒吧的所有事件*/

	public void printI(String s){
		this.i++;
		System.out.printf("【%s】【%d】\n",s,i);
	}
	
	public DisplayProductListController(
			OrdersService ordersService, 
			CompanyService comservice, 
			CartService cartService,
			ProductDataService productService, 
			ProductDataDAO productDataDAO,
			UsersService userService,
			EventsAndNewsDAO eventsAndNewsDAO
			) {
		this.ordersService = ordersService;
		this.companyService = comservice;
		this.cartService = cartService;
		this.productService = productService;
		this.productDataDAO = productDataDAO;
		this.userService = userService;
		this.eventsAndNewsDAO = eventsAndNewsDAO;
	}

	public String[] getStatusNumToStr() {
		String returnStatus[] = {
				"",
		        "只先暫存購物車",
		        "未付款",
		        "已付款未配送",
		        "已配送",
		        "已取消"};
		return returnStatus;
	}
	

	

	

	@RequestMapping(path = { "/DisplayProductList.controller" })
	public String userOrdersProcessAction(
			@ModelAttribute(name = "account") 
			String account, 
			@ModelAttribute(name = "barAccount") 
			String barAccount, 
			Model m) {
		//String companyAccount = "Test99999999";
		cartService.Pf("DisplayProductList，開始");
		
		String companyAccount = barAccount;	//【公司】【公司帳號】
		Company companyX = companyService.select(companyAccount);	
		
		int companyId = companyX.getCompanyId();
		
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
		
		printI("1");//1
		//listOfProduct.addAll(ordersService.selectUser(userId, 1));
		CartService.printValueTypeTime("companyId",companyId    );
		
		/*選擇Launched的產品(一般，QR)，開始*/
		//listOfProduct.addAll(productDataDAO.selectPds(companyId, "Launched"));	/*原本*/
		
		/*測試是否可用*/
			/*找這個酒吧的一般上架商品，不含QR*/
			//listOfProduct.addAll(productDataDAO.selectPdsLaunched(companyId));	/*測試*/
		
		/*找這個酒吧的一般上架商品，不含QR*/
		listOfProduct.addAll(productDataDAO.selectPdsLaunched(companyId));
		/*找這個酒吧的QR上架商品，不含一般*/
		listOfProduct.addAll(productDataDAO.selectTKPdsLaunched(companyId));
		
		/*選擇Launched的產品(一般，QR)，結束*/
		
		/*載入這個酒吧的所有事件，開始*/
		List<EventsAndNews> listOfEventOfOneBar = eventsAndNewsDAO.selectAllEN(companyId);
		CartService.printValueTypeTime("listOfEventOfOneBar",listOfEventOfOneBar);
		/*載入這個酒吧的所有事件，結束*/
		
		
		
		
		m.addAttribute("myBarX",cartService.selectMyBarByCompanyId(companyId));
		
		m.addAttribute("CompanyName", companyX.getCompanyName());
		m.addAttribute("listOfProduct", listOfProduct);
		m.addAttribute("account", account);
		m.addAttribute("barAccount", barAccount);
		/*Rosalie Wu的[我的最愛]按鈕會用到:companyId"*/
		m.addAttribute("companyId", companyId); //Wu
		m.addAttribute("listOfEventOfOneBar", listOfEventOfOneBar);	/*這個酒吧的所有事件*/
		
		CartService.Pf("DisplayProductList，結束");
		return "DisplayProductList";
		
//		return "displayProductListMk2";
		

	}
	
	public List <Integer> calculateListOfProductSubtotal(List <Cart> oneOrderCartsList) {
		int subltotalOfOneProduct = 0;
		List <Integer> listOfProductSubtotal = new ArrayList<Integer>();;
		for (Cart oneOrderCart : oneOrderCartsList)
		{
			int cartCheckoutPrice = oneOrderCart.getCheckoutPrice();
			int cartQuantity = oneOrderCart.getQuantity();
			
			subltotalOfOneProduct = cartCheckoutPrice * cartQuantity;
			listOfProductSubtotal.add(subltotalOfOneProduct);
		}
		return listOfProductSubtotal;
	}
	
	public int calculateFreight(String orderId) { /* 運費 */
		int shippingPrice = 0;
		Orders order = ordersService.selectOrder(orderId);
		int shipping = order.getShipping();
		/* 運費設定 */
		/* ======================== */
		int f0 = 0; /* 未選擇 */
		int f1 = 80;/* 宅配 */
		int f2 = 60;/* 超商 */
		int f3 = 0;/* QR票券 */
		/* ======================== */
		switch (shipping) {
		case 0:
			shippingPrice = f0;
			break;
		case 1:
			shippingPrice = f1;
			break;
		case 2:
			shippingPrice = f2;
			break;
		case 3:
			shippingPrice = f3;
			break;
		default:
			shippingPrice = 0;
		}
		return shippingPrice;
	}
}


