package bar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes(names = { "userName", "CName" })
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

	@RequestMapping(path = "/MessageBoardListMode", method = RequestMethod.GET)
	public String showMessageBoardListMode() {

		return "MessageBoardListMode";
	}

	@RequestMapping(path = "/JavaMailPage", method = RequestMethod.GET)
	public String showJavaMailPage() {
		return "JavaMailPage";
	}

	@RequestMapping(path = "/VerifyMailPage", method = RequestMethod.GET)
	public String showVerifyMailPage() {
		return "VerifyMailPage";
	}

	@RequestMapping(path = "/FRegister", method = RequestMethod.GET)
	public String showFRegister() {
		return "FRegister";
	}
	
	@RequestMapping(path = "/FLogin", method = RequestMethod.GET)
	public String showFLogin() {
		return "FLogin";
	}

////////////////////////	

	@RequestMapping(path = "/productViewPage", method = RequestMethod.GET)
	public String showproductViewPage() {
		return "productViewPage";
	}

///////////////////////////
	@RequestMapping(path = "/UserOrder")
	public String showUserOrder() {
		return "UserOrder";
	}

	@RequestMapping(path = "/CompanyOrder")
	public String showCompanyOrder() {
		return "CompanyOrder";
	}

	@RequestMapping(path = "/ShowChangeOrder")
	public String showChangeOrder() {
		return "ShowChangeOrder";
	}

	@RequestMapping(path = "/ShowChangeOrderUser")
	public String showChangeOrderUser() {
		return "ShowChangeOrderUser";
	}

	@RequestMapping(path = "/OrderList")
	public String showOrderList() {
		return "OrderList";
	}

	@RequestMapping(path = "/OrderListUser")
	public String showOrderListUser() {
		return "OrderListUser";
	}

	@RequestMapping(path = "/CancelOrder")
	public String showCancelOrder() {
		return "CancelOrder";
	}

	@RequestMapping(path = "/CancelOrderUser")
	public String showCancelOrderUser() {
		return "CancelOrderUser";
	}

	@RequestMapping(path = "/SalesReport")
	public String showSalesReport() {
		return "SalesReport";
	}

	@RequestMapping(path = "/SalesReportByPie")
	public String showSalesReportByPie() {
		return "SalesReportByPie";
	}

	@RequestMapping(path = "/UserFirstPage")
	public String showUserFirstPage() {
		return "UserFirstPage";
	}

	@RequestMapping(path = "/SalesReportByExcel")
	public String showSalesReportByExcel() {
		return "SalesReportByExcel";
	}

	@RequestMapping(path = "/OrderShippingDetail")
	public String OrderShippingDetail() {
		return "OrderShippingDetail";
	}

	@RequestMapping(path = "/OrderShippingDetailUser")
	public String OrderShippingDetailUser() {
		return "OrderShippingDetailUser";
	}

////////////////////----以下是物流----/////////////////////////////
	@RequestMapping(path = "/logistic", method = RequestMethod.GET)
	public String logistic() {
		return "logistic/loginSystem";
	}

	@RequestMapping(path = "/logistic/WelcomeLogistic", method = RequestMethod.GET)
	public String WelcomeLogistic() {
		return "logistic/WelcomeLogistic";
	}

	@RequestMapping(path = "/logistic/LogisticGate", method = RequestMethod.GET)
	public String LogisticGate() {
		return "logistic/LogisticGate";
	}

	@RequestMapping(path = "/logistic/LogisticSearch", method = RequestMethod.GET)
	public String LogisticSearch() {
		return "logistic/LogisticSearch";
	}

	@RequestMapping(path = "/logistic/LogisticUpdate", method = RequestMethod.GET)
	public String LogisticUpdate() {
		return "logistic/LogisticUpdate";
	}

	@RequestMapping(path = "/logistic/QRCodeUpdatePage", method = RequestMethod.GET)
	public String QRCodeUpdatePage() {
		return "logistic/QRCodeUpdatePage";
	}

	@RequestMapping(path = "/LogisticArrive", method = RequestMethod.GET)
	public String LogisticArrive() {
		System.out.println("redirect to LogisticArrive");
		return "LogisticArrive";
	}

	@RequestMapping(path = "/LogisticInvalid", method = RequestMethod.GET)
	public String LogisticInvalid() {
		System.out.println("redirect to LogisticInvalid");
		return "LogisticInvalid";
	}

	/////////////////// 以下是地圖搜尋/////////////////
	@RequestMapping(path = "/ActivityHall", method = RequestMethod.GET)
	public String ActivityHall() {
		System.out.println("redirect to ActivityHall");
		return "logistic/ActivityHall";
	}

	@RequestMapping(path = "/ActivityCreate", method = RequestMethod.GET)
	public String ActivityCreate(Model m) {
		// for websocket
		WebSocketTest.setModel(m);

		return "logistic/ActivityCreate";
	}

	@RequestMapping(path = "/ActivityManage", method = RequestMethod.GET)
	public String ActivityManage(Model m) {
		// for websocket
		WebSocketTest.setModel(m);
		return "logistic/ActivityManage";
	}

	@RequestMapping(path = "/ActivityEdit", method = RequestMethod.GET)
	public String ActivityEdit(Model m) {
		// for websocket
		WebSocketTest.setModel(m);
		return "logistic/ActivityEdit";
	}

	@RequestMapping(path = "/BarCreate", method = RequestMethod.GET)
	public String BarCreate(Model m) {
		// for websocket
		WebSocketTest.setModel(m);
		return "logistic/BarCreate";
	}

	@RequestMapping(path = "/Example", method = RequestMethod.GET)
	public String Example(Model m) {

		// for websocket
		WebSocketTest.setModel(m);

		System.out.println("redirect to Example");
		return "logistic/Example";
	}

//////////

	@RequestMapping(value = "/Welcome.Company", method = RequestMethod.GET)
	public String goWelcome(Model m) {
		WebSocketTest.setModel(m);
		return "WelcomeCompany";
	}

	@RequestMapping(value = "/Welcome.UserFirstPage", method = RequestMethod.GET)
	public String goUserFirstPage(Model m) {
		WebSocketTest.setModel(m);
		return "UserFirstPage";
	}

}
