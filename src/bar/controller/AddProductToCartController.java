/*豪*/
package bar.controller;
import java.text.SimpleDateFormat;
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
import bar.model.ProductDataDAO;
import bar.model.ProductDataService;
import bar.model.UsersService;
import bar.model.Users;
@Controller
@SessionAttributes(names = "account")
@EnableTransactionManagement
public class AddProductToCartController
{
	private ProductDataService productDataService;
	private ProductDataDAO productDataDAO;
	private UsersService userService;
	private OrdersService ordersService;
	private CompanyService companyService;
	private CartDAO cartDao;
	private CartService cartService;	/*新增20200201_1509*/
	private OrdersDAO ordersDao;

	public AddProductToCartController(
			ProductDataService pService, 
			ProductDataDAO productDataDAO,
			UsersService uService, 
			OrdersService oService,
			CartDAO cDao, 
			CompanyService cService 
			,CartService cartService	/*新增20200201_1509*/
			,OrdersDAO ordersDao
			)
	{
		this.productDataService = pService;
		this.productDataDAO  = productDataDAO;
		this.userService = uService;
		this.ordersService = oService;
		this.cartDao = cDao;
		this.companyService = cService;
		this.cartService = cartService;	/*新增20200201_1509*/
		this.ordersDao = ordersDao;
	}
	@RequestMapping(path = "/AddProductToCart.controller", method = RequestMethod.GET)
	public String AddProductToCartProcessAction(
			@RequestParam("PdId") String pdId, 
			@RequestParam("qty") String qty,
			@RequestParam("PdStock") String PdStock, 
			@RequestParam("ProductName") String ProductName,
			@RequestParam("barAccount") String barAccount,
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
		//===============
		
		System.out.println("2020 1341");
		CartService.printValueTypeTime("pdId",pdId    );
		CartService.printValueTypeTime("qty",qty    );
		CartService.printValueTypeTime("PdStock",PdStock    );
		CartService.printValueTypeTime("ProductName",ProductName    );
		CartService.printValueTypeTime("account",account    );
		
		//===============
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
			addAttribute(account, m, pdId, qty ,error,barAccount);
			//return "AddToCartButton";		//Wu
			//return "redirect:/Product.show";//Wu
			return "ResultOfAddToCart";
		} else	/*庫存足夠*/
		{
			System.out.println("判斷訂單，開始==============================");
			/*判斷訂單，開始*/
			/* 存在此廠商的 訂單編號 且狀態為購物車狀態？ */
			int companyId = getCompanyIdByPdId(pdId);
			int userId  = getUserIdByAccount(account);
			/*找productData*/
			
			CartService.Pf("標記A，20200206_1226");
			CartService.printValueTypeTime("companyId",companyId    );
			CartService.printValueTypeTime("userId",userId    );
			CartService.printValueTypeTime("pdId",pdId    );

			ProductData ProductDataX =  cartService.selectProductDataByPdid(pdId);
			//ProductData ProductDataX =  productDataDAO.selectP(pdId);
			//ProductData ProductDataX =  cartService.selectP(pdId);
			CartService.Pf("標記B，20200206_1226");
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
					shipping = 1;	/*預設使用1:宅配*/
					Date date;
					date = new Date();
					
					/*String版本時間，開始*/	/*【】標記ＱＲ也要改*/
					SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					Date dateSource = new Date();
					String StringDate = sdFormat.format(dateSource);
					CartService.printValueTypeTime("date.getTime()", date.getTime());
					CartService.printValueTypeTime("StringDate", StringDate);
					/*String版本時間，開始結束*/
					
					orderId = userId +Long.toString(date.getTime());
					System.out.println("orderId = ");
					System.out.println(orderId);
					//===
					String recipient= userService.select(account).getUserName();
//					String recipient=null;
					java.sql.Date createTime;
					createTime  = new java.sql.Date(date.getTime());
					int amount = 0;
					Users userX = userService.select(account);
					String address1 = userX.getAddress();	//可null
					String address2 = ""; //可null
					String phone = userX.getPhone();	//可null
					String shippingNumber = ""; //可null

					
					String tempString ="2020-02-27 11:11:11.777";
					
					
					Orders orders = new Orders(
							orderId, 
							companyId, 
							userId, 
							recipient, 
							(int)status, 
							StringDate,				/*--createTime*/
							amount, 
							(int)shipping, 
							address1, address2, phone, shippingNumber);
					
					ordersDao.insert(orders);
					CartService.printValueTypeTime("orders.getCreateTime()", orders.getCreateTime());
					Orders ordersInDB = ordersService.selectOrder(orderId);
					CartService.printValueTypeTime("ordersInDB.getCreateTime()", ordersInDB.getCreateTime());
					
					//===============
//					String error = "測試終止";
//					addAttribute(account, m, pdId, qty,error);
//					return "ResultOfAddToCart";
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
						
						/*String版本時間，開始*/	/*【】標記一般也要改*/
						SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
						Date dateSource = new Date();
						String StringDate = sdFormat.format(dateSource);
						CartService.printValueTypeTime("date.getTime()", date.getTime());
						CartService.printValueTypeTime("StringDate", StringDate);
						/*String版本時間，開始結束*/
						
						
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
						String address2 = ""; //可null
						String phone = userX.getPhone();	
						String shippingNumber = ""; //可null

						String tempString ="2020-02-27 11:11:11.777";
						Orders orders = new Orders(
								orderId, 
								companyId, 
								userId, 
								recipient, 
								(int)status, 
								StringDate,
								amount, 
								(int)shipping, 
								address1, address2, phone, shippingNumber);
						
						ordersDao.insert(orders);
						//===============
//						String error = "測試終止";
//						addAttribute(account, m, pdId, qty,error);
//						return "ResultOfAddToCart";
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
						
						/*==================================================*/
						/*如果是QR類型，只要購物車中已有項目，就不允許再加入購物車，開始*/
						
						System.out.println("QR商品，只允許購買一個");/* 選取的數量+目前購物車內的數量>庫存 */
						String error = "QR商品，只允許購買一個";
						addAttribute(account, m, pdId, qty,error,barAccount);
						CartService.Pf("AddProductToCartProcessAction，End2");
						//return "AddToCartButton";		//Wu
						//return "redirect:/Product.show";//Wu
						return "ResultOfAddToCart";
						
						/*如果是QR類型，只要購物車中已有項目，就不允許再加入購物車，結束*/
						/*==================================================*/
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
			
			
			/*新增/使用現有訂單-開始*/
			
			/*新增/使用現有訂單-結束*/

			
			if (selectLessThanStock2(pdId, qty, orderId))/*判斷庫存*/
			{
				System.out.println("庫存不足，請重新選擇。");/* 選取的數量+目前購物車內的數量>庫存 */
				String error = "庫存不足，請重新選擇!";
				addAttribute(account, m, pdId, qty,error,barAccount);
				CartService.Pf("AddProductToCartProcessAction，End2");
				//return "AddToCartButton";		//Wu				
				//return "redirect:/Product.show";//Wu
				return "ResultOfAddToCart";
			} else /* 庫存足夠 */
			{
				CartService.Pf("庫存足夠");

				Orders orderX;
				orderX = ordersService.selectOrdersByOrderId(orderId);
				/* ============ */
				/* 判斷該產品是否有訂單，有則讀出，沒則新增 */
				/**/
				/* 判斷該產品是否有訂單 */
				/* 使用者id + pdId */
				// ============================
				// String orderId2 = orderId;
				// ============================
				/* 對每個使用者，每個廠商的商品會有一個購物車 */
				/* 這個使用者的這個廠商是否有購物車？【A】 */
				/* 這個廠商的購物車，是否有這個商品？【B】 */
				/* ========== */
				/*
				 * 新增，寫到訂單裡 userId 使用者id orderId 使用者的 訂單號碼
				 */
				// ============================
//				String orderId2 = "1";	/*測試，更新數量，參數*/
				String orderId2 = orderId;
//				String pdId2 = "1";	/*測試，更新數量，參數*/
				String pdId2 = pdId;
				// ============================
//				qtyOfpdId += QtyOfAddToCart; /* 新的數量 */	//【C】+=【A】
				int qtyOfpdId = returnQtyOfpdId(pdId, orderId);
				qtyOfpdId += Integer.valueOf(qty);
				cartDao.updateQuantity(orderId2, pdId2, qtyOfpdId); /* 更新數量 */
//				int checkoutPrice = cartService.selectProductDataByPdid(pdId).getPdPrice();/*取得現在單價*/



				
				String ok = "加入購物車成功";
				addAttribute(account, m, pdId, qty ,ok,barAccount);
				System.out.println("加入購物車成功");
				CartService.Pf("AddProductToCartProcessAction，End2");

				//return "AddToCartButton";		//Wu
				//return "redirect:/Product.show";//Wu
				//"redirect:/Product.show"	//商品詳情
				return "ResultOfAddToCart";
				
			}
		}
	}
	private void addAttribute(String account, Model m, String pdId, String qty ,String errorMsgOfAddToCartButton,String barAccount) /*傳值給下一階段*/
	{
		ProductData pX = productDataService.select(pdId);
		//ProductData pX = productDataService.selectProductVer2(pdId); /* 用service取 */
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
		m.addAttribute("msg",errorMsgOfAddToCartButton);
		m.addAttribute("validDate",pX.getValidDate());
		m.addAttribute("barAccount",barAccount);
	}
	private boolean selectLessThanStock(String pdId, String qty)
	{
		int QtyOfAddToCart = Integer.valueOf(qty);// 【A】
		ProductData pX = productDataService.select(pdId);
		//ProductData pX = productDataService.selectProductVer2(pdId); /* 用service取 */
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
	private boolean selectLessThanStock2(String pdId, String qty, String orderId)
	{
		int QtyOfAddToCart = Integer.valueOf(qty);// 【A】
		ProductData pX = productDataService.select(pdId);
		//ProductData pX = productDataService.selectProductVer2(pdId); /* 用service取 */
		int nowStock = pX.getPdStock(); // 【B】
		CartService.Pf2("Integer.valueOf(qty", Integer.valueOf(qty));
//		Cart cartX = cDao.selectCart(orderId, pdId); /* 取物件 */
//		int qtyOfpdId = cartX.getQuantity();/* 取數量 */	//【C】
		if (QtyOfAddToCart + returnQtyOfpdId(pdId, orderId) > nowStock) /* 選取+現有>庫存 */ // 【A】+【C】>【B】
		{
			System.out.println("庫存不足，請重新選擇。");
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
		productX = productDataService.select(pdId);
		//productX = productDataService.selectProductVer2(pdId);
		companyId = productX.getCompanyId();
		return companyId;
	}

	private int getUserIdByAccount(String account) { /* 新增20200201_1509 */
		int userId;// 【C】
		Users userX = userService.select(account);
		userId = userX.getUserId();
		CartService.Pf2("userId", userId);
		return userId;
	}
	private Orders selectUserCompanyStatusOrder(String account, String pdId, int status)
	{
//		oService.
		Orders orderA = null;
		try
		{
			/* 執行前列印 */
			CartService.Pf2("account", account);
			CartService.Pf2("status", status);
			CartService.Pf2("pdId", pdId);
			/* 執行後列印 */
			// ======================================
			// 由pdId查到 companyId
			int companyId = 0;// 【A】
			ProductData productX;
			productX = productDataService.select(pdId);
			//productX = productDataService.selectProductVer2(pdId);
			companyId = productX.getCompanyId();
			CartService.Pf2("companyId", companyId);
			// ======================================
			// 由參數輸入
			// status【B】
			CartService.Pf2("status", status);
			// ======================================
			// 由account查到userId
			int userId;// 【C】
			Users userX = userService.select(account);
			userId = userX.getUserId();
			CartService.Pf2("userId", userId);
			// ======================================
			/* 測試輸出開始 */
			CartService.Pf("測試輸出開始");
			CartService.Pf2("companyId", companyId);
			CartService.Pf2("status", status);
			CartService.Pf2("userId", userId);
			CartService.Pf("測試輸出結束");
			/* 測試輸出結束 */
			// "From Orders where companyId=:companyId and status=:status and
			// userId=:userId";
			// 【A】【B】【C】
			orderA = ordersService.selectUserCompanyStatusOrder(
					(Integer) companyId, 
					Integer.valueOf(status),
					(Integer) userId);
			if (orderA == null)
				CartService.Pf("a是null");
			else
			{
				CartService.Pf("orderA不是null");
				CartService.Pf2("orderA.getOrderId()", orderA.getOrderId());
			}
		} catch (Exception e)
		{
			System.out.println("【AddProductToCartController.selectUserCompanyStatusOrder】【error】");
			System.out.println("【Exception = 】" + e);
			System.out.println("【e.printStackTrace = 】" + e);
			e.printStackTrace();
		}
		return orderA;
	}
}
