/*豪*/
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Cart;
import bar.model.CartService;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;
import bar.model.UsersService;
import bar.model.Users;
//<td align="center">${listOfOrder[current.index].amount}</td>
@Controller
@SessionAttributes
(names = 
	{
			"account", 
			"recipient", 
			"orderId", 
			"productName", 
			"amount", 
			"shippingNumber", 
			"address1",
			"phone",
			"orders" 
	}
)
@EnableTransactionManagement
public class DisplayCartListController {

	private int i = 0;
	private OrdersService ordersService;
	private CompanyService companyService;
	private CartService cartService;
	private ProductDataService productService;
	private UsersService userService;

	public void printI(String s){
		this.i++;
		System.out.printf("【%s】【%d】\n",s,i);
	}
	
	public DisplayCartListController(
			OrdersService ordersService, 
			CompanyService comservice, 
			CartService cartService,
			ProductDataService productService, 
			UsersService userService) {
		this.ordersService = ordersService;
		this.companyService = comservice;
		this.cartService = cartService;
		this.productService = productService;
		this.userService = userService;
	}



	

	

	@RequestMapping(path = { "/DisplayCartList.controller" })
	public String userOrdersProcessAction(
			@ModelAttribute(name = "account") String account, 
			Model m) {

		Users user = userService.select(account);	/*用account 取得user物件*/
		int userId = user.getUserId();	/*用user物件 取得userId物件*/
		
		List<Orders> listOfOrder = new ArrayList<Orders>();	/*初始化*/
		listOfOrder.addAll(ordersService.selectUser(userId, 1)); /*取得此userId的...所有狀態為1的訂單*/
		
		
		
		
		m.addAttribute("listOfOrder", listOfOrder); /*Corders>listOfOrder*/	
		
		printI("3");//3
		List<Company> listOfCompany = new ArrayList<Company>();
		List<String> listOfUserAccount = new ArrayList<String>();
		//List<String> listOfAddress = new ArrayList<String>();
		List<ProductData> listOfFirstProductOfOrder = new ArrayList<ProductData>();
		List<Orders> listOfOrders = new ArrayList<Orders>();
		
		List<Object> listOflistOfCart = new ArrayList<Object>();	/*CartList的List*/
		List<Object> listOflistOfProduct = new ArrayList<Object>();	/*CartList的List*/
		
		printI("4");//4
		for (Orders oneOrder : listOfOrder) {	/*所有的訂單*/
			List<Integer> listOfProductSubtotal = new ArrayList<Integer>();
			String orderId = oneOrder.getOrderId();	/*取得訂單id*/
			printI("5");//5
			Orders order = ordersService.selectOrder(orderId);	/*取得訂單物件*/
			listOfOrders.add(order);	/*訂單物件加到 list中*/
			
			List<Cart> oneOrderCartsList = cartService.select(orderId);	/*用orderId取得cart list*/
			listOfProductSubtotal = CartService.calculateListOfProductSubtotal(oneOrderCartsList); /*計算單商品小計*/
			
			int totalPriceOfOneOrder = 0;
			totalPriceOfOneOrder = CartService.calculateTotalPriceOfOneOrder(listOfProductSubtotal); /*計算單訂單金額（不含運費）*/
			
			int freight = cartService.selectFreightByOrderId(orderId);/*取得運費*/

			totalPriceOfOneOrder += freight;	/*計算單訂單金額（含運費）*/
			
			order.setAmount(totalPriceOfOneOrder);	/*單訂單金額（含運費），寫入資料庫*/
			
			
			printI("6");//6
			Company company = companyService.selectCompany(oneOrder.getCompanyId());	/*取得Company物件*/	/*這個賣家酒吧的Company物件*/
			listOfCompany.add(company);	/*加到賣家list中*/
		
			printI("7");//7
			List<Cart> listOfCartOfOneOrder = cartService.select(orderId);	/*取得訂單的 Cart list*/
			
			List<ProductData> listOfProductNameOfOneOrder = new ArrayList<ProductData>();
			
			for (int n = 0; n <= listOfCartOfOneOrder.size() - 1; n++) {
				String stringPdid = listOfCartOfOneOrder.get(n).getPdId();
				ProductData productX = cartService.selectProductDataByPdid(stringPdid);
				listOfProductNameOfOneOrder.add(productX);
			}
			
			listOflistOfCart.add(listOfCartOfOneOrder);	/*把Cart list*/
			
			listOflistOfProduct.add(listOfProductNameOfOneOrder);
			
			Cart firstCart;
			if (listOfCartOfOneOrder.isEmpty()) {
				System.out.println("這個訂單是空的");
				firstCart = null;
			}
			else {
				firstCart = listOfCartOfOneOrder.get(0); /*取得第一個Cart*/
			}

			printI("8");//8
			if (firstCart == null) {
				System.out.printf("這個訂單是空的");
				continue;
			}
			
			ProductData firstProduct = productService.select(firstCart.getPdId());	/*取得第一個Cart的產品物件*/
			listOfFirstProductOfOrder.add(firstProduct);	/*每個訂單的第一個產品物件 list*/
			



		}

		m.addAttribute("listOfCompany", listOfCompany);	/*company >　listOfCompany*/
		//m.addAttribute("userAccount", listOfUserAccount);	//20200210
		//m.addAttribute("attrAddress", listOfAddress);	 //20200210
		m.addAttribute("listOfFirstProductOfOrder", listOfFirstProductOfOrder);	/*productData >　listOfFirstProductOfOrder*/
		m.addAttribute("listOfOrders", listOfOrders);	/*orders > listOfOrders*/
		m.addAttribute("listOflistOfCart",listOflistOfCart);
		m.addAttribute("listOflistOfProduct",listOflistOfProduct);
		
		
		
		
		
		return "DisplayCartList";	/*試製雙層foreach*/
		//return "DisplayCartListPrototype";

	}
	
}


