package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.validator.UserValidator;
import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.LikeBean;
import kr.co.softsoldesk.beans.OrdersBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.service.CustomerService;
import kr.co.softsoldesk.service.LikeService;
import kr.co.softsoldesk.service.OrdersService;
import kr.co.softsoldesk.service.ReviewService;

@Controller
@RequestMapping("/Customer")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;

	@Resource(name="loginCustBean")
	private CustomerBean loginUserBean;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikeService likeService;
	
	
	//=================================================================
	//========================로그인====================================
	//=================================================================
	//로그인을 하기 위한 화면을 띄우기 위한 객체준비등
	@GetMapping("/login")
	public String Login (@ModelAttribute("tempLoginCustomerBean")CustomerBean tempLoginCustomerBean,
						@RequestParam(value = "fail" , defaultValue = "false") boolean fail, Model model){						
		//param값이 true로 들어오면, 실패 : 로그인의 여부를 묻는 것이기 때문에 true면 로그인을 할 필요x
		// 반대로 false면 로그인중이 아니므로 로그인창을 띄워주어야 함.
		model.addAttribute("fail", fail); //기본 셋팅값은 false
		
		//로그인 홈페이지 주소를 리턴
		return "Customer/Login";	
	}
	
	//아이디와 비밀번호를 입력 후 로그인버튼을 눌렀을 때 처리.
	@PostMapping("/login_pro")
	public String Login_pro(@Validated @ModelAttribute("tempLoginCustomerBean") CustomerBean tempLoginCustomerBean, BindingResult res) {
		
		//임시 빈에다가 입력받은 ID와 패스워드를 담아 서비스로 올려보냄.
		//결과는 세션에 등록된 빈에 들어옴.
		customerService.getLoginCustomerInfo(tempLoginCustomerBean); 

		if(res.hasErrors()) {
			return "Customer/Login";
		}
		
		//세션에 올라간 빈의 상태가 true로 반환되었으면 로그인처리
		if(loginUserBean.isCust_login()==true) {
			return "Customer/Login_Successs";
		
		//false로 반환되었으면 로그인실패처리.
		}	return "Customer/Login_False";
}
	
	@GetMapping("/logout")
	public String logoutCustomer() {
		String viewName="Customer/logout";
		loginUserBean.setCust_login(false);
		
		return viewName;
	}
	
	@GetMapping("not_login")
	public String not_Login() {
		String viewName="Customer/Not_Login";
		return viewName;
	}
	
	//=================================================================
	//========================회원가입===================================
	//=================================================================
	
	//회원가입 누르면 동의문
	@GetMapping("/new")
	public String New() {
		String viewName = "Customer/Agree";
		return viewName;
	}
	
	@GetMapping("/new/join")
	public String newJoin (@ModelAttribute("joinCustomerBean") CustomerBean bean) {
		String viewName = "Customer/Join";
		return viewName;
	}
	
	
	@PostMapping("/insert")
	public String insertCustomer(@Validated @ModelAttribute("joinCustomerBean") CustomerBean bean, BindingResult res) {
		String viewName = "Customer/Complete";
		String reWrite = "Customer/Join";
		
		if(res.hasErrors()) {
	    return reWrite;
		}//else if (!bean.getCust_pw().equals(bean.getCust_pw2())){
			//return reWrite;
		
//		if(bean.getCust_emailAddr2()!=null) {
//			String email = bean.getCust_email() + "@" + bean.getCust_emailAddr2(); 
//			System.out.println(email);
//			bean.setCust_email(email);
//			customerService.insertCustomer(bean);
//			return viewName;
//	}
			String email = bean.getCust_email(); 
			System.out.println(email);
			bean.setCust_email(email);
			customerService.insertCustomer(bean);
			
			return viewName;
	}
	

	//=================================================================
	//========================정보수정===================================
	//=================================================================
	
	@GetMapping("modify/access")
	public String modifyCustomerInfo(@ModelAttribute("modifyCustomerInfoBean")CustomerBean modifyCustomerInfoBean,
									HttpServletRequest req, Model model) {
		String tab = req.getParameter("tab");
		model.addAttribute("tab", tab);
		String viewName="Customer/checkPassword";
		System.out.println(loginUserBean.isCust_login());
		return viewName;
	}
	
	@RequestMapping(value="modify/modifyPro", method={RequestMethod.GET, RequestMethod.POST})
	public String modifyCheckPassword(@ModelAttribute("modifyCustomerInfoBean")CustomerBean modifyCustomerInfoBean, 
									HttpServletRequest req, Model model) {
		
		String tab = req.getParameter("tab");
		model.addAttribute("tab", tab);
		//주문목록 죄다 가져오기
		List<OrdersBean> getAllOrders = ordersService.getAllOrders(loginUserBean.getCust_id());
		//내 리뷰 죄다 가져오기
		List<ReviewBean> getAllReviews = reviewService.getAllReviewsByCustId(loginUserBean.getCust_id());
		//찜한 목록 죄다 가져오기
		List<LikeBean> getAllLikes = likeService.getAllLikes(loginUserBean.getCust_id());
		
		
		for(int i = 0; i < getAllOrders.size(); i++) {
			System.out.println(getAllOrders.get(i).getOrder_num());
			getAllOrders.get(i).setStore_name(ordersService.getOneStoreNameByOrderNum(getAllOrders.get(i).getOrder_num()));
		}
		
		for(int i = 0; i < getAllReviews.size(); i++) {
			System.out.println(getAllReviews.get(i).getOrder_num());
			getAllReviews.get(i).setStore_name(ordersService.getOneStoreNameByOrderNum(getAllReviews.get(i).getOrder_num()));
			getAllReviews.get(i).setMenu_name(ordersService.getOneMenuNameByOrderNum(getAllReviews.get(i).getOrder_num()));
		}
		
		
		
		String Success="Customer/Modify";
		String fail="Customer/ModifyFail";
		
		CustomerBean modifyCheckBean = new CustomerBean();
		modifyCheckBean.setCust_id(loginUserBean.getCust_id());
		modifyCheckBean.setCust_name(loginUserBean.getCust_name());
		modifyCheckBean.setCust_email(loginUserBean.getCust_email());
		modifyCheckBean.setCust_nickname(loginUserBean.getCust_nickname());
		modifyCheckBean.setCust_phone(loginUserBean.getCust_phone());
		
		//수정부분
		modifyCheckBean.setContent_file(loginUserBean.getContent_file());
				
		
		
		
		
		modifyCheckBean.setCust_pw(modifyCustomerInfoBean.getCust_pw());
		boolean chk=customerService.modifyCheckPW(modifyCheckBean);
		
		if(chk==true) {
			modifyCustomerInfoBean.setCust_id(modifyCheckBean.getCust_id());
			modifyCustomerInfoBean.setCust_name(modifyCheckBean.getCust_name());
			modifyCustomerInfoBean.setCust_modifyEmail(modifyCheckBean.getCust_email());
			modifyCustomerInfoBean.setCust_phone(modifyCheckBean.getCust_phone());
			modifyCustomerInfoBean.setCust_nickname(modifyCheckBean.getCust_nickname());
			
			//수정부분
			modifyCustomerInfoBean.setContent_file(modifyCheckBean.getContent_file());
			
			model.addAttribute("cust_name", loginUserBean.getCust_name());
			model.addAttribute("getAllOrders", getAllOrders);
			model.addAttribute("getAllReviews", getAllReviews);
			model.addAttribute("getAllLikes", getAllLikes);
			//수정부분
			model.addAttribute("content_file",loginUserBean.getContent_file());
	
			return Success;
		}return fail;
	}
	
	@RequestMapping(value="modify/returnModify", method={RequestMethod.GET, RequestMethod.POST})
	public String returnModify(@ModelAttribute("modifyCustomerInfoBean")CustomerBean modifyCustomerInfoBean, 
												Model model,
												HttpServletRequest req){
		
		CustomerBean customerBean = customerService.getCustomerInfo(loginUserBean.getCust_id());
		
		loginUserBean.setCust_id(customerBean.getCust_id());
		loginUserBean.setCust_email(customerBean.getCust_email());
		loginUserBean.setCust_name(customerBean.getCust_name());
		loginUserBean.setCust_nickname(customerBean.getCust_nickname());
		loginUserBean.setCust_phone(customerBean.getCust_phone());
		
		//수정부분 
		loginUserBean.setContent_file(customerBean.getContent_file());
		
		model.addAttribute("tab", req.getParameter("tab"));
		
		  model.addAttribute("cust_id", customerBean.getCust_id());
		  model.addAttribute("cust_email", customerBean.getCust_email());
		  model.addAttribute("cust_name", customerBean.getCust_name());
		  model.addAttribute("cust_nickname", customerBean.getCust_nickname());
		  model.addAttribute("cust_phone", customerBean.getCust_phone()); //수정부분
		  model.addAttribute("content_file", customerBean.getContent_file());
		 
		
		/*
		 * model.addAttribute("cust_id", loginUserBean.getCust_id());
		 * model.addAttribute("cust_email", loginUserBean.getCust_email());
		 * model.addAttribute("cust_name", loginUserBean.getCust_name());
		 * model.addAttribute("cust_nickname", loginUserBean.getCust_nickname());
		 * model.addAttribute("cust_phone", loginUserBean.getCust_phone()); //수정부분
		 * model.addAttribute("content_file", loginUserBean.getContent_file());
		 */
		
		
		
		
		
		//주문목록 죄다 가져오기
		List<OrdersBean> getAllOrders = ordersService.getAllOrders(loginUserBean.getCust_id());
		//내 리뷰 죄다 가져오기
		List<ReviewBean> getAllReviews = reviewService.getAllReviewsByCustId(loginUserBean.getCust_id());
		//찜한 목록 죄다 가져오기
		List<LikeBean> getAllLikes = likeService.getAllLikes(loginUserBean.getCust_id());
		
		for(int i = 0; i < getAllOrders.size(); i++) {
			System.out.println(getAllOrders.get(i).getOrder_num());
			getAllOrders.get(i).setStore_name(ordersService.getOneStoreNameByOrderNum(getAllOrders.get(i).getOrder_num()));
		}
		
		for(int i = 0; i < getAllReviews.size(); i++) {
			System.out.println(getAllReviews.get(i).getOrder_num());
			getAllReviews.get(i).setStore_name(ordersService.getOneStoreNameByOrderNum(getAllReviews.get(i).getOrder_num()));
			getAllReviews.get(i).setMenu_name(ordersService.getOneMenuNameByOrderNum(getAllReviews.get(i).getOrder_num()));
		}
		
		
		model.addAttribute("getAllOrders", getAllOrders);
		model.addAttribute("getAllReviews", getAllReviews);
		model.addAttribute("getAllLikes", getAllLikes);
		
		return "Customer/Modify";
	}
	
	//정보수정 
	@PostMapping("modify/customerModify")
	public String modifyCustomer(@Validated @ModelAttribute("modifyCustomerInfoBean")CustomerBean modifyCustomerInfoBean, BindingResult res, Model model) {
		String viewName = "Customer/ModifySuccess";
		String reWrite = "Customer/Modify";
		
		modifyCustomerInfoBean.setCust_email(modifyCustomerInfoBean.getCust_modifyEmail());
		
		if(res.hasErrors()) {
			CustomerBean customerBean = customerService.getCustomerInfo(loginUserBean.getCust_id());
			
			model.addAttribute("cust_id", customerBean.getCust_id());
			model.addAttribute("cust_email", customerBean.getCust_email());
			model.addAttribute("cust_name", customerBean.getCust_name());
			model.addAttribute("cust_nickname", customerBean.getCust_nickname());
			model.addAttribute("cust_phone", customerBean.getCust_phone());
			
			//수정부분
			model.addAttribute("content_file", customerBean.getContent_file());
			
			
			
			//주문목록 죄다 가져오기
			List<OrdersBean> getAllOrders = ordersService.getAllOrders(loginUserBean.getCust_id());
			//내 리뷰 죄다 가져오기
			List<ReviewBean> getAllReviews = reviewService.getAllReviewsByCustId(loginUserBean.getCust_id());
			
			model.addAttribute("getAllOrders", getAllOrders);
			model.addAttribute("getAllReviews", getAllReviews);
			
			
			return reWrite;
		}
		
		if(modifyCustomerInfoBean.getCust_modifyPW() !=null && modifyCustomerInfoBean.getCust_modifyPW2() !=null) {
			modifyCustomerInfoBean.setCust_modifyPW(modifyCustomerInfoBean.getCust_modifyPW());
			customerService.modifyCustomerInfo(modifyCustomerInfoBean);
			return viewName;	
			}
			customerService.modifyCustomerInfo(modifyCustomerInfoBean);
			return viewName;
		
	}
	

	
	
	
	//=================================================================
	//========================커스터마이징 유효성===========================
	//=================================================================
	
	
	
	//커스터마이징한 validator를 controller에 등록한다.
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		UserValidator validator1 = new UserValidator();
		binder.addValidators(validator1);
	}
	
}


