package bar.model;

import java.sql.Date;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "orders")
@Component
public class Orders {

	private String orderId; /* PK */
	private String createTime;		/*Date*/
	private int companyId; /* FK */
	private int userId;/* FK */
	private int amount;
	private String recipient;/* 收件人 */
	private int shipping;/* (1:代表宅配 2:代表超商 3:電子票券產品(QRcode產品)) */
	private String address1;/* (配合宅配地址) */
	private String address2;/* (配合超商) */
	private String phone;
	private int status; /* (只有1~6, 1:只先暫存購物車 2:未付款 3:已付款未配送 4:配送中 5.已取消 6.已到貨) */
	private String qrUrl; // QRcode網址
	private String shippingNumber;

	public Orders() {
	}

	public Orders(String orderId, int companyId, int userId, String recipient, int status) {
		this.orderId = orderId;
		this.companyId = companyId;
		this.userId = userId;
		this.recipient = recipient;
		this.status = status;
	}

	public Orders(String orderId, int companyId, int userId, String recipient, int status,
			/* not null = F */
			String createTime, int amount, int shipping, /* (1:代表宅配 2:代表超商) */
			String address1, /* (配合宅配地址) */
			String address2, /* (配合超商) */
			String phone, String shippingNumber 
	) { /* 建構子not null 也加上 */
		/* not null = T */
		this.orderId = orderId;
		this.companyId = companyId;
		this.userId = userId;
		this.recipient = recipient; /* 可能變動 */
		this.status = status; /* 可能變動 */
		/* not null = F */
		this.createTime = createTime; /* 變動一次 */
		this.amount = amount;
		this.shipping = shipping;/* (1:代表宅配 2:代表超商) */
		this.address1 = address1;/* (配合宅配地址) */
		this.address2 = address2;/* (配合超商) */
		this.phone = phone;
		this.shippingNumber = shippingNumber;
	}

	@Id
	@Column(name = "ORDERID")
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	@Column(name = "CREATETIME")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	@Column(name = "COMPANYID")
	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	@Column(name = "USERID")
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "AMOUNT")
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Column(name = "RECIPIENT")
	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	@Column(name = "SHIPPING")
	public int getShipping() {
		return shipping;
	}

	public void setShipping(int shipping) {
		this.shipping = shipping;
	}

	@Column(name = "ADDRESS1")
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	@Column(name = "ADDRESS2")
	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	@Column(name = "PHONE")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "STATUS")
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Column(name = "SHIPPINGNUMBER")
	public String getShippingNumber() {
		return shippingNumber;
	}

	public void setShippingNumber(String shippingNumber) {
		this.shippingNumber = shippingNumber;
	}

	@Column(name = "QRURL")
	public String getQrUrl() {
		return qrUrl;
	}

	public void setQrUrl(String qrUrl) {
		this.qrUrl = qrUrl;
	}

}
