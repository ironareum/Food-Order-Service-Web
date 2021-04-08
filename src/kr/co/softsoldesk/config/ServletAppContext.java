package kr.co.softsoldesk.config;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.interceptor.CustomerInterceptor;
import kr.co.softsoldesk.interceptor.StoreInterceptor;
import kr.co.softsoldesk.interceptor.TopmenuInterceptor;
import kr.co.softsoldesk.mapper.BoardMapper;
import kr.co.softsoldesk.mapper.CartMapper;
import kr.co.softsoldesk.mapper.LikeMapper;
import kr.co.softsoldesk.mapper.LoginMapper;
import kr.co.softsoldesk.mapper.MenuMapper;
import kr.co.softsoldesk.mapper.OrdersMapper;
import kr.co.softsoldesk.mapper.ReviewMapper;
import kr.co.softsoldesk.mapper.ShopMapper;
import kr.co.softsoldesk.mapper.StoreMapper;

//Spring MVC 프로젝트에 관련된 설정을 하는 클래스
//(servlet-context에서 <annotation-driven/>와 같음)
@Configuration
//Controller 어노테이션이 셋팅되어 있는 클래스를 Controller로 등록한다.
@EnableWebMvc
//스캔할 패키지를 지정한다.
@ComponentScan("kr.co.softsoldesk.controller")
@ComponentScan("kr.co.softsoldesk.dao")
@ComponentScan("kr.co.softsoldesk.service")
@PropertySource("WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {
	// 프로퍼티
	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;

	@Resource(name = "loginCustBean")
	private CustomerBean loginUserBean;
	
	@Resource(name = "currentStore")
	private StoreBean currentStore;
	
	

	// Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정한다.
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적 파일의 경로를 매핑한다.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	// =====================
	// DB 접속정보를 관리하는 Bean
	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);
		return source;
	}

	// 쿼리문과 접속관리하는 객체 (=getCon)
	@Bean
	public SqlSessionFactory factory(BasicDataSource dataSource) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	// 쿼리문 실행을 위한 객체 (Mapper관리)
	@Bean
	public MapperFactoryBean<ShopMapper> getShopMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ShopMapper> factoryBean = new MapperFactoryBean<ShopMapper>(ShopMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<StoreMapper> getMarketMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<StoreMapper> factoryBean = new MapperFactoryBean<StoreMapper>(StoreMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<MenuMapper> getMenuMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<MenuMapper> factoryBean = new MapperFactoryBean<MenuMapper>(MenuMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	@Bean
	public MapperFactoryBean<ReviewMapper> getReviewMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ReviewMapper> factoryBean = new MapperFactoryBean<ReviewMapper>(ReviewMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<LoginMapper> test_mapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<LoginMapper> factoryBean = new MapperFactoryBean<LoginMapper>(LoginMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<CartMapper> getCartmapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<CartMapper> factoryBean = new MapperFactoryBean<CartMapper>(CartMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<OrdersMapper> getOrdersMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<OrdersMapper> factoryBean = new MapperFactoryBean<OrdersMapper>(OrdersMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<LikeMapper> getLikeMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<LikeMapper> factoryBean = new MapperFactoryBean<LikeMapper>(LikeMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	@Bean
	public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	// ========= 유효성 검사 =========
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasename("/WEB-INF/properties/error_message");
		return res;
	}

	// ===인터셉터
	// 로그인 없이 접근불가한 주소들을 검사하기위한 인터셉터
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);
//		
		TopmenuInterceptor topmenuInterceptor = new TopmenuInterceptor(loginUserBean);
		InterceptorRegistration reg1=registry.addInterceptor(topmenuInterceptor);
		reg1.addPathPatterns("/**");
//		
		CustomerInterceptor customerInterceptor= new CustomerInterceptor(loginUserBean);
		InterceptorRegistration reg2 = registry.addInterceptor(customerInterceptor);
	    reg2.addPathPatterns("/Customer/modify/*");
		
		StoreInterceptor storeInterceptor = new StoreInterceptor(currentStore);
		InterceptorRegistration reg3=registry.addInterceptor(storeInterceptor);
		reg3.addPathPatterns("/**");
	}
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		
		
		return new StandardServletMultipartResolver(); // 객체 생성하여 반환 >  최소 몇 바이트씩 등록
	}
	

}
