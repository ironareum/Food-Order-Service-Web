package kr.co.softsoldesk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.StoreBean;

//프로젝트 작업시 사용할 bean을 정의하는 클래스
@Configuration
public class RootAppContext {
	@Bean("loginCustBean")
	@SessionScope
	public CustomerBean loginUserBean() {
		
		return new CustomerBean();
	}
	
	@Bean
	   public MenuBean tempMenuBean() {
	      
	      return new MenuBean();
	   }
	
	@Bean("currentStore")
	@SessionScope
	public StoreBean currentStore() {
		
		return new StoreBean();
	}
}
