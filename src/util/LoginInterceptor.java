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

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter {

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
        	if(url.equals("/LogisticArrive")) {
        		String orderID = request.getParameter("orderID");
        		request.setAttribute("orderID",orderID);
        		System.out.println("orderID is:"+orderID);
        		RequestDispatcher rd = request.getRequestDispatcher("/login");
        		rd.forward(request, response);
                return false;
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