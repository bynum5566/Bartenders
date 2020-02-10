/*最後編輯時間：2020119-19:08 */
package bar.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "cart") //@Table(name = "Orders")
@Component
public class Cart {
	//private int num; /* PRIMARY KEY IDENTITY(1,1) NOT NULL */
	private String num; /* PRIMARY KEY IDENTITY(1,1) NOT NULL */
	//====
	private String orderId; /* nvarchar(50) FOREIGN KEY NOT NULL */
	//private Orders orders;
	//====
	private String pdId; /* FOREIGN KEY */
	//private ProductData productData;
	//====
	private int checkoutPrice; /* 結帳時單價 */
	private int quantity;/* 產品數量 */

	public Cart() {
		
	}
	
	public Cart(String num, String orderId, String pdId, int checkoutPrice, int quantity) {
		this.num = num;
		this.orderId = orderId;
		this.pdId = pdId;
		this.checkoutPrice = checkoutPrice;
		this.quantity = quantity;
	}
	


	@Id
	@Column(name = "NUM") 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
//===
	@Column(name = "orderId")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "pdId")
	public String getPdId() {
		return pdId;
	}

	public void setPdId(String pdId) {
		this.pdId = pdId;
	}
	//===

	@Column(name = "checkoutPrice")
	public int getCheckoutPrice() {
		return checkoutPrice;
	}

	public void setCheckoutPrice(int checkoutPrice) {
		this.checkoutPrice = checkoutPrice;
	}

	@Column(name = "quantity")
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "orderId")
//	public Orders getOrders()
//	{
//		return orders;
//	}
//	public void setOrders(Orders orders)
//	{
//		this.orders = orders;
//	}
//	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "pdId")
//	public ProductData getProductData()
//	{
//		return productData;
//	}
//	public void setProductData(ProductData productData)
//	{
//		this.productData = productData;
//	}
	
}
