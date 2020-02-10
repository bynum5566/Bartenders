package bar.controller;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import bar.model.Cart;
import bar.model.CartDAO;
import bar.model.CartService;
import bar.model.Orders;
import bar.model.OrdersDAO;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;
import bar.model.UsersService;
import bar.model.Users;
@Controller
@SessionAttributes(names = "account")
@EnableTransactionManagement
public class DisplayProductInCart
{
	private ProductDataService pService;
	private UsersService uService;
	private OrdersService oService;
	private CartDAO cDao;
	private CartService cService;
	public DisplayProductInCart(ProductDataService pService, UsersService uService, OrdersService oService,
			CartDAO cDao, CartService cService)
	{
		this.pService = pService;
		this.uService = uService;
		this.oService = oService;
		this.cService = cService;
		this.cDao = cDao;
	}
	@RequestMapping(path = "/DisplayProductInCart.controller", method = RequestMethod.GET)
	public String DisplayCartProcessAction(
	//		@RequestParam("account") String account,
			@RequestParam("orderId") String orderId,
			Model m)
	{

		/* 測試用參數 */
//		String orderId = "1";
		System.out.println("orderId = " +orderId);
		/* 測試用參數 */
		CartService.Pf("開始，DisplayCartProcessAction");
		CartService.Pf2("m.getAttribute(account)",m.getAttribute("account"));
		String account = (String)m.getAttribute("account");
		int userId = uService.select(account).getId();
		CartService.Pf2("userId",userId);
		CartService.Pf2("account",account);
		/* 找出所有該使用者的購物車 */


		CartService.Pf("結束，DisplayCartProcessAction");

		List<Cart> oneOrderCartsList = cService.select(orderId);
		m.addAttribute("oneOrderCarts", oneOrderCartsList);
		
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
		for (Cart oneOrderCart : oneOrderCartsList) {
			ProductData products = pService.select(oneOrderCart.getPdId());
			listOfProduct.add(products);
		}
		m.addAttribute("listOfProduct", listOfProduct);
		m.addAttribute("orderId",orderId);	//新增20200131_0934
		

		return "DisplayProductInCart";
		// ===========================【結束】
	}
}
