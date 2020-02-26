package bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(path ="/OrderShippingDetail")
	public String OrderShippingDetail() {
		return "OrderShippingDetail";
	}
	
	@RequestMapping(path ="/OrderShippingDetailUser")
	public String OrderShippingDetailUser() {
		return "OrderShippingDetailUser";
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
	
	@RequestMapping(path = "/logistic/LogisticGate", method = RequestMethod.GET)
	public String LogisticGate() {
		return "logistic/LogisticGate";
	}
	
	@RequestMapping(path = "/logistic/QRCodeUpdatePage", method = RequestMethod.GET)
	public String QRCodeUpdatePage() {
		return "logistic/QRCodeUpdatePage";
	}

	@RequestMapping(path = "/ManageBar", method = RequestMethod.GET)
	public String LogisticOrder() {
		System.out.println("try to redir");
		return "logistic/ManageBar";
	}
	
	@RequestMapping(path = "/ManageActivity", method = RequestMethod.GET)
	public String ManageActivity() {
		System.out.println("redirect to ManageActivity");
		return "logistic/ManageActivity";
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
	
	@RequestMapping(value = "/Welcome.Company" , method = RequestMethod.GET )
	public String goWelcome(Model m) {
		return "WelcomeCompany";
	}
	
	@RequestMapping(value = "/Welcome.UserFirstPage" , method = RequestMethod.GET )
	public String goUserFirstPage(Model m) {
		return "UserFirstPage";
	}
}
