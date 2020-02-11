/*豪*/
package bar.controller;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Cart;
import bar.model.CartDAO;
import bar.model.CartService;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersDAO;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;
import bar.model.UsersService;
import bar.model.Users;
@Controller
//@SessionAttributes(names = "account")
@SessionAttributes({"account","num"})

@EnableTransactionManagement
public class UpdateQtyInCartController
{
	private ProductDataService productDataService;
	private UsersService userService;
	private OrdersService ordersService;
	private CompanyService companyService;
	private CartDAO cartDao;
	private CartService cartService;	/*新增20200201_1509*/
	private OrdersDAO ordersDao;

	public UpdateQtyInCartController(ProductDataService pService, UsersService uService, OrdersService oService,
			CartDAO cDao, CompanyService cService 
			,CartService cartService	/*新增20200201_1509*/
			,OrdersDAO ordersDao
			)
	{
		this.productDataService = pService;
		this.userService = uService;
		this.ordersService = oService;
		this.cartDao = cDao;
		this.companyService = cService;
		this.cartService = cartService;	/*新增20200201_1509*/
		this.ordersDao = ordersDao;
	}
	@RequestMapping(path = "/UpdateQtyInCart.controller", method = RequestMethod.GET)
	public String AddProductToCartProcessAction(
			@RequestParam("PdId") String pdId, 
			@RequestParam("qty") String qty,
			@RequestParam("PdStock") String PdStock, 
			@RequestParam("ProductName") String ProductName,
			@ModelAttribute(name = "account") String account, // new
			Model m)
	{
		/* 運費設定 */
		/* ======================== */
		int f0 = 0; /* 未選擇 */
		int f1 = 80;/* 宅配 */
		int f2 = 60;/* 超商 */
		int f3 = 0;/* QR票券 */
		/* ======================== */
		CartService.Pf("AddProductToCartProcessAction，Start");
		/* 參數宣告 */
		String orderId = "0";
		/* 參數宣告結束 */
		CartService.Pf2("account", account);
		CartService.Pf2("pdId", pdId);
		CartService.Pf2("ProductName", ProductName);
		CartService.Pf2("PdStock", PdStock);
		CartService.Pf2("qty", qty);
		/* =============================================== */
		

		/* =============================================== */

//		if (QtyOfAddToCart > nowStock) /* 選取的數量>庫存 */
		if (selectLessThanStock(pdId, qty)) /*判斷庫存*/ /* 選取的數量>庫存 */
		{
			/* 庫存不足 */
			String error = "庫存不足，請重新選擇";
			addAttribute(account, m, pdId, qty ,error);
			return "AddToCartButton";
		} else	/*庫存足夠*/
		{
			System.out.println("判斷訂單，開始==============================");
			/*判斷訂單，開始*/
			/* 存在此廠商的 訂單編號 且狀態為購物車狀態？ */
			int companyId = getCompanyIdByPdId(pdId);
			int userId  = getUserIdByAccount(account);
			/*找productData*/
			ProductData ProductDataX =  cartService.selectP(pdId);
			
			if (ProductDataX.getValidDate() == null )
			{
				System.out.println("==============一般商品================");
				/*取得Normal訂單*/
				System.out.printf("%d %d %d",companyId, 1, userId);
				List <Orders> ordersListNormal;
//				ordersListNormal = null;
				Integer  status = 1 ;
				Integer shipping = 3;
				ordersListNormal = ordersDao.selectListUserCompanyStatusOrderNormal(companyId, status, userId, shipping);
				if(ordersListNormal.isEmpty()) {
					System.out.println("==============沒Normal類訂單，需要新增================");
					shipping = 0;
					orderId = "1";
					Date date;
					date = new Date();
					orderId = userId +Long.toString(date.getTime());
					System.out.println("orderId = ");
					System.out.println(orderId);
					//===
					String recipient= userService.select(account).getUserName();
//					String recipient=null;
					java.sql.Date createTime;
					createTime  = new java.sql.Date(date.getTime());
					int amount = 0;
					String address1 = null;	
					String address2 = null; 
					String phone = null;	
					String shippingNumber = null;

					Orders orders = new Orders(
							orderId, 
							companyId, 
							userId, 
							recipient, 
							(int)status, 
							createTime,
							amount, 
							(int)shipping, 
							address1, address2, phone, shippingNumber);
					
					ordersDao.insert(orders);
					//===============
//					String error = "測試終止";
//					addAttribute(account, m, pdId, qty,error);
//					return "AddToCartButton";
					//===============
				}
				else
				{	
					System.out.println("==============有Normal類訂單================");
					System.out.println("ordersListNormal.size() = ");
					System.out.println(ordersListNormal.size());
					System.out.println("ordersListNormal.get(0).getOrderId() = ");
					String x = ordersListNormal.get(0).getOrderId();
					System.out.println(x);
					orderId = x;
					System.out.println("==============有Normal類訂單================");
				}
			
			}
			else {
				if (ProductDataX.getValidDate() != null) {
					System.out.println("==============QR商品================");
					/*取得QR訂單*/
					System.out.printf("%d %d %d",companyId, 1, userId);
					List <Orders> ordersListQr = null;
					Integer  status = 1 ;
					Integer shipping = 3;
					ordersListQr = ordersDao.selectListUserCompanyStatusOrderQrTicket(companyId, status, userId, shipping);
					if(ordersListQr.isEmpty()) {
						System.out.println("==============沒QR類訂單，需要新增================");
						orderId = "1";
						Date date;
						date = new Date();
						orderId = userId +Long.toString(date.getTime());
						System.out.println("orderId = ");
						System.out.println(orderId);
						//===
						Users userX = userService.select(account);
						String recipient= userX.getUserName();
//						String recipient=null;
						java.sql.Date createTime;
						createTime  = new java.sql.Date(date.getTime());
						int amount = 0;
						String address1 = userX.getAddress();	
						String address2 = null; 
						String phone = userX.getPhone();	
						String shippingNumber = null;

						Orders orders = new Orders(
								orderId, 
								companyId, 
								userId, 
								recipient, 
								(int)status, 
								createTime,
								amount, 
								(int)shipping, 
								address1, address2, phone, shippingNumber);
						
						ordersDao.insert(orders);
						//===============
//						String error = "測試終止";
//						addAttribute(account, m, pdId, qty,error);
//						return "AddToCartButton";
						//===============
					}
					else
					{
						System.out.println("==============有QR類訂單================");
						System.out.println("ordersListQr.size() = ");
						System.out.println(ordersListQr.size());
						System.out.println("ordersListQr.get(0).getOrderId() = ");
						String x = ordersListQr.get(0).getOrderId();
						System.out.println(x);
						orderId = x;
						System.out.println("==============有QR類訂單================");					
					}
				}
			}			
			/*判斷訂單，結束*/
			System.out.println("判斷訂單，結束==============================");
			
			/*新增Cart-開始*/		/*移動20200201_1509*/
			if (cartDao.selectCart(orderId, pdId) == null)/* 這個廠商的購物車，是否有這個商品？【B】 */
			{ /* 如果沒有，建立一個新的Cart */
				CartService.Pf("【null】【該訂單無該pdId，進行新增】");
				String num = "0";
				int checkoutPrice = cartService.selectP(pdId).getPdPrice();
				int quantity = 0;/*這裡先不加數量，再別地方加*/
				Cart cart = new Cart(num, orderId, pdId, checkoutPrice, quantity); // 20200129-1300
				cartDao.insert(cart);// 20200129-1300
			} else
			{ /* 如果有，不動作。orderId */
				CartService.Pf("【NOT NULL】【該訂單有該pdId】");
			}
			/*新增Cart-結束*/		/*移動20200201_1509*/
			

			
				/* 不需要判斷【選取的數量+目前購物車內的數量>庫存 】*/
			
				CartService.Pf("庫存足夠");
				Orders orderX;
				orderX = ordersService.selectOrdersByOrderId(orderId);

//				String orderId2 = "1";	/*測試，更新數量，參數*/
				String orderId2 = orderId;
//				String pdId2 = "1";	/*測試，更新數量，參數*/
				String pdId2 = pdId;
				// ============================
				
//				qtyOfpdId += QtyOfAddToCart; /* 新的數量 */	//【C】+=【A】
				//int qtyOfpdId = returnQtyOfpdId(pdId, orderId);   //old
				
				/*因為是更新，不用加入訂單內的數量*/
				//qtyOfpdId += Integer.valueOf(qty);	//old
				
				int qtyOfpdId = Integer.valueOf(qty);
				cartDao.updateQuantity(orderId2, pdId2, qtyOfpdId); /* 更新數量 */
				
//				int checkoutPrice = cartService.selectProductDataByPdid(pdId).getPdPrice();/*取得現在單價*/


				
				String ok = "加入購物車成功";
				addAttribute(account, m, pdId, qty ,ok);
				System.out.println("加入購物車成功");
				CartService.Pf("AddProductToCartProcessAction，End2");

				Cart cartX = cartDao.selectCart(orderId2, pdId2);
				String msg = "修改成功";
				m.addAttribute("msg",msg);
				m.addAttribute("num",cartX.getNum());
				return "returnToChangeNumberOfProductInCart";
				
			
		}
	}
	private void addAttribute(String account, Model m, String pdId, String qty ,String errorMsgOfAddToCartButton) /*傳值給下一階段*/
	{
		ProductData pX = productDataService.selectProductVer2(pdId); /* 用service取 */
		Users uX;/* C */
		CartService.Pf2("account", account);
		uX = userService.select(account); /* C */
		m.addAttribute("account", account);/* D */
		m.addAttribute("UserName", uX.getUserName());/* D */
		m.addAttribute("ProductName", pX.getProductName());/* D */
		m.addAttribute("PdStock", pX.getPdStock());/* D */
		m.addAttribute("PdId", pX.getPdId());
		m.addAttribute("qty", qty); // added
		m.addAttribute("pdPrice", pX.getPdPrice()); // added
		m.addAttribute("errorMsgOfAddToCartButton",errorMsgOfAddToCartButton);
	}
	private boolean selectLessThanStock(String pdId, String qty)
	{
		int QtyOfAddToCart = Integer.valueOf(qty);// 【A】
		ProductData pX = productDataService.selectProductVer2(pdId); /* 用service取 */
		int nowStock = pX.getPdStock(); // 【B】
		CartService.Pf2("Integer.valueOf(qty", Integer.valueOf(qty));
		if (QtyOfAddToCart > nowStock) /* 選取的數量>庫存 */ // 【A】>【B】
		{
			System.out.println("庫存不足，請重新選擇！");
			return true;
		} else
		{
			return false;
		}
	}

	private int returnQtyOfpdId(String pdId, String orderId)
	{
		Cart cartX = cartDao.selectCart(orderId, pdId); /* 取物件 */
		int qtyOfpdId = cartX.getQuantity();/* 取數量 */ // 【C】
		return qtyOfpdId;
	}
	/*
	 * 存在此廠商的 訂單編號 且狀態為購物車狀態？
	 */
	
	private int getCompanyIdByPdId(String pdId) {	/*新增20200201_1509*/
		int companyId = 0;// 【A】
		ProductData productX;
		productX = productDataService.selectProductVer2(pdId);
		companyId = productX.getCompanyId();
		return companyId;
	}

	private int getUserIdByAccount(String account) { /* 新增20200201_1509 */
		int userId;// 【C】
		Users userX = userService.select(account);
		userId = userX.getId();
		CartService.Pf2("userId", userId);
		return userId;
	}
}
