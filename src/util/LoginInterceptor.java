package util;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bar.model.CompanyService;
import bar.model.OrdersService;
import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

	private LogisticService lSer;

	public LoginInterceptor(LogisticService lSer){
		this.lSer=lSer;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getServletPath();
		request.setAttribute("preUrl",url);
        System.out.println("post URL："+url);
        if(url.contains("/logistic")) {
        	System.out.println("start");
        	Object logisticLogin = request.getSession().getAttribute("logisticLogin");
        	System.out.println("loginStatus:"+logisticLogin);
        	if(url.contains("/QRCodeAction.do")) {
            	String orderID = request.getParameter("orderID");
            	System.out.println("step1:check loginstatus: "+logisticLogin);
            	Logistic logis = lSer.uniqueQuery("oID","'"+orderID+"'");
            	System.out.println("logistic result: "+logis);
            	if(logis.getoComplete()==1) {
            		System.out.println("商品送達，轉至使用者頁面");
            		if(orderID!=null) {
            			request.setAttribute("orderID",orderID);
             			System.out.println("orderID:"+orderID);
            		}
//            		RequestDispatcher rd = request.getRequestDispatcher("/MerchandiseArrive.do");
//            		rd.forward(request, response);
            		response.sendRedirect("/Bartenders/MerchandiseFilter.do?orderID="+orderID);
                    return false;
            	}
            	if(logisticLogin==null) {
            		if(orderID!=null) {
            			
            			request.setAttribute("orderID",orderID);
             			System.out.println("orderID:"+orderID);
            		}
            		System.out.println("user not login, return to loginSystem");
//            		response.sendRedirect("/LogisticSystem/loginSystem");
            		RequestDispatcher rd = request.getRequestDispatcher("/logistic");
            		rd.forward(request, response);
                    return false;
            	}else  {
            		System.out.println("user login status:"+logisticLogin);
            		System.out.println("start update database");
//            		response.sendRedirect("/LogisticSystem/loginSuccess");
            		RequestDispatcher rd = request.getRequestDispatcher("/logistic/LogisticUpdate");
            		rd.forward(request, response);
                    return false;
            	}
            }
        	if(logisticLogin==null) {
        		System.out.println("user not login, return to loginSystem");
        		response.sendRedirect("/Bartenders/logistic");
                return false;
        	}else {
        		System.out.println("user login status:"+logisticLogin+", start re-direct");
//        		response.sendRedirect("/LogisticSystem/loginSuccess");
                return true;
        	}
        }else if(!url.equals("")){
        	String loginStatus = (String) request.getSession().getAttribute("LoginStatus");
        	String orderID = request.getParameter("orderID");
        	if(url.equals("/MerchandiseFilter.do")) {
        		
        		if(loginStatus == null){
        			if(orderID!=null) {
	        			request.setAttribute("orderID",orderID);
	            		System.out.println("orderID is:"+orderID);
        			}
        			System.out.println("收到訂單:"+orderID+"，但使用者尚未登入，導回首頁");
	        		RequestDispatcher rd = request.getRequestDispatcher("/login");
	        		rd.forward(request, response);
	                return false;
        		}else {
        			System.out.println("收到訂單:"+orderID+"，且使用者已登入，導回收件頁面");
        			RequestDispatcher rd = request.getRequestDispatcher("/LogisticArrive");
            		rd.forward(request, response);
            		return false;
        		}
        	}
            if(loginStatus == null){
            	System.out.println(">>>未登入者<<<");
                response.sendRedirect("/Bartenders/login");
                return false;
            }
            return true;
        }
        return true;
		//return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

}