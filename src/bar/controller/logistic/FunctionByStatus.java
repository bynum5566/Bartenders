package bar.controller.logistic;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;
import bar.model.logistic.QRCodeDAO;
import bar.model.Orders;
import bar.model.OrdersService;

@Controller
@SessionAttributes(names="logistic")
@EnableTransactionManagement
public class FunctionByStatus {

	private LogisticService lService;
	private OrdersService oService;
	
	
	public FunctionByStatus(LogisticService lService, OrdersService oService) {
		this.lService=lService;
		this.oService=oService;
		
	}
	
	@RequestMapping(path = "/logistic/searchPersonalOrder.do",method = RequestMethod.GET)
	public String searchPersonalOrder(@RequestParam(name = "sID")String sID,Model m) throws IOException {
		List<Logistic> rs = lService.queryBysID(sID);
			m.addAttribute("logistic",rs);
		return "logistic/searchOrder";
	}
	
	@RequestMapping(path = "/logistic/createLogistic.do",method = RequestMethod.POST)
	public String createLogistic(@RequestParam(name = "orderId")String orderId) throws IOException {
		Orders rs = oService.selectOrder(orderId);
		System.out.println(rs);
		if(rs.getStatus()==3) {
			String oID = rs.getOrderId();
			Integer cID = rs.getCompanyId();
			int type = rs.getShipping();
			String phone = rs.getPhone();
			String name = rs.getRecipient();
			int amount = rs.getAmount();
			String address = null;
			if(type==1) {
				address = rs.getAddress1();
			}else if(type==2) {
				address = rs.getAddress2();
			}
			lService.createLogistic(oID, cID.toString(), type, phone, name, amount, address);
			System.out.println("test Logistic order created");
		}
		
		return "logistic/LogisticGate";
	}
	
	@RequestMapping(path = "/logistic/queryByStatus.do",method = RequestMethod.GET)
	public String processAction1(@RequestParam(name = "orderStatus")int status,Model m,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Logistic> statusList;
		if(status==0) {
			System.out.println("query all logistic");
			statusList = lService.queryAll();
		}else {
			System.out.println("query logistic status="+status);
			statusList = lService.queryByStatus(status);
		}

		m.addAttribute("logistic",statusList);
		response.sendRedirect("LogisticGate");
		if(statusList!=null) {
			return "logistic/LogisticGate";
		}else {
			m.addAttribute("null","no Order found");
			return "logistic/LogisticGate";
		}
		
	}
	
	@RequestMapping(path = "/logistic/ChangeStatus.do",method = RequestMethod.GET)
	public String processAction2(@RequestParam(name = "orderStatus")int status,
			@RequestParam(name = "orderID")String ID,Model m) {
//		Logistic statusList = lService.ChangeStatus(status,ID);
		
		List<Logistic> orders = lService.queryAll();
		m.addAttribute("logistic",orders);
//		m.addAttribute("type",orders);
		if(orders!=null) {
			return "logistic/LogisticGate";
		}else {
			m.addAttribute("null","no Order found");
			return "logistic/LogisticGate";
		}
		
	}
	
	@RequestMapping(path = "/logistic/DeliverReady.do",method = RequestMethod.GET)
	public String DeliverReady(@RequestParam(name = "orderStatus")int status,
			@RequestParam(name = "orderID")String ID,Model m) {
//		Logistic statusList = lService.ChangeStatus(status,ID);
		lService.deliverReady(ID);
		List<Logistic> orders = lService.queryAll();
		m.addAttribute("logistic",orders);
//		m.addAttribute("type",orders);
		if(orders!=null) {
			
			return "logistic/LogisticGate";
		}else {
			m.addAttribute("null","no Order found");
			return "logistic/LogisticGate";
		}
		
	}
	
}
