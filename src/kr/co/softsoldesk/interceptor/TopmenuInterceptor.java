package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.CustomerBean;

public class TopmenuInterceptor implements HandlerInterceptor{
	
	private CustomerBean loginCustBean;
	
	public TopmenuInterceptor (CustomerBean loginUserBean){
		this.loginCustBean = loginUserBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setAttribute("loginUserBean", loginCustBean);
		
		
		return true;
	}
}
