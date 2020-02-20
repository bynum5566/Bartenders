/*豪*/
package bar.controller;
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
/*執行這個Controller的時間點：我的購物車按下[修改]按鈕時*/
@Controller
@SessionAttributes({"account","num"})
@EnableTransactionManagement
public class UpdateQtyInCartController
{
	private ProductDataService productDataService;
	private UsersService userService;
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

		this.cartDao = cDao;
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
				//取得Normal訂單
				System.out.printf("%d %d %d",companyId, 1, userId);
				List <Orders> ordersListNormal;

				Integer  status = 1 ;
				Integer shipping = 3;
				ordersListNormal = ordersDao.selectListUserCompanyStatusOrderNormal(companyId, status, userId, shipping);
				if(ordersListNormal.isEmpty()) {
					System.out.println("==============沒 Normal類訂單，================");
					String error = "錯誤";
					addAttribute(account, m, pdId, qty,error);
					return "AddToCartButton";
					//===============
				}	//標記
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

						System.out.println("==============沒QR類訂單，================");
						//===============
						String error = "錯誤";
						addAttribute(account, m, pdId, qty,error);
						return "AddToCartButton";
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
			
			
				CartService.Pf("庫存足夠");



				String orderId2 = orderId;

				String pdId2 = pdId;
				// ============================
			
				
				int qtyOfpdId = Integer.valueOf(qty);
				cartDao.updateQuantity(orderId2, pdId2, qtyOfpdId); /* 更新數量 */
				
				
				String ok = "成功";
				addAttribute(account, m, pdId, qty ,ok);
				System.out.println("成功");
				CartService.Pf("AddProductToCartProcessAction，End2");

				Cart cartX = cartDao.selectCart(orderId2, pdId2);
				String msg = "修改成功";
				m.addAttribute("msg",msg);
				m.addAttribute("num",cartX.getNum());
				return "ReturnToChangeNumberOfProductInCart";
				
			
		}
	}
	private void addAttribute(String account, Model m, String pdId, String qty ,String errorMsgOfAddToCartButton) /*傳值給下一階段*/
	{
		ProductData pX = productDataService.select(pdId);

		Users uX;/* C */
		CartService.Pf2("account", account);
		uX = userService.select(account); 
		m.addAttribute("account", account);
		m.addAttribute("UserName", uX.getUserName());
		m.addAttribute("ProductName", pX.getProductName());
		m.addAttribute("PdStock", pX.getPdStock());
		m.addAttribute("PdId", pX.getPdId());
		m.addAttribute("qty", qty); // added
		m.addAttribute("pdPrice", pX.getPdPrice()); // added
		m.addAttribute("errorMsgOfAddToCartButton",errorMsgOfAddToCartButton);
	}
	private boolean selectLessThanStock(String pdId, String qty)
	{
		int QtyOfAddToCart = Integer.valueOf(qty);// 【A】
		ProductData pX = productDataService.select(pdId);

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

	/*
	 * 存在此廠商的 訂單編號 且狀態為購物車狀態？
	 */
	
	private int getCompanyIdByPdId(String pdId) {	
		int companyId = 0;// 【A】
		ProductData productX;
		productX = productDataService.select(pdId);
		companyId = productX.getCompanyId();
		return companyId;
	}

	private int getUserIdByAccount(String account) {
		int userId;
		Users userX = userService.select(account);
		userId = userX.getUserId();
		CartService.Pf2("userId", userId);
		return userId;
	}
}
