package bar.controller.logistic;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bar.model.logistic.Activity;
import bar.model.logistic.ActivityService;
import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;
import bar.model.logistic.QRCodeDAO;
import bar.model.Orders;
import bar.model.OrdersService;

@Controller
@SessionAttributes(names="logistic")
@EnableTransactionManagement
public class FunctionByStatus {

	private LogisticService lSer;
	private OrdersService oSer;
	private ActivityService aSer;
	
	
	public FunctionByStatus(LogisticService lSer, OrdersService oSer,ActivityService aSer) {
		this.lSer=lSer;
		this.oSer=oSer;
		this.aSer=aSer;
		
	}
	
	@RequestMapping(path = "/logistic/searchPersonalOrder.do",method = RequestMethod.GET)
	public String searchPersonalOrder(@RequestParam(name = "sID")String sID,Model m) throws IOException {
		List<Logistic> rs = lSer.queryBysID(sID);
			m.addAttribute("logistic",rs);
		return "logistic/searchOrder";
	}
	
	@RequestMapping(path = "/searchTargetOrder.do",method = RequestMethod.POST)
	public String searchTargetOrder(@RequestParam(name = "oID")String oID,Model m,
			HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttrs) throws IOException {
//		List<Logistic> rs = lSer.queryJoker("oID", "'"+oID+"'");
		
		Logistic rs = lSer.uniqueQuery("oID", "'"+oID+"'");
		//只保留到下一頁
		System.out.println("step1");
		if(rs!=null) {
			System.out.println("result is: "+rs);
			RedirectAttributes x = redirectAttrs.addFlashAttribute("result",rs);
		}else {
			RedirectAttributes x = redirectAttrs.addFlashAttribute("noData","no");
		}
		System.out.println("step3");
		return "redirect:/CheckLogistic";
//		m.addAttribute("logistic",rs);
//		return "CheckLogistic";
	}
	
	@RequestMapping(path = "/logistic/createLogistic.do",method = RequestMethod.POST)
	public String createLogistic(@RequestParam(name = "orderId")String orderId) throws IOException {
		Orders rs = oSer.selectOrder(orderId);
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
			lSer.createLogistic(oID, cID, type, phone, name, amount, address);
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
			statusList = lSer.queryAll();
		}else {
			System.out.println("query logistic status="+status);
			statusList = lSer.queryByStatus(status);
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
//		Logistic statusList = lSer.ChangeStatus(status,ID);
		
		List<Logistic> orders = lSer.queryAll();
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
//		Logistic statusList = lSer.ChangeStatus(status,ID);
		lSer.deliverReady(ID);
		List<Logistic> orders = lSer.queryAll();
		m.addAttribute("logistic",orders);
//		m.addAttribute("type",orders);
		if(orders!=null) {
			
			return "logistic/LogisticGate";
		}else {
			m.addAttribute("null","no Order found");
			return "logistic/LogisticGate";
		}
		
	}
	
	@RequestMapping(path = "logistic/OrderSearch.do/{status}",method = RequestMethod.GET)
	public String searchOrder(@PathVariable Integer status,HttpServletRequest request, HttpServletResponse response, Model m
			) throws IOException, ParseException {
		List<Logistic> newOrder = lSer.queryByStatus(status);
		System.out.println("order numbers: "+newOrder.size());
		HashMap<Integer,Integer> hashMap = new HashMap<>();
		List<Activity> activity = new ArrayList<Activity>();
		List<Activity> temp;
		for(Logistic a:newOrder) {
			Integer cID = a.getcID();
			hashMap.putIfAbsent(cID,0);
			hashMap.put(cID,hashMap.get(cID)+1);
			
		}
		System.out.println("hashMap is: "+hashMap);
		Iterator<Map.Entry<Integer, Integer>> iterator = hashMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<Integer, Integer> entry = iterator.next();
			Integer barId = entry.getKey();
			Integer orderNum = entry.getValue();
			System.out.println("start query with userId=: "+barId+" &set num=:"+orderNum);
			temp = aSer.queryJoker("userId", barId, "type","'bar'");
			for(Activity bar:temp) {
				bar.setOrderNum(orderNum);
			}
			
			activity.addAll(temp);
		}

		m.addAttribute("logistic",newOrder);
		return "logistic/searchOrder";
	}
	
}
