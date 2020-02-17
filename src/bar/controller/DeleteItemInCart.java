/*豪*/
package bar.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Cart;
/*載入自訂Class，開始*/
import bar.model.CartService;
import bar.model.ProductData;
/*載入自訂Class，結束*/
@Controller
@SessionAttributes(names = "account")
@EnableTransactionManagement
public class DeleteItemInCart {
	private CartService cartService;
	
	DeleteItemInCart(CartService cartService){
		this.cartService = cartService;
	}
	
	@RequestMapping(path = "/DeleteItemInCart.controller")
	public String DeleteItemInCartProcessAction(
			@ModelAttribute(name = "account") String account,
			@RequestParam("num") String num, /*num:Cart資料表的Id*/
			@RequestParam("orderId")String orderId,
			Model m
			){
		
		CartService.Pf("DeleteItemInCartProcessAction開始");
		
		/* 印出輸入參數 */
		
		printInputParam(account , num ,m ,orderId);
		//cartService.deleteCartByNum0(num);  /*數量清成0*/
		cartService.deleteCartByNum(num);/*刪除*/

		List<Cart> oneOrderCartsList = cartService.select(orderId);/*List，找出單[購物車]的所有Cart*/
		
		
		
		
		
		List<Integer> listOfProductSubtotal = cartService.calculateListOfProductSubtotal(oneOrderCartsList);	/*List，計算並存單[購物車]各個產品的小計*/
		int totalPriceOfOneOrder = CartService.calculateTotalPriceOfOneOrder(listOfProductSubtotal);/*計算單[購物車]不含運費的金額*/
		
		System.out.println("IF判斷前");
		CartService.printValueTypeTime("totalPriceOfOneOrder", totalPriceOfOneOrder);
		if (totalPriceOfOneOrder == 0) {/*若購物車已經沒有項目*/
			CartService.Pf("totalPriceOfOneOrder = 0");
			/*如果是最後一個項目，把整個Order給刪掉*/ /*Order狀態改成5(已取消)*/		
			cartService.setOrderStatusByOrderId(orderId,5);/*Order狀態改成5(已取消)*/
			m.addAttribute("msg","刪除成功");
			/*回到[我的購物車]頁，而不是[修改數量]頁*/
			//transParam(m , orderId); /*傳送參數給下一頁*/
			//CartService.Pf("DeleteItemInCartProcessAction結束");
			//return "CartList";
			
		}
		else 
		{
			CartService.printValueTypeTime("totalPriceOfOneOrder", totalPriceOfOneOrder);
		}
		m.addAttribute("msg","刪除成功");
		transParam(m , orderId); /*傳送參數給下一頁([修改數量]頁用)*/
		CartService.Pf("DeleteItemInCartProcessAction結束");
		//return "DisplayProductInCart";/*回到[修改數量]頁*/
		return "ReturnToCartList";	/*回到我的購物車*/
	}
	
	
	
	
	

	
	
	
	/* 印出輸入參數 */
	public void printInputParam(String account ,String num , Model m ,String orderId) {
		CartService.printValueTypeTime("account", account);
		CartService.printValueTypeTime("num", num);
		CartService.printValueTypeTime("m", m);
		CartService.printValueTypeTime("orderId", orderId);
		
	}

	public void transParam(Model m , String orderId) {	/*傳送參數給下一頁*/
		m.addAttribute("orderId",orderId);
		m.addAttribute("listOfProduct", cartService.selectListOfProductByOrderId(orderId));
		m.addAttribute("oneOrderCarts",cartService.selectListOfCart(orderId));
	}
}
