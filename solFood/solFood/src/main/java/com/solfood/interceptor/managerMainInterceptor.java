/*
 *  managerMain 가기전, account_grade가 0(관리자)인지 확인하는 인터셉터
 */

package com.solfood.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
public class managerMainInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(managerMainInterceptor.class);
 
	//---------------------------------------------------
	// preHandle
	//---------------------------------------------------	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	logger.info("====================== preHandle call- managerMainInterceptor====================");
    	
        HttpSession session = request.getSession();							
        Object account_grade= session.getAttribute("account_grade");
        
        // login.account_grade== 1이면 다시 메인으로 가게 하기/ 0이면 return true;
        if(account_grade== null) {
       		response.sendRedirect("/manager/managerMainFailPage.do");						
            return false; 
        } else if (account_grade.equals(Integer.valueOf(1))){
       		response.sendRedirect("/manager/managerMainFailPage.do");						
            return false; 											
        } else if(account_grade.equals(Integer.valueOf(0))) {
            return true;		
        } else {
        	response.sendRedirect("/manager/managerMainFailPage.do");						
            return false; 
        }
    }
	
	//---------------------------------------------------
	// postHandle
	//---------------------------------------------------
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("================= postHandle call - managerMainInterceptor===================");
			
	}
}








