package bar.controller.logistic;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FunctionByLogout {
	
	@Autowired
	public FunctionByLogout() {
	}

	@RequestMapping(path="logistic/LogisticLogout.do", method = RequestMethod.POST)
	public String processAction4(HttpSession session,Model m) {
		session.invalidate();
		m.addAttribute("msg", "已登出，請重新登入");
		return "logistic/loginSystem";
	}
	

}







