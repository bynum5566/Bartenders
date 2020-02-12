/*豪*/
package bar.controller;

//import java.util.Date;
import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.Cart;
import bar.model.CartService;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;
import bar.model.UsersService;

@Controller
@EnableTransactionManagement
public class OrderOneToTwo /* 使用者按下 */
{
	private ProductDataService pService;
	private UsersService uService;
	private OrdersService oService;
	private CompanyService cService;
	private CartService cartService;

	public OrderOneToTwo(ProductDataService pService, UsersService uService, OrdersService oService,
			CompanyService cService , CartService cartService) {
		this.pService = pService;
		this.uService = uService;
		this.oService = oService;
		this.cService = cService;
		this.cartService = cartService;
	}

	@RequestMapping(path = "/OrderOneToTwo.controller", method = RequestMethod.GET)
	public String OrderOneToTwoProcessAction(
			@RequestParam("orderId") String inputOrderId, /* orderId */ // 新增20200131_0934
			@RequestParam("select1") String select1, /* 配送方式 */
			@RequestParam("input1") String input1, /* 收件人 */
			@RequestParam("input2") String input2, /* 電話 */
			@RequestParam("address1") String inputAddress1, /* 宅配地址 */
			@RequestParam("address2") String inputAddress2, /* 超商門市 */

			@RequestParam("totalPrice") String totalPrice, /* 產品總價(不含運費) */
			@RequestParam("Freight") String Freight, /* 運費 */
			Model m) {
		/* 下一頁 */
		String msg = null;
		printInputData(inputOrderId, // 新增20200131_0934
				select1, input1, input2, inputAddress1, inputAddress2); /* 輸入參數列印 */

		try {
			/* Order自帶參數-開始 */
			String orderId = inputOrderId; // 新增20200131_0934
			java.util.Date createTime2 = new java.util.Date(); // for 【import java.util.Date;】

			CartService.Pf2("createTime2.getTime()", createTime2.getTime());
			CartService.Pf2("createTime2.toString()", createTime2.toString());
			Date createTime = new Date(createTime2.getTime());
			CartService.Pf2("createTime.getTime()", createTime.getTime());
			CartService.Pf2("createTime.toString()", createTime.toString());
			createTime.setTime(createTime2.getTime());
			CartService.Pf2("createTime.getTime()", createTime.getTime());
			CartService.Pf2("createTime.toString()", createTime.toString());
			CartService.Pf2("createTime.toGMTString()", createTime.toGMTString());

			String createTimeString = createTime.toString();
			int companyId;
			int userId;
			int amount;
			String recipient = input1; /* 收件人 */
			String shipping = select1; /* 配送方式 */
			String address1 = inputAddress1; /* 宅配地址 */
			String address2 = inputAddress2; /* 超商門市 */
			String phone = input2; /* 電話 */
			String status;
			String shippingNumber;
			/* Order自帶參數-結束 */
			/* 設定可由orderId載入的值，開始 */ // 新增20200131_0952
			/* ================================================= */
			Orders orderX = oService.selectOrder(orderId);
			companyId = orderX.getCompanyId();
			userId = orderX.getUserId();
			amount = Integer.valueOf(totalPrice) + Integer.valueOf(Freight);
			status = Integer.toString(orderX.getStatus());
			shippingNumber = orderX.getShippingNumber();
			printAllData(inputOrderId, createTimeString, select1, input1, input2, address1, address2, companyId, userId,
					amount, status, shippingNumber);
			/* ================================================= */
			/* 設定可由orderId載入的值，結束 */

			/* 寫入資料庫，狀態改變(status 1 > 2，開始) */
			/* ================================================= */ // 新增20200131_1228
			orderX = oService.selectOrder(orderId);
			orderX.setCreateTime(createTime);
			orderX.setShipping(Integer.valueOf(select1));
			orderX.setRecipient(input1);
			orderX.setPhone(input2);
			orderX.setAddress1(address1);
			orderX.setAddress2(address2);
//			orderX.setCompanyId(companyId); //FK
			orderX.setAmount(amount);
//			orderX.setStatus(2);
			orderX.setShippingNumber(shippingNumber);
			CartService.Pf("參數載入完成");
			/* ================================================= */ // 新增20200131_1228
			/* 寫入資料庫，狀態改變(status 1 > 2，結束) */

			/* 修改庫存，開始 */
			/* ================================================= */ // 新增20200131_1429
			// 改用下行pService.selectProductVer2(pdId)
			// pService.selectProductVer2(pdId)

			// cartList
			List <Cart> cartList;
			cartList = cartService.select(orderId);
			Boolean stock = true;/* 判斷是否全部產品的庫存足夠 */
			for (int n = 0; n <= cartList.size()-1; n++) {
				Cart cartX = cartList.get(n);
				String pdId = cartX.getPdId();
				ProductData ProductDataX = cartService.selectP(pdId);
				
				int a = cartX.getQuantity();
				int b = ProductDataX.getPdStock();
				if(a > b) {
					stock = false;
					System.out.println("庫存不足");
					
					break;
				}
			}
			if (stock == true) {
				System.out.println("庫存足夠");
				orderX.setStatus(2);
				//===
				for (int n = 0; n <= cartList.size()-1; n++) {
					Cart cartX = cartList.get(n);
					String pdId = cartX.getPdId();
					ProductData ProductDataX = cartService.selectP(pdId);
					
					int a = cartX.getQuantity();
					int b = ProductDataX.getPdStock();
					CartService.Pf2("a",a);
					CartService.Pf2("b",b);
					ProductDataX.setPdStock(b-a);
				}
				msg = "成立訂單成功";
				/*訂單狀態1>2*/
			} else {
				msg = "庫存不足，請重新選擇數量";
				System.out.println("庫存不足");
			}

			// ProductData productX = pService.selectProductVer2(pdId); /*選取*/

			/* ================================================= */ // 新增20200131_1429
			/* 修改庫存，結束 */

			// return null;
		} catch (Exception e) {
			System.out.println("【OrderOneToTwoProcessAction】【error】");
			System.out.println("【Exception = 】" + e);
			System.out.println("【e.printStackTrace = 】");
			e.printStackTrace();
		}
		// return "CartDetail";
		
		
		
		if (msg == "庫存不足，請重新選擇數量") {
			System.out.println("結束狀態A");
			m.addAttribute("msg",msg);
			return "resultOfCheckout";
		}
		if (msg == "成立訂單成功") {
			System.out.println("結束狀態B");
			m.addAttribute("msg",msg);
			return "resultOfCheckout";
		}
		msg="發生不明錯誤";
		m.addAttribute("msg",msg);
		System.out.println("結束狀態C");
		return "resultOfCheckout";
	}

