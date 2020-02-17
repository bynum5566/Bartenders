package bar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import bar.model.Cart;
import bar.model.CartService;
import bar.model.Orders;
import bar.model.OrdersService;
import bar.model.ProductData;
import bar.model.ProductDataService;
import bar.model.logistic.LogisticService;
import net.sf.json.JSONObject;

@Controller
@SessionAttributes(names = {"validDate","expireDate"})
public class finishPay {
	
	private ProductDataService pdService;
	private CartService carService;
	private OrdersService oService;
	private String validDate;
	private String expiryDate;
	private String orderId;
	private LogisticService lService;
	
	@Autowired
	public finishPay(ProductDataService pdService, CartService carService, OrdersService oService,LogisticService lService) {
		this.pdService = pdService;
		this.carService = carService;
		this.oService = oService;
		this.lService = lService;
	}
	
	@SuppressWarnings({ "finally" })
	@RequestMapping(path = "/finishPay", method = RequestMethod.POST)
	public ModelAndView toFinishPay(HttpServletRequest hsRequest, HttpServletResponse hsResponse, Model m) throws ServletException, IOException {
		try {
			String confirmUrl=(String) hsRequest.getSession().getAttribute("reqConfirmUrl");
			int amount=(int) hsRequest.getSession().getAttribute("amount");
			orderId=(String) hsRequest.getSession().getAttribute("orderId");
			String xlID=(String) hsRequest.getSession().getAttribute("xlID");
			String xlSecret=(String) hsRequest.getSession().getAttribute("xlSecret");
			Cart car = carService.selectCartByOid(orderId);
			String pdId = car.getPdId();
			ProductData pd = pdService.select(pdId);
			expiryDate = pd.getExpiryDate();
			validDate = pd.getValidDate();
			
		    HttpPost httpPost = new HttpPost(confirmUrl);
			httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");
			httpPost.setHeader("X-LINE-ChannelId", xlID);
			httpPost.setHeader("X-LINE-ChannelSecret", xlSecret);
			
			JSONObject jsonParam = new JSONObject();
			jsonParam.put("amount", amount); 
			jsonParam.put("currency", "TWD"); 
			
			StringEntity entity = new StringEntity(jsonParam.toString(), "utf-8");// 解決中文亂碼問題
			entity.setContentEncoding("UTF-8");
			entity.setContentType("application/json");
			httpPost.setEntity(entity);
			
			String encoding = null;
			CloseableHttpClient client = HttpClients.createDefault();
			CloseableHttpResponse response = client.execute(httpPost);		
			String body = "";
			HttpEntity hpEntity = response.getEntity();
			if (hpEntity != null) {
				body = EntityUtils.toString(hpEntity, encoding);	}
			EntityUtils.consume(hpEntity);
			response.close();
			System.out.println(body);
		}catch (Exception ex) {
		} finally {
			if(validDate !=null && expiryDate !=null) {
				m.addAttribute("validDate", validDate);
				m.addAttribute("expireDate", expiryDate);
				m.addAttribute("orderId", orderId);
				ModelAndView mav = new ModelAndView();
				mav.setViewName("qrDelever");
				return mav;
			}
			int status = 3;
			oService.updateToCancel(orderId, status);
			Orders order = oService.selectOrder(orderId);
			String lAddress = null;
			if(order.getShipping()==1) {
				lAddress = order.getAddress1();
			}else if(order.getShipping()==2) {
				lAddress = order.getAddress2();
			}
			lService.createLogistic(orderId,order.getShipping(),order.getPhone(),order.getRecipient(),order.getAmount(),lAddress);
			
			return new ModelAndView("redirect:/userOrder.controller");
			}
		}
	}