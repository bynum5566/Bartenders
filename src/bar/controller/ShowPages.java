package bar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bar.model.logistic.Logistic;

@Controller
public class ShowPages {

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String showLogin() {
		return "index";
	}

	@RequestMapping(path = "/Register", method = RequestMethod.GET)
	public String showRegister() {
		return "Register";
	}

	@RequestMapping(path = "/CRegister", method = RequestMethod.GET)
	public String showCRegister() {
		return "CRegister";
	}

	@RequestMapping(path = "/CLogin", method = RequestMethod.GET)
	public String showCLogin() {
		return "CLoginPage";
	}
	
	@RequestMapping(path = "/WelcomeUser", method = RequestMethod.GET)
	public String showWelcomeUser() {
		return "WelcomeUser";
	}

	@RequestMapping(path = "/WelcomeCompany", method = RequestMethod.GET)
	public String showWelcomeCompany() {
		return "WelcomeCompany";
	}

///////////////(李昀陽)/////////////////

@RequestMapping(path = "/ResetPassword", method = RequestMethod.GET)
public String showResetPassword() {
return "ResetPassword";
}

@RequestMapping(path = "/ResetCompanyPassword", method = RequestMethod.GET)
public String showResetCompanyPassword() {
return "ResetCompanyPassword";
}

@RequestMapping(path = "/MessageBoard", method = RequestMethod.GET)
public String showMessageBoard() {
return "MessageBoard";
}

@RequestMapping(path = "/VerifyPage", method = RequestMethod.GET)
public String showVerifyPage() {
return "VerifyPage";
}

@RequestMapping(path = "/SubMessageBoard", method = RequestMethod.GET)
public String showSubMessageBoard() {
return "SubMessageBoard";
}

////////////////////////	
	
	@RequestMapping(path = "/productViewPage", method = RequestMethod.GET)
	public String showproductViewPage() {
		return "productViewPage";
	}
///////////////////////////
	@RequestMapping(path ="/UserOrder")
	public String showUserOrder() {
		return "UserOrder";
	}
	
	@RequestMapping(path ="/CompanyOrder")
	public String showCompanyOrder() {
		return "CompanyOrder";
	}
	
	@RequestMapping(path ="/ShowChangeOrder")
	public String showChangeOrder() {
		return "ShowChangeOrder";
	}
	
	@RequestMapping(path ="/ShowChangeOrderUser")
	public String showChangeOrderUser() {
		return "ShowChangeOrderUser";
	}
	
	@RequestMapping(path ="/OrderList")
	public String showOrderList() {
		return "OrderList";
	}
	
	@RequestMapping(path ="/OrderListUser")
	public String showOrderListUser() {
		return "OrderListUser";
	}
	
	@RequestMapping(path ="/CancelOrder")
	public String showCancelOrder() {
		return "CancelOrder";
	}
	
	@RequestMapping(path ="/CancelOrderUser")
	public String showCancelOrderUser() {
		return "CancelOrderUser";
	}
	
	@RequestMapping(path ="/SalesReport")
	public String showSalesReport() {
		return "SalesReport";
	}
	
	@RequestMapping(path ="/SalesReportByPie")
	public String showSalesReportByPie() {
		return "SalesReportByPie";
	}
	
	@RequestMapping(path ="/UserFirstPage")
	public String showUserFirstPage() {
		return "UserFirstPage";
	}
	
	@RequestMapping(path ="/SalesReportByExcel")
	public String showSalesReportByExcel() {
		return "SalesReportByExcel";
	}
	////////////////////----以下是物流----/////////////////////////////
	@RequestMapping(path = "/logistic", method = RequestMethod.GET)
	public String logistic() {
		return "logistic/loginSystem";
	}
	
	@RequestMapping(path = "/logistic/loginSuccess", method = RequestMethod.GET)
	public String loginSuccess() {

		return "logistic/loginSuccess";
	}
	
	@RequestMapping(path = "/logistic/WelcomeLogistic", method = RequestMethod.GET)
	public String WelcomeLogistic() {
		return "logistic/WelcomeLogistic";
	}
	
	@RequestMapping(path = "/logistic/LogisticGate", method = RequestMethod.GET)
	public String LogisticGate() {
		return "logistic/LogisticGate";
	}
	
	@RequestMapping(path = "/logistic/QRCodeUpdatePage", method = RequestMethod.GET)
	public String QRCodeUpdatePage() {
		return "logistic/QRCodeUpdatePage";
	}
	
	@RequestMapping(path = "/logistic/searchOrder", method = RequestMethod.GET)
	public String searchOrder() {
		return "logistic/searchOrder";
	}
	/////////////以下一般///////////////
	
	@RequestMapping(path = "/activityDisplay", method = RequestMethod.GET)
	public String activityDisplay() {
		return "logistic/activityDisplay";
	}
	
	//--------------------
	@RequestMapping(path = "/CheckLogistic", method = {RequestMethod.GET,RequestMethod.POST})
	public String QueryResult() {
		return "CheckLogistic";
	}

	@RequestMapping(path = "/ManageBar", method = RequestMethod.GET)
	public String LogisticOrder() {
		return "logistic/ManageBar";
	}
	
	@RequestMapping(path = "/ActivityHall", method = RequestMethod.GET)
	public String ActivityHall() {
		return "logistic/ActivityHall";
	}
	
	@RequestMapping(path = "/ActivityManage", method = RequestMethod.GET)
	public String ActivityManage() {
		return "logistic/ActivityManage";
	}
	
	@RequestMapping(path = "/ActivitySingle", method = RequestMethod.GET)
	public String ActivitySingle() {
		return "logistic/ActivitySingle";
	}
	
	@RequestMapping(path = "/createMarker", method = RequestMethod.GET)
	public String createMarkerPage() {
		return "logistic/createMarker";
	}
	
	@RequestMapping(path = "/createActivity", method = RequestMethod.GET)
	public String createActivityPage() {
		return "logistic/createActivity";
	}
	
	@RequestMapping(path = "/createShow", method = RequestMethod.GET)
	public String createShow() {
		return "logistic/createShow";
	}
	
	@RequestMapping(path = "/editActivity", method = RequestMethod.GET)
	public String editActivity() {
		return "logistic/editActivity";
	}
	
	@RequestMapping(path = "/searchMarker", method = RequestMethod.GET)
	public String searchMarker() {
		return "logistic/searchMarker";
	}
	

	
	//////////
//	@RequestMapping(path = "/room.chat", method = RequestMethod.GET)
//	public String ChatRoom() {
//		return "ChatRoom";
//	}
	
	@RequestMapping(value = "/Welcome.Company" , method = RequestMethod.GET )
	public String goWelcome() {
	return "WelcomeCompany";
	}
}