	private void printInputData(String inputOrderId, // 新增20200131_0934
			String select1, String input1, String input2, String address1, String address2) {
		CartService.Pf0();
		CartService.Pf2("inputOrderId", inputOrderId); // 新增20200131_0934
		CartService.Pf2("select1", select1);
		CartService.Pf2("input1", input1);
		CartService.Pf2("input2", input2);
		CartService.Pf2("address1", address1);
		CartService.Pf2("address2", address2);
		CartService.Pf0();
	}

	private void printAllData( // 新增20200131_0952
			String inputOrderId, String createTimeString, String select1, String input1, String input2, String address1,
			String address2, int companyId, int userId, int amount, String status, String shippingNumber) {
		CartService.Pf0();
		CartService.Pf2("inputOrderId", inputOrderId);
		CartService.Pf2("createTimeString", createTimeString);
		CartService.Pf2("select1", select1);
		CartService.Pf2("input1", input1);
		CartService.Pf2("input2", input2);
		CartService.Pf2("address1", address1);
		CartService.Pf2("address2", address2);
		CartService.Pf0();
		CartService.Pf2("companyId", companyId);
		CartService.Pf2("userId", userId);
		CartService.Pf2("amount", amount);
		CartService.Pf2("status", status);
		CartService.Pf2("shippingNumber", shippingNumber);
		CartService.Pf0();
	}

}
