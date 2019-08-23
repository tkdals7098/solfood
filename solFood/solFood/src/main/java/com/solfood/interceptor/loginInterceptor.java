/*
 *  mypage, board 등 가기 전, 로그인 여부 확인하는 인터셉터
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
 
public class loginInterceptor extends HandlerInterceptorAdapter{
	private static final Logger logger = LoggerFactory.getLogger(loginInterceptor.class);
 
	//---------------------------------------------------
	// preHandle--> interceptor 시작될 때 실행되는 메소드
	//---------------------------------------------------	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	logger.info("====================== preHandle call====================");
    	
        HttpSession session = request.getSession();							// session 객체를 가져옴
        Object obj = session.getAttribute("login");							// login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
          
        if (obj == null){
        	if(isAjaxRequest(request)) {
        		System.out.println("============== ajax 요청임222");
        		
        		response.sendRedirect("${path}/member/login.do");				// 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
                return false; 													// 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        	} else {
        		response.sendRedirect("/member/login.do");						
                return false; 											
        	}
        }
        return true;		
    }
	
	
	// 요청이 ajax로 들어오는지 확인
	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
	    if ("true".equals(header)){
	    	return true;
	    } else{
	       	return false;
	    }
	}
	
	//---------------------------------------------------
	// postHandle--> interceptor 끝날 때 실행되는 메소드
	//---------------------------------------------------
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		logger.info("================= postHandle call===================");
			
	}
}








