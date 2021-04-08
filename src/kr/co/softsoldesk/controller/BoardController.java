package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.OrdersBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.service.OrdersService;
import kr.co.softsoldesk.service.ReviewService;

@Controller
@RequestMapping("/board")//이 컨트롤러에서는 /board를 고정해서 받음
public class BoardController {
	
	
	@Autowired
	private ReviewService reviewService;
	
	@Resource(name="loginCustBean")
	private CustomerBean loginUserBean;
	
	@Autowired
	private OrdersService orderService;
	

	@GetMapping("/write")
	public String write(@ModelAttribute("reviewBean") ReviewBean reviewBean, Model model, HttpServletRequest req) {
		List<OrdersBean> allOrders = orderService.getOneStoreNameByAll(loginUserBean.getCust_id());
		
		OrdersBean ordersBean = new OrdersBean();
		int num = Integer.parseInt(req.getParameter("num"));
		for(int i = 0; i < allOrders.size(); i++) {
			if(allOrders.get(i).getOrder_num() == num) {
				ordersBean.setOrder_num(num);
				ordersBean.setOrder_date(allOrders.get(i).getOrder_date());
				ordersBean.setMenu_name(allOrders.get(i).getMenu_name());
				ordersBean.setTotal_pmt(allOrders.get(i).getTotal_pmt());
				ordersBean.setStore_name(orderService.getOneStoreNameByOrderNum(allOrders.get(i).getOrder_num()));
				
			}
			
		}
		
		model.addAttribute("cust_id", loginUserBean.getCust_id());
		model.addAttribute("ordersBean", ordersBean);
		

		return "order/review_page";
	}
	
	//ContentBean에 유효성검사할 필드 설정
	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("reviewBean") ReviewBean reviewBean,BindingResult result, 
									@RequestParam("cust_id") String cust_id,
									HttpServletRequest req,
									Model model) {
		
		if(result.hasErrors()) {
			
			return "board/write";
		}
		
		reviewBean.setCust_id(cust_id);
		reviewService.addContentInfo(reviewBean);
		System.out.println(req.getParameter("tab"));
		model.addAttribute("tab", req.getParameter("tab"));
		return "order/write_success";
	}
	
	
	
}
