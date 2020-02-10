package bar.controller.logistic;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CheckLoginSystem {

	@RequestMapping(path="/", method = RequestMethod.GET)
	public String processAction1() {
		System.out.println("redirect to Homepage");
		return "LogisticGate";
	}
	
	@RequestMapping(path="/LogisticGate", method = RequestMethod.GET)
	public String processAction2() {
		System.out.println("Action complete and redirect to Homepage");
		return "LogisticGate";
	}
	
	@RequestMapping(path="/loginSystem", method = RequestMethod.GET)
	public String processAction3(HttpServletRequest request) {
//		@RequestAttribute(name = "orderID")String orderID
//		@RequestAttribute(name = "orderStatus")String orderStatus
		System.out.println("Action complete and redirect to LoginPage");
		Object orderID = request.getSession().getAttribute("orderID");
		System.out.println("orderID:"+orderID);
//		System.out.println("orderStatus:"+orderStatus);
		return "loginSystem";
	}
	
	@RequestMapping(path="/loginSuccess", method = RequestMethod.GET)
	public String processAction4() {
		System.out.println("Action complete and redirect to LoginSuccessPage");
		return "loginSuccess";
	}
	
	@RequestMapping(path="/QRCodeUpdate", method = RequestMethod.GET)
	public String processAction5() {
		System.out.println("Action complete and redirect to QRCodeUpdate");
		return "QRCodeUpdate";
	}
	


}







