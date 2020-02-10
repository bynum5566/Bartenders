package bar.controller.logistic;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;


@Controller
@EnableTransactionManagement
public class FunctionByType {

	private LogisticService tService;

	public FunctionByType(LogisticService tService) {
		this.tService=tService;
	}

	
	
//	@RequestMapping(path = {"/que.do"},method = {RequestMethod.GET})
//	public String processAction5(Model m) {
//
//		List<Logistic> orders = tService.queryAll();
//		m.addAttribute("type",orders);
//		if(orders.size()>0) {
//			return "LogisticGate";
//		}else {
//			m.addAttribute("null","no Order found");
//			return "LogisticGate";
//		}
//		
//	}
	
//	@RequestMapping(path = "/logistic/queryByType.do",method = RequestMethod.GET)
//	public String processAction6(@RequestParam(name = "orderType")String type,Model m) {
//		List<Logistic> orders;
//		if(type.equals("A")) {
//			orders = tService.queryAll();
//		}
//		else {
//			orders = tService.queryByType(type);
//		}
//		
//		m.addAttribute("type",orders);
//		if(orders.size()>0) {
//			return "LogisticGate";
//		}else {
//			m.addAttribute("null","no Order found");
//			return "LogisticGate";
//		}
//		
//	}
//	@RequestMapping(path = {"/myQueryH.do"},method = {RequestMethod.GET})
//	public String processAction7(@RequestParam(name = "TypeH")String type,Model m) {
//
//		List<Logistic> orders = tService.queryByType(type);
//		m.addAttribute("type",orders);
//		if(orders.size()>0) {
//			return "LogisticGate";
//		}else {
//			m.addAttribute("null","no Order found");
//			return "LogisticGate";
//		}
//		
//	}
	
//	@RequestMapping(path = {"/logistic/ChangeType.do"},method = {RequestMethod.GET})
//	public String processAction8(@RequestParam(name = "orderType")String type,
//			@RequestParam(name = "orderID")int ID,Model m) {
//
//		Logistic update = tService.ChangeType(type,ID);
//		List<Logistic> orders = tService.queryAll();
//		m.addAttribute("type",orders);
////		m.addAttribute("type",orders);
//		if(orders!=null) {
//			return "LogisticGate";
//		}else {
//			m.addAttribute("null","no Order found");
//			return "LogisticGate";
//		}
		
	}
	

//	@RequestMapping(path = {"/myOrderConfirm.do"},method = {RequestMethod.GET})
//	public String processAction4(@RequestParam(name = "orderID")int ID,Model m) {
//
//		Logistic update = tService.ChangeStatus(1,ID);
//		m.addAttribute("Status","Update Complete");
//		if(update!=null) {
//			return "LogisticGate";
//		}else {
//			m.addAttribute("null","no Order found");
//			return "LogisticGate";
//		}
//		
//	}
	
//}
