package bar.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Orders;
import bar.model.OrdersDAO;
import bar.model.OrdersService;
import net.sf.json.JSONObject;

@Controller
@SessionAttributes(names = {"reqConfirmUrl","orderId","xlID","xlSecret","amount"})
public class ControllLP{
	
	private OrdersService oService;
	private CompanyService cService;
	private Orders order;
	private String xlID;
	private String xlSecret;
	private int amount;
	
	@Autowired
	public ControllLP(OrdersService oService, CompanyService cService) {
		this.oService = oService;
		this.cService = cService;
	}

	@RequestMapping(path = "/doLPay", method = RequestMethod.GET)
	public void lPayProcess(@RequestParam(name="orderId") String orderId, HttpServletRequest hsRequest, HttpServletResponse hsResponse,Model m) throws ClientProtocolException, IOException, ServletException {
		String lPayResponse = doLPay(orderId);
		String[] findPayurl = lPayResponse.split("\"");
		String[] findTxId = lPayResponse.split(":|,");
		String reqConfirmUrl="https://sandbox-api-pay.line.me/v2/payments/"+findTxId[13]+"/confirm";
		m.addAttribute("reqConfirmUrl", reqConfirmUrl);
		m.addAttribute("orderId", orderId);
		m.addAttribute("xlID", xlID);
		m.addAttribute("xlSecret", xlSecret);
		m.addAttribute("amount", amount);
		hsResponse.sendRedirect(findPayurl[15]);
	}

	private String doLPay(String orderId) throws ClientProtocolException, IOException {
		CloseableHttpClient client = HttpClients.createDefault();
		String url = "https://sandbox-api-pay.line.me/v2/payments/request";
		HttpPost httpPost = new HttpPost(url);
		String encoding = null;
		
		System.out.println("orderId="+orderId);
		order = oService.selectOrder(orderId);
		System.out.println(order.getCompanyId());
		Company company = cService.selectCompany(order.getCompanyId());
		xlID=company.getX_LINE_ChannelId();
		xlSecret=company.getX_LINE_ChannelSecret();
		amount=order.getAmount();
		System.out.println(amount);
		System.out.println(xlID);
		System.out.println(xlSecret);
		httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");
		httpPost.setHeader("X-LINE-ChannelId", xlID);
		httpPost.setHeader("X-LINE-ChannelSecret", xlSecret);
//		"1653764156"
//		"a4e495c062ff3b7402b974c43399ce81"
		
		JSONObject jsonParam = new JSONObject();
		jsonParam.put("amount", amount); 
		//備用圖片url"http://placehold.it/84x84"); 
		//以orderId撈出BEAN
		jsonParam.put("productImageUrl", "https://i.imgur.com/ae3GSBi.png"); 
		jsonParam.put("confirmUrl", "http://localhost:8080/Bartenders/finishPayment.jsp"); 
		//以orderId撈出BEAN
		jsonParam.put("productName", "TestProduct"); 
		jsonParam.put("orderId", orderId); 
		jsonParam.put("currency", "TWD"); 
		
		StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");// 解決中文亂碼問題
		entity.setContentEncoding("UTF-8");
		entity.setContentType("application/json");
		httpPost.setEntity(entity);

		// 獲取結果實體
		CloseableHttpResponse response = client.execute(httpPost);		
		HttpEntity hpEntity = response.getEntity();
		String lPayResponse="";
		if (hpEntity != null) {
			lPayResponse = EntityUtils.toString(hpEntity, encoding);}
		EntityUtils.consume(hpEntity);
		response.close();
		System.out.println(lPayResponse);
		return lPayResponse;
	}
}
