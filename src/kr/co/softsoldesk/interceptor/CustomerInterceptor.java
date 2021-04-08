package kr.co.softsoldesk.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.CustomerBean;

public class CustomerInterceptor implements HandlerInterceptor {

	
	// 로그인 여부를 판단해야 하므로 loginUserBean객체 주입
	private CustomerBean loginCustBean;
	
	//AutoWire가 안되므로 생성자를 활용한다 .. 인터셉터는 오토와이어가 안됨
	public CustomerInterceptor(CustomerBean loginUserBean) {
		this.loginCustBean = loginUserBean;
	}

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		// 로그인이 되어 있지 않으면
		if(loginCustBean.isCust_login() == false) {
			// 로그인이 되어 있지 않은 상태이므로 로그인 전 경로를 받음
			String contextPath = request.getContextPath();
			
			// 로그인처리가 안되어 있으므로 not_login으로 페이지 전환
			response.sendRedirect(contextPath + "/Customer/not_login"); // 로그인 안되면 일로 가
			
			// 다음단계로 이동하지 않음
			return false; // 로그인 전
			
		}
		
		return true; // 로그인 후
	}
}
