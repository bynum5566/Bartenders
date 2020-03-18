/*豪*/
package bar.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {

	private CartDAO cartDAO;
	private CompanyDAO companyDAO;
	private OrdersDAO ordersDAO;
	private ProductDataDAO productDataDAO;
	private MyBarDAO  myBarDAO;
	static Date date;
	
@Autowired
public CartService(
		CartDAO cartDAO ,
		CompanyDAO companyDAO,
		OrdersDAO ordersDAO, 
		ProductDataDAO productDataDAO,
		MyBarDAO myBarDAO) {
		this.cartDAO = cartDAO;
		this.companyDAO = companyDAO;
		this.ordersDAO = ordersDAO;
		this.productDataDAO = productDataDAO;
		this.myBarDAO = myBarDAO;
}
	public MyBar selectMyBarByCompanyId(int companyId) {
//		Pf("selectMyBarByCompanyId，開始");

		MyBar myBarX = myBarDAO.selectBar(companyId);
		printValueTypeTime("myBarX", myBarX);
//		Pf("selectMyBarByCompanyId，結束");
		return myBarX;
	}
	
	public List<Cart> select(String orderId) {
		return cartDAO.select(orderId);
	}
	
    public Company selectCompanyByCompanyId(int CompanyId) {	
        return companyDAO.selectCompany(CompanyId);
    }
	
    public Cart selectCartByOid(String orderId) {	/*useBy finishPay*/
        return cartDAO.selectCartByOid(orderId);
    }

	
	public ProductData selectP(String pdId) { /*更名不可*/
//		CartService.Pf("cartService.selectP，開始");
		CartService.printValueTypeTime("pdId",pdId    );
		
		return productDataDAO.selectP(pdId);
	}
	
	public ProductData selectProductDataByPdid(String pdId) {
//		CartService.Pf("selectProductDataByPdid，開始");
//		System.out.println("productDataDAO = "+ productDataDAO);
		//CartService.printValueTypeTime("productDataDAO",productDataDAO    );
		
		ProductData productX;
		productX = productDataDAO.selectP(pdId);
		return productX;
	}
	
	public List<ProductData> selectListOfProductByOrderId(String orderId){
		List<Cart> oneOrderCartsList = select(orderId);
		List<ProductData> listOfProduct = new ArrayList<ProductData>();
		for (Cart oneOrderCart : oneOrderCartsList) {
			ProductData products = productDataDAO.selectP(oneOrderCart.getPdId());
			listOfProduct.add(products);
		}
		return listOfProduct;
	}
	public List<Cart> selectListOfCart(String orderId){
		List<Cart> oneOrderCartsList = select(orderId);
		return oneOrderCartsList;
	}
	
	public int selectFreightByOrderId(String orderId) { /* 運費 */
		int shippingPrice = 0;
		Orders order = ordersDAO.selectOrder(orderId);
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
	
	
	public void deleteCartByNum0(String num) {
		Integer iNum = Integer.valueOf(num);
		Cart cartX = cartDAO.selectCartByNum(iNum);
		cartX.setQuantity(0);
	}
	
	public void deleteCartByNum(String num) {
		Integer iNum = Integer.valueOf(num);
		cartDAO.deleteCartByNum(iNum); 
		/*未完成*/
	}
	
	
	public void setOrderStatusByOrderId(String orderId , int status) {
		Orders orderX = ordersDAO.selectOrder(orderId);
		if (orderX != null) {
			orderX.setStatus(status);
		}
		else {
			Pf("Error in [setOrderStatusByOrderId]");
			Pf("Error，orderX is null");
		}
	}
	
	/*List，計算並存單[購物車]各個產品的小計*/
	public static List <Integer> calculateListOfProductSubtotal(List <Cart> oneOrderCartsList) {
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
	
	/* 計算單[購物車]不含運費的金額 */
	public static int calculateTotalPriceOfOneOrder(List<Integer> listOfProductSubtotal) {
		int totalPriceOfOneOrder = 0;
		for (Integer oneProductSubtotal : listOfProductSubtotal) { 
			totalPriceOfOneOrder += oneProductSubtotal;
		}
		return totalPriceOfOneOrder;
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
				  "未選擇",	/*0*/
		          "宅配",		/*1*/
		          "超商",		/*2*/
		          "QR票券"};	/*3*/
		  return returnShipping;
		 }
	
	 public static void printValueTypeTime(String string, Object object) {

		 if(object != null)
			 System.out.println("【" + string + "】" + "=" + "【" + object + "】" +"Type = 【" + object.getClass() + "】 Time = " + date.toString());
		 if(object == null)
			 System.out.println("【" + string + "】" + "=" + "【" + object + "】" +"Type = 【  NULL 】 Time = " + date.toString());
		
	 }

	//public Collection<? extends ProductData> selectAllBar() {
	 public List<Company> selectAllBar() {	/*回傳資料庫中所有的Bar*/
//		 CartService.Pf("selectAllBar開始");
		 List <Company>	listOfBar = new ArrayList<>();
		 listOfBar = companyDAO.selectAll();
		return listOfBar;		
	}
}
