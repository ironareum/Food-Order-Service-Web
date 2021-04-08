package kr.co.softsoldesk.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewBean2;
import kr.co.softsoldesk.service.OrdersService;
import kr.co.softsoldesk.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Resource(name="loginCustBean")
	CustomerBean loginUserBean;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	OrdersService orderService;
	
	@GetMapping("/delete")
	public String delete(@RequestParam("review_num") String review_num, HttpServletRequest req, Model model) {
		
		int review_num_int = Integer.parseInt(review_num);
		
		ReviewBean reviewBean = new ReviewBean();
		String tab = req.getParameter("tab");
		//이거 두개가지고 리뷰 삭제 시작
		reviewBean.setCust_id(loginUserBean.getCust_id());
		reviewBean.setRownum(review_num_int);
		System.out.println(review_num_int);
		System.out.println(reviewBean.getCust_id());
		orderService.deleteCustReview(reviewBean);
		//다끝나고 modify 재로딩
		System.out.println("실행된건가");
		model.addAttribute("tab", tab);
		return "redirect:/Customer/modify/returnModify";
	}
	
}
