/*豪*/
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
@SessionAttributes(names = {"account","userName"})
@EnableTransactionManagement
public class DisplayCartController
{
	private ProductDataService pService;
	private UsersService uService;
	private OrdersService oService;
	private CartDAO cDao;
	private CartService cService;
	public DisplayCartController(ProductDataService pService, UsersService uService, OrdersService oService,
			CartDAO cDao, CartService cService)
	{
		this.pService = pService;
		this.uService = uService;
		this.oService = oService;
		this.cService = cService;
		this.cDao = cDao;
	}
	@RequestMapping(path = "/DisplayCart.controller", method = RequestMethod.GET)
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
		int userId = uService.select(account).getUserId();
		CartService.Pf2("userId",userId);
		CartService.Pf2("account",account);
		/* 找出所有該使用者的購物車 */
		int status = 1;/* 測試參數，狀態值 */
		printOrder0(userId, status, m);
		CartService.Pf("結束，DisplayCartProcessAction");
		// return "DisplayCart";
		// return "OrderList.controller";
		// return "OrderList";
		// ===========================【開始】

		List<Cart> oneOrderCartsList = cService.select(orderId);/*List，找出單[購物車]的所有Cart*/
		m.addAttribute("oneOrderCarts", oneOrderCartsList);
		
		int subltotalOfOneProduct = 0;
		int totalPriceOfOneOrderPlusFreight = 0;
		int shippingPrice = 0;
		List<ProductData> listOfProduct = new ArrayList<ProductData>();/*List，用來存單[購物車]的ProductData*/
		List<Integer> listOfProductSubtotal = new ArrayList<Integer>();/*List，用來存單[購物車]各個產品的小計*/
		
		
		listOfProductSubtotal = CartService.calculateListOfProductSubtotal(oneOrderCartsList);/*List，計算並存單[購物車]各個產品的小計*/


		
		int totalPriceOfOneOrder = 0;
		totalPriceOfOneOrder = CartService.calculateTotalPriceOfOneOrder(listOfProductSubtotal);/*計算單[購物車]不含運費的金額*/
//		for (Integer oneProductSubtotal : listOfProductSubtotal) {	/*計算單[購物車]不含運費的金額*/
//			totalPriceOfOneOrder += oneProductSubtotal;
//		}

		for (Cart oneOrderCart : oneOrderCartsList) {
			ProductData products = pService.select(oneOrderCart.getPdId());
			listOfProduct.add(products);
		}
		
		/*運費======================*/
		shippingPrice = freight(orderId);	/*取得運費*/
		/*運費======================*/
		
		
		
		
		/*===============*/
		Orders order = oService.selectOrder(orderId);
		int shipping = order.getShipping();
		m.addAttribute("order", order);
		m.addAttribute("shipping", shipping);
		m.addAttribute("ShippingNumToPrice", getShippingNumToPrice(shipping));
		/*===============*/
		m.addAttribute("productData", listOfProduct);
		m.addAttribute("productsPrice", listOfProductSubtotal);
		m.addAttribute("totalPrice", totalPriceOfOneOrder);
		totalPriceOfOneOrderPlusFreight = totalPriceOfOneOrder + shippingPrice;
		m.addAttribute("finalTotalPrice", totalPriceOfOneOrderPlusFreight);
		
		
		//==================================
		//導入預設值
		//收件人
		
		//改在訂單建立時設定預設值
		
		Users userX = uService.select(account);
		
//		String name = userX.getUserName();
//		String phone = userX.getPhone();
//		String address = userX.getAddress();
		
		String name = order.getRecipient();
		String phone = order.getPhone();
		
		String address;
		switch(shipping)
		{
		case 0:
			address = order.getAddress1();
			break;
		case 1:
			address = order.getAddress1();
			break;
		case 2:
			address = order.getAddress2();
			break;
		case 3:
			address = null;
			break;
		default:
			address = null;
			System.out.println("【error】");
			break;
		}

		
		m.addAttribute("defaultName", name);
		m.addAttribute("defaultPhone", phone);
		m.addAttribute("defaultAddress", address);	
		m.addAttribute("orderId",orderId);	//新增20200131_0934

		
		//==================================
//		return "OrderList";
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "DisplayCartDetail";
		// ===========================【結束】
//		return "TestPage";
	}
	

	
	public int freight(String orderId) { /* 運費 */
		int shippingPrice = 0;
		Orders order = oService.selectOrder(orderId);
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

	public void printOrder0(int userId, int status, Model m) /* 該使用者，所有狀態為status的訂單 */
	{
		List<Orders> orderList = oService.selectUser(userId, status);
		m.addAttribute("oneOrderCarts", orderList);
		for (int i = 0; i <= orderList.size() - 1; i++) {
			CartService.Pf2("i", i);
			printCart0(orderList.get(i).getOrderId(), m); /* printCart0(orderId); 印出訂單所有的值 */
		}
	}

	public void printCart0(String orderId, Model m) /* 印出訂單所有的值 */
	{
		printCart1(orderId, m);/* 找出該orderId【可直接查出】的所有值 */
		printCart2(orderId);/* 找出該orderId，在Cart中的所有項目 */
	}

	public void printCart1(String orderId, Model m)/* 印出直接可讀取的項目 */
	{
		CartService.Pf0();
		Orders orderX;
		orderX = oService.selectOrdersByOrderId(orderId);
		CartService.Pf2("oX.getOrderId()", orderX.getOrderId());
		CartService.Pf2("oX.getAddress1()", orderX.getAddress1());
		CartService.Pf2("oX.getAddress2()", orderX.getAddress2());
		CartService.Pf2("oX.getAmount()", orderX.getAmount());
		CartService.Pf2("oX.getCompanyId()", orderX.getCompanyId());
		CartService.Pf2("oX.getCreateTime()", orderX.getCreateTime());
		CartService.Pf2("oX.getPhone()", orderX.getPhone());
		CartService.Pf2("oX.getRecipient()", orderX.getRecipient());
		CartService.Pf2("oX.getShipping()", orderX.getShipping());
		CartService.Pf2("oX.getShippingNumber()", orderX.getShippingNumber());
		CartService.Pf2("oX.getStatus()", orderX.getStatus());
		CartService.Pf2("oX.getUserId", orderX.getUserId());
		CartService.Pf0();
	}
	public void printCart2(String orderId)/* 找出該orderId，在Cart中的所有項目 */
	{
		CartService.Pf2("out", cDao.select(orderId).toString());
		//// PrintC.Pf2("out", cService.selectCartList(orderId).toString());
		List<Cart> cartSet = cDao.select(orderId);
		//// List<Cart> cartSet = cService.selectCartList(orderId);
		String productId;
		int qtyOfproduct;
		System.out.println(cartSet.size());
		for (int i = 0; i <= cartSet.size() - 1; i++)
		{
			productId = cartSet.get(i).getPdId();
			ProductData productDataX = pService.select(productId);
			//ProductData productDataX = pService.selectProductVer2(productId);
			qtyOfproduct = cartSet.get(i).getQuantity();
			CartService.Pf2("productId", productId);
			CartService.Pf2("qtyOfproduct", qtyOfproduct);
		}
	}
	public static int[] getShippingNumToPrice(int shipping)
	{
		int returnShippingPrice[] =
		{ 0,  // 未選擇
		  80, // 宅配
		  60, // 超商
		  0 , //QR票券
		  };
		return returnShippingPrice;
	}
	private void printInputData(String account)
	{
		CartService.Pf2("account", account);
	}
}
