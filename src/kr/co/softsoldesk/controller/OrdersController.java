package kr.co.softsoldesk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.OrdersBean;
import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.beans.MyCartMenuBean;
import kr.co.softsoldesk.service.CartService;
import kr.co.softsoldesk.service.MenuService;
import kr.co.softsoldesk.service.OrdersService;
import kr.co.softsoldesk.service.ShopService;

@Controller
@RequestMapping("/order")
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	@Resource(name="loginCustBean")
	private CustomerBean loginCustBean;
	
	@Autowired
	private MenuBean tempMenuBean;

	@Autowired
	private ShopService shopService;
   
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private CartService cartService; 
   //--------------결제관련 -----------------------------------------

	
	//@ModelAttribute("tempOrdersBean") OrdersBean tempOrdersBean,
   @GetMapping("/payment")
   public String payment(@ModelAttribute("ordersBean") OrdersBean ordersBean, Model model) {
      
	   
	   //마이 카트에 있는 메뉴명 추출후 가공
	   //라면,치킨 외 3개
	   //총합 : 
	   //요청사항 등등 
	   //전부해서 오더리스트에 때려박으면 끝!
	   
	   List<MyCartBean> myCart = cartService.selectAllMyCart();
	   
	   //이름 세팅
	   String menu_str = "";
	   //총주문 개수
	   int my_cart_orderSize = 0;
	   //총합
	   int total_price=0;
	   if(myCart.size() <= 2) {
		   for(int i = 0; i < myCart.size(); i++) {
			   menu_str += myCart.get(i).getMenu_name();
			   menu_str += ", ";
			   
			   my_cart_orderSize += myCart.get(i).getMenu_count();
			   total_price += myCart.get(i).getMenu_price()*myCart.get(i).getMenu_count();
		   }
		   menu_str = menu_str.substring(0, menu_str.length()-2);
	   }else {
		   for(int i = 0; i < myCart.size(); i++) {
			   if(i < 2) {
				   menu_str += myCart.get(i).getMenu_name();
				   menu_str += ", ";
			   	}
			   my_cart_orderSize += myCart.get(i).getMenu_count();
			   total_price += myCart.get(i).getMenu_price()*myCart.get(i).getMenu_count();
		   }
		   menu_str = menu_str.substring(0, menu_str.length()-2);
		   menu_str += " 외 " + (myCart.size()-2) + "개";
	   }
	  
	   System.out.println(menu_str);
	   System.out.println(total_price);
	   
	   
	   //생 카트 데이터
	   model.addAttribute("myCart", myCart);
	   System.out.println(myCart.get(0).getStore_id());
	   
	   
	   
	   //가공된 데이터
	   model.addAttribute("menu_str", menu_str);
	   model.addAttribute("my_cart_orderSize", my_cart_orderSize);
	   model.addAttribute("total_price", total_price);
	   model.addAttribute("cust_phone", loginCustBean.getCust_phone());
	

	   
	      
	   
       return "order/payment";
   }
   
	
   //@ModelAttribute("tempOrdersBean") OrdersBean tempOrdersBean
   @PostMapping("/payment_pro")
   public String payment_pro(@ModelAttribute("ordersBean") OrdersBean ordersBean, HttpServletRequest request) {
	   
	   //기본적으로 필요한 오더빈
	   System.out.println(ordersBean.getOrder_quant() +"개");
	   ordersService.insertOrders(ordersBean);
	   
	   String cust_name = loginCustBean.getCust_name();
	   String cust_email = loginCustBean.getCust_email();
	   String cust_phone = loginCustBean.getCust_phone();
	   String store_name="";
	   
	   request.setAttribute("cust_name", cust_name);
	   request.setAttribute("cust_email", cust_name);
	   request.setAttribute("cust_phone", cust_name);
	   //request.setAttribute("store_name", store_name);
	   
	   if(ordersBean.getPmt_method().equals("신용카드")) {
		   		//select cust_id로 불러올것
		      request.setAttribute("ordersBean", ordersBean);
			   
		    return "order/pmt_debit";
		    
		   }else if(ordersBean.getPmt_method().equals("카카오페이")) {
			   
			   request.setAttribute("ordersBean", ordersBean);
			   
			   
			   return "order/pmt_kakao";
		   }else if(ordersBean.getPmt_method().equals("페이코")) {
			   
			   request.setAttribute("ordersBean", ordersBean);
			   
			   
			   return "order/pmt_payco";
		   }   
		   
		   return "order/payment";
	   
//	 //1 )다음에도 사용/ 재활용품 사용여부/ 요청사항/ 이번주문에 사용할 전화번호를 폼폼으로 세팅받아서 받을것
//	   
//	 //cf) 체크박스 값확인용
//	  
//	   System.out.println(tempOrdersBean.getUseAgain());
//	   
//     // 2)DAO에서 카트정보 끌어오자 ---반환값이 CartBean인 메서드 작성 -----주문표 빈곳 채워넣기
//	   
//	    CartBean tempCartBean=ordersService.getOrderCartBean(loginCustBean.getCust_id());
//	   	   
//	    
//	   
//	   //3)카트정보를 비어있는 주문정보에 채워넣자
//      tempOrdersBean.setCust_id(tempCartBean.getCust_id());//주문자
//      tempOrdersBean.setMenu_id(tempCartBean.getMenu_id());//메뉴
//      tempOrdersBean.setTotal_pmt(tempCartBean.getCart_total());//총금액
//      tempOrdersBean.setOrder_quant(tempCartBean.getCart_quant());//수량
//      tempOrdersBean.setStore_id(tempCartBean.getStore_id());//가게이름
//
//     
//      
//      //4)세팅끝난 주문정보를 DB에 넣자
//      ordersService.addOrderInfo(tempOrdersBean);
//      
//	   
//	   //5) 카트를 비우자 (카트테이블 싹 날리기)
//	   
//      ordersService.cartAllDelete(loginCustBean.getCust_id());
      
	   
   }
  
  //주문용 일회성 전화번호 변경--불필요
   //ordersService.changeOrderContact(tempOrdersBean.getOrder_contact());
   
   
   // --------------- 주문 목록 관련 -------------------------
   
   
   //1) 로그인한 회원의 모든 주문목록을 불러오자
   @GetMapping("/order_list")
   public String order_list(Model model) {
	   
	   //List<OrdersBean> allOrders=ordersService.getAllOrders(loginCustBean.getCust_id());
	  

	   //model.addAttribute("allOrders", allOrders);
	  
	   
	   return "order/order_list";
   }
   
	/*
	 * @RequestMapping(value = "/cart", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String cart(Model model) {
	 * 
	 * 
	 * List<MyCartBean> cartSelectList = shopService.cartSelect();
	 * System.out.println(cartSelectList.get(0).getMenu_count());
	 * System.out.println(cartSelectList.get(0).getMenu_name());
	 * System.out.println(cartSelectList.get(0).getMenu_price());
	 * model.addAttribute("cartSelectList", cartSelectList);
	 * 
	 * 
	 * return "order/cart"; }
	 */
   
   
   
   @RequestMapping(value = "/cart", method = {RequestMethod.GET, RequestMethod.POST})
	public String cart(@RequestParam("store_name") String store_name, Model model) {
		
		//메뉴 이미지랑 이름 수량 가격 필요함
		
		//1.카트안에 들어간거 다 가져옴
		List<MyCartBean> myCart = cartService.selectAllMyCart();
		System.out.println("내카트 사이즈는?: " + myCart.size());
		
		String temp_imgName;
		
		List<MyCartMenuBean> reqMyCartMenuBean = new ArrayList<MyCartMenuBean>();
		for(int i = 0; i < myCart.size(); i++) {
			//메뉴빈 세팅
			MyCartMenuBean myCartMenuBean = new MyCartMenuBean();
			myCartMenuBean.setStore_name(store_name);
			myCartMenuBean.setMenu_name(myCart.get(i).getMenu_name());
			myCartMenuBean.setMenu_price(myCart.get(i).getMenu_price());
			myCartMenuBean.setMenu_count(myCart.get(i).getMenu_count());
			myCartMenuBean.setRownum(myCart.get(i).getRownum());
			//System.out.println("진행중인데?" + myCartMenuBean.getMenu_name() + myCartMenuBean.getStore_name() );
			
			temp_imgName = menuService.getMenuImg(myCartMenuBean);
			System.out.println(temp_imgName);
			myCartMenuBean.setMenu_img(temp_imgName);
			
			reqMyCartMenuBean.add(myCartMenuBean);
		}
		
		model.addAttribute("cartSelectList", reqMyCartMenuBean);

		
		return "order/cart";
		//return "Customer/test";
	}
   
   @ResponseBody
   @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String delete(@RequestParam("menu_name") int menu_name) {
				
	   
	   ordersService.deleteCartMenu(menu_name);
	   System.out.println(menu_name);
	   return "삭제완료";
		//return "Customer/test";
	}
   
   @ResponseBody
   @RequestMapping(value = "/preDelete", method = {RequestMethod.GET, RequestMethod.POST})
	public String preDelete(@RequestParam("menu_count") int menu_count,
							@RequestParam("rownum") int rownum) {
	  
	   MyCartBean myCartBean = new MyCartBean();	
	   myCartBean.setMenu_count(menu_count);
	   myCartBean.setRownum(rownum);
	   
//	   MyCartBean myCartBean = new MyCartBean();
//	   
//	   myCartBean.setMenu_count(Integer.parseInt((String)map.get("menu_count")));
//	   myCartBean.setRownum(Integer.parseInt((String)map.get("rownum")));
//	   
	   System.out.println("자 시작해보자 일껄요");
	   System.out.println(myCartBean.getMenu_count() + "일껄요");
//	   
	   ordersService.updateMenuCount(myCartBean);
	  
	   
	   return "업데이트 완료";
		//return "Customer/test";
	}
   
   
   
   
   
   @RequestMapping(value = "/review_page", method = {RequestMethod.GET, RequestMethod.POST})
	public String review_write() {
				
	   
	  
	   return "order/review_page";
	}
   
   
   
   
   //결제용 API 컨트롤러 for 신용카드/카카오페이 등등
   @PostMapping("/payment_method")
   public String payment_debit(@ModelAttribute("ordersBean") OrdersBean ordersBean,HttpServletRequest request) {
	   
	   
	   ordersService.insertOrders(ordersBean);
//	   
//      
//   if(ordersBean.getPmt_method().equals("신용카드")) {
//	   
//      request.setAttribute("ordersBean", ordersBean);
//	   
//	 
//	   
//	   
//	   
//    return "order/pmt_debit";
//    
//   }else if(ordersBean.getPmt_method().equals("카카오페이")) {
//	   
//	   request.setAttribute("ordersBean", ordersBean);
//	   
//	   
//	   return "order/pmt_kakao";
//   }else if(ordersBean.getPmt_method().equals("페이코")) {
//	   
//	   request.setAttribute("ordersBean", ordersBean);
//	   
//	   
//	   return "order/pmt_payco";
//   }   
   
   return "order/payment2";
   
}

   
   
   @RequestMapping(value = "/pay_success", method = {RequestMethod.GET, RequestMethod.POST})
   public String pay_success(Model model) {
	   
	   //1) 로그인한 주문자의 id를 이용, 그 주문자의 주문번호중에 제일 최근번호 찾아오기
	   int latestOrderNum=ordersService.getLatestOrderNum(loginCustBean.getCust_id());
	   
	   //2) 가장 최근의 주문번호로 order_vw의 정보찾아오기(리스트로 들어와야하겠지만. .우리는. .하나만주문할거시다!!ㅜㅜ)	    
	   OrdersBean orderViewBean=ordersService.getOrderViewBean(latestOrderNum);
	   StoreBean storeBean = ordersService.getStoreNHAbyOrderNum(latestOrderNum);
	   //3) 뷰단으로 넘기기
	   String store_addr = "";
	   
	   store_addr += storeBean.getStore_addr() + " ";
	   store_addr += storeBean.getStore_highway() + " ";
	   store_addr += storeBean.getStore_name();
	   //model.addAttribute("latestOrderNum", latestOrderNum); //하나만 주문할거니까. . .걍밑에걸로 땡기자. . .
	   
	   model.addAttribute("orderViewBean",orderViewBean);
	   model.addAttribute("store_addr",store_addr);
	   model.addAttribute("store_phone",storeBean.getStore_phone());
	   
	   
	   
	   return "order/pay_success";
	   
   }
   
   
   

   
   //===== 주문용 연락처 변경창
   @RequestMapping(value = "/child", method = {RequestMethod.GET, RequestMethod.POST})
   public String child() {
	   
	   return "order/child";
   }
	

   
}
