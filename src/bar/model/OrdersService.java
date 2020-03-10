package bar.model;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersService {

	private OrdersDAO ordersDAO;
	private CompanyDAO companyDAO;
	private UsersDAO userDAO;
	private ProductDataDAO productDataDAO;
	private CartDAO cartDAO;

	@Autowired
	public OrdersService(OrdersDAO ordersDAO,CompanyDAO companyDAO,UsersDAO userDAO,ProductDataDAO productDataDAO,CartDAO cartDAO) {
		this.ordersDAO = ordersDAO;
		this.companyDAO=companyDAO;
		this.userDAO=userDAO;
		this.productDataDAO=productDataDAO;
		this.cartDAO=cartDAO;
	}

	public boolean updateStatusAndQR(String orderId, Integer status, String qrUrl) {
		return ordersDAO.updateStatusAndQR(orderId, status, qrUrl);
	}
	
	public boolean update(String orderId,Integer amount,String recipient,Integer shipping,String address1,String address2,String phone) {
		return ordersDAO.update(orderId, amount, recipient, shipping, address1, address2, phone);
	}
	
	public boolean updateToCancel(String orderId,Integer status) {
		return ordersDAO.updateToCancel(orderId, status);
	}
	
	public List<Orders> selectLoginUser(Integer userId) {
		return ordersDAO.selectLoginUser(userId);
	}

	public List<Orders> selectUser(Integer userId, Integer status) {
		return ordersDAO.selectUser(userId, status);
	}

	public List<Orders> selectCompany(Integer companyId, Integer status) {
		return ordersDAO.selectCompany(companyId, status);
	}
	
	public Orders selectOrder(String orderId) {
		return ordersDAO.selectOrder(orderId);
	}
	
	public Users selectUser(Integer id) {
		return userDAO.selectUser(id);
	}
	
	public Company selectCompany(Integer id) {
		return companyDAO.selectCompany(id);
	}
	
//	public Company select(String account) {
//		return companyDAO.select(account);
//	}
	
	public List<Cart> select(String orderId) {
		return cartDAO.select(orderId);
	}
	
	public ProductData selectP(String pdId) {
		return productDataDAO.selectP(pdId);
	}

	public List<Orders> selectOrdersByTime(Integer companyId,Integer status,String startTime,String endTime) {
		return ordersDAO.selectOrdersByTime(companyId, status, startTime, endTime);
	}
	//-----------------------------------------------------------------------
	public boolean updateBeforeShipping(String orderId,String recipient,String address1,String address2,String phone) {
		return ordersDAO.updateBeforeShipping(orderId, recipient, address1, address2, phone);
	}
	
		
	public List<ProductData> selectProductof(Integer companyId) {
		return productDataDAO.selectProductof(companyId);
	}
	
//////////////(選豪)//////////////	
	 public Orders selectOrdersByOrderId(String orderId) {
		  // Orders orders = ordersDAO.selectOrdersByOrderId(orderId);
		  Orders orders = ordersDAO.selectOrder(orderId);
		  return orders;
		 }
	 
	 public Orders selectUserCompanyStatusOrder(Integer companyId, Integer status, Integer userId) {
		  Orders orders = ordersDAO.selectUserCompanyStatusOrder(companyId, status, userId);
		  return orders;
		 }
}