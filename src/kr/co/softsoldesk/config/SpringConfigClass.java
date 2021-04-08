package kr.co.softsoldesk.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



//public class SpringConfigClass implements WebApplicationInitializer{
//
//	@Override
//	public void onStartup(ServletContext servletContext) throws ServletException {
//
//		AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
//		servletAppContext.register(ServletAppContext.class);
//		
//		// 요청 발생 시 요청을 처리하는 서블릿을 DispatcherServlet으로 설정해준다.
//		DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
//		
//		//매개변수로 선언된 servletContext객체를 이용하여 servlet 추가 load-on
//		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
//		
//		// 부가 설정
//		servlet.setLoadOnStartup(1);//가장먼저 받아들이겠다는 뜻
//		servlet.addMapping("/");
//		
//		//==================================================================
//	    //(web.xml에서  <context-param>구현부와 같음)
//		// Bean을 정의하는 클래스를 지정한다
//		AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
//		rootAppContext.register(RootAppContext.class);
//		 //(web.xml에서  <listener>구현부와 같음)
//		ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
//		servletContext.addListener(listener);
//	    //(web.xml에서  <filter>구현부와 같음)
//	    // 파라미터 인코딩 설정
//		FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//		filter.setInitParameter("encoding", "UTF-8");
//	    //dispatcher에 의해서 추가된 Servlet에 UTF-8로 encoding하겠다는 구현부
//		filter.addMappingForServletNames(null, false, "dispatcher");
//	       
//	}
//
//}

//==========

public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {
	// DispatcherServlet에 매핑할 요청 주소를 셋팅한다.
	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	// Spring MVC 프로젝트 설정을 위한 클래스를 지정한다.
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { ServletAppContext.class };
	}

	// 프로젝트에서 사용할 Bean들을 정의기 위한 클래스를 지정한다.
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootAppContext.class };
	}

	// 파라미터 인코딩 필터 설정
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};
	}
	
	//MultipartResolver의 세부정보를 정의 후 넘김 (몇 바이트를 사용하겠다 등등) ===========
	@Override
	protected void customizeRegistration(Dynamic registration) {
		super.customizeRegistration(registration);
		MultipartConfigElement config1= new MultipartConfigElement(null, 52428800, 524288000, 0); 
		//new MultipartConfigElement의 매개변수: (자동주입(실제서버가 주는 저장소=여기서는 톰캣이 가지고있는 저장소.),주기억장치 메모리 할당, 실제파일데이터 용량, 서버가 알아서 해=자동저장 ) 
		//null: 사용자 지정이 아닌 서버가 제공하는 임시기억장소
		//52428800: 업로드시 메모리 용량 할당
		//524288000: 파일데이터를 포함한 전체용량 (보통 10배로 셋팅) 
		//0: 데이터를 받아서 자동으로 저장 
		
		registration.setMultipartConfig(config1);

		
	}
	
	
}
