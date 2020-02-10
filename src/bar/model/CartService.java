package bar.model;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	private CartDAO cartDAO;
	private ProductDataDAO productDataDAO;
	static Date date;
	
	@Autowired
	public CartService(CartDAO cartDAO,ProductDataDAO productDataDAO) {
		this.cartDAO=cartDAO;
		this.productDataDAO=productDataDAO;
	}
	
	public List<Cart> select(String orderId) {
		return cartDAO.select(orderId);
	}

	public Cart selectCartByOid(String orderId) {
		return cartDAO.selectCartByOid(orderId);
	}
	
	public ProductData selectP(String pdId) {
		return productDataDAO.selectP(pdId);
	}
	public static void Pf(String msg) {
		date = new Date();
		System.out.println("【" + msg + "】");
	}

	public static void Pf2(String s, Object o) {
		date = new Date();
		System.out.println("【" + s + "】" + "=" + "【" + o + "】");
	}

	public static void Pf0() {
		System.out.println("=======================");
	}

	public static void PrintTimeFunction_t(String msg) {
		date = new Date();
		System.out.println("【" + msg + "】" + "date = " + date.toString() + "   " + "getTime()=" + date.getTime());
	}

	public static void PrintTimeFunctionVer2_t(String s, Object o) {
		date = new Date();
		System.out.println("【" + s + "】" + "=" + "【" + o + "】" + "date = " + date.toString() + "   " + "getTime()="
				+ date.getTime());
	}
	


	public static String[] getShippingNumToStr() {
		  String returnShipping[] = {
		    "未選擇",
		          "宅配",
		          "超商",
		          "QR票券"};
		  return returnShipping;
		 }
	
	 public static void printValueTypeTime(String string, Object object) {
		  System.out.println("【" + string + "】" + "=" + "【" + object + "】" +"Type = 【" + object.getClass() + "】 Time = " + date.toString());
		  // TODO Auto-generated method stub
		 }
	
}
