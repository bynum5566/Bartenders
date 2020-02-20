package bar.controller.logistic;



import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.logistic.Logistic;
import bar.model.logistic.QRCodeDAO;

@Controller
@SessionAttributes(names= {"code","update"})
public class FunctionByQRCode {

	private QRCodeDAO qdao;
	
	@Autowired
	public FunctionByQRCode(QRCodeDAO qdao) {
		this.qdao = qdao;
	}
	
//	@RequestMapping(path="/CreateQRCode.do", method = RequestMethod.GET)
//	public String processAction(@RequestParam(name = "orderStatus")int status,
//			@RequestParam(name = "orderID")int ID) {
//		qdao.CreateQR(ID,status);
//		System.out.println("QRCode已建立");
//		return "LogisticGate";
//	}
	
	
	@RequestMapping(path="/ReadQRCode.do", method = RequestMethod.GET)
	public String processAction2(Model m) {
		
		String code = qdao.readQR();
		m.addAttribute("code",code);
		System.out.println("QRCode已建立");
		return "LogisticGate";
	}
	
	@RequestMapping(path="logistic/QRCodeUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String processAction3(@RequestParam(name = "orderID")String orderID, 
			@RequestParam(name = "orderStatus")Integer orderStatus,Model m,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Logistic order = qdao.QRCodeAction(orderID,orderStatus);
		System.out.println("get retrun result:"+order);
		if(order==null) {
			System.out.println("result is null");
			return "logistic/QRCodeInvalid";
		}else {
			System.out.println("order is created");
		}
		m.addAttribute("update",order);
		m.addAttribute("test","this is result: "+order);
//		m.addAttribute("orderID",orderID);
//		m.addAttribute("orderStatus",orderStatus);
//		RequestDispatcher rd = request.getRequestDispatcher("/QRCodeUpdate");
//		rd.forward(request, response);
		response.sendRedirect("/Bartenders/logistic/QRCodeUpdatePage");

//		return "QRCodeUpdate";
		return null;
	}
	
	@RequestMapping(path="/logistic/QRCodeAction.do", method = RequestMethod.GET)
	public String processAction4(@RequestParam(name = "orderID")Integer orderID, 
			@RequestParam(name = "orderStatus")Integer orderStatus,Model m) {
//		Logistic order = qdao.QRCodeAction(orderID,orderStatus);
//		System.out.println("get retrun result:"+order);
//		if(order==null) {
//			System.out.println("result is null");
//			return "QRCodeInvalid";
//		}
//		m.addAttribute("update",order);
		m.addAttribute("orderID",orderID);
		m.addAttribute("orderStatus",orderStatus);
		System.out.println("return to page");
		return "logistic/QRCodeUpdate";
	}

}







