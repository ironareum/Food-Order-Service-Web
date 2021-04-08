package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.StoreBean;

public class StoreInterceptor implements HandlerInterceptor{
	
	private StoreBean currentStore;
	
	public StoreInterceptor (StoreBean currentStore){
		this.currentStore = currentStore;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		request.setAttribute("currentStore", currentStore);
		
		
		return true;
	}
}
