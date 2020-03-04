package bar.controller.logistic;



import java.io.IOException;
import java.util.List;

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
import bar.model.logistic.LogisticAccount;
import bar.model.logistic.LogisticAccountService;
import bar.model.logistic.LogisticService;
import bar.model.logistic.QRCodeDAO;

@Controller
@SessionAttributes(names= {"code"})
public class FunctionByQRCode {

	private QRCodeDAO qdao;
	private LogisticService lSer;
	private LogisticAccountService laSer;

	@Autowired
	public FunctionByQRCode(QRCodeDAO qdao,LogisticService lSer,LogisticAccountService laSer) {
		this.qdao = qdao;
		this.lSer = lSer;
		this.laSer = laSer;
	}
	
//	@RequestMapping(path="/CreateQRCode.do", method = RequestMethod.GET)
//	public String processAction(@RequestParam(name = "orderStatus")int status,
//			@RequestParam(name = "orderID")int ID) {
//		qdao.CreateQR(ID,status);
//		System.out.println("QRCode已建立");
//		return "LogisticGate";
//	}
	
	@RequestMapping(path="LogisticArrive.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String LogisticArrive(
			@RequestParam(name = "orderID")String oID,
			@RequestParam(name = "userId")Integer userId,Model m,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Logistic check = lSer.uniqueQuery("oID", "'"+oID+"'");
		if(userId.equals(check.getCharge())) {
			System.out.println("有找到訂單 進行貨物送達");
			Logistic update = qdao.QRCodeAction(oID,check.getsID());
			System.out.println("get retrun result:"+update);
			m.addAttribute("update",update);
			response.sendRedirect("LogisticArrive");
			return null;
//			return "LogisticArrive";
		}else {
			LogisticAccount realSender = laSer.querySender(check.getsID());
			System.out.println("訂單號碼or運送人不對");
			m.addAttribute("valid",check);
			m.addAttribute("realSender",realSender);
			return "logistic/QRCodeInvalid";
		}
	}
	
	@RequestMapping(path="logistic/QRCodeUpdate.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String processAction3(
			@RequestParam(name = "sID")Integer sID,
			@RequestParam(name = "orderID")String oID, Model m,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("sender's id: "+sID);
		Logistic check = lSer.uniqueQuery("oID", "'"+oID+"'");

		if(check.getsID().equals(sID)) {
			if(check.getoComplete()==0&&check.getoTimeB()!=null) {
				System.out.println("有找到訂單 但是狀態不對 可能是重複刷or忘了按出貨送達");
				m.addAttribute("update",check);
				m.addAttribute("repeatText","你重複刷訂單了喔；若確定已送達，請先按送達確認鈕");
				return "logistic/LogisticUpdate";
			}else {
				System.out.println("有找到訂單 進行物流收貨or貨物送達");
				Logistic update = qdao.QRCodeAction(oID,sID);
				System.out.println("get retrun result:"+update);
				m.addAttribute("update",update);

				return "logistic/LogisticUpdate";
			}
		}else {
			LogisticAccount realSender = laSer.querySender(check.getsID());
			System.out.println("訂單號碼or運送人不對");
			m.addAttribute("valid",check);
			m.addAttribute("realSender",realSender);
			return "logistic/QRCodeInvalid";
		}
	}
	//過濾頁
	@RequestMapping(path="/logistic/QRCodeAction.do", method = RequestMethod.GET)
	public String processAction4(@RequestParam(name = "orderID")String oID, Model m) {
//		Logistic order = qdao.QRCodeAction(orderID,orderStatus);
//		System.out.println("get retrun result:"+order);
//		if(order==null) {
//			System.out.println("result is null");
//			return "QRCodeInvalid";
//		}
//		m.addAttribute("update",order);
		m.addAttribute("orderID",oID);
//		m.addAttribute("orderStatus",orderStatus);
		System.out.println("return to page");
		return "logistic/LogisticUpdate";
	}

}







