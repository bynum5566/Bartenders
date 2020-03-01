package bar.controller.logistic;



import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.logistic.LogisticAccount;
import bar.model.logistic.LogisticAccountDAO;
@Controller
@SessionAttributes(names= {"username","errors","logisticLogin","getSenderId"})
public class FunctionByLogin {

	private LogisticAccountDAO adao;
	
	@Autowired
	public FunctionByLogin(LogisticAccountDAO adao) {
		this.adao = adao;
	}

	
	@RequestMapping(path="logistic/LogisticLogin.do", method = RequestMethod.POST)
	public String processAction3(@RequestParam(name = "username")String username, 
			@RequestParam(name = "userpwd")String userpwd,
			@RequestParam(name = "orderID")String orderID,Model m,
			HttpServletRequest request, HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		System.out.println("orderID:"+orderID);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (username == null || username.length() == 0) {
			errors.put("account", "請輸入帳號");
		}

		if (userpwd == null || userpwd.length() == 0) {
			errors.put("password", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "logistic/loginSystem";
		}
		
		boolean status = adao.checkLogin(username,userpwd);
		LogisticAccount sender = adao.querySender(username,userpwd);
		if(status==true) {
//			m.addAttribute("logisticLogin","true");
			session.setAttribute("logisticLogin", status);
			System.out.println("create login session:"+status);
			m.addAttribute("getSenderId",sender.getSenderId());
			m.addAttribute("username",username);
			if(orderID!="") {
//				int myId= Integer.parseInt(orderID);
//				int myStatus= Integer.parseInt(orderStatus);
//				m.addAttribute("orderID",myId);
//				m.addAttribute("orderStatus",myStatus);
				response.sendRedirect("/Bartenders/logistic/QRCodeAction.do?orderID="+orderID+"&senderId="+sender.getSenderId());
//				return "QRCodeUpdate";
//				RequestDispatcher rd = request.getRequestDispatcher("/QRCodeUpdate.do");
//				rd.forward(request, response);
//				
        		return null;
			}
			response.sendRedirect("WelcomeLogistic");
			return null;
		}
		errors.put("msg", "帳號或密碼不正確");
		return "logistic/loginSystem";
	}
	
}







