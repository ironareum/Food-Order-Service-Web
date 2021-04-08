package kr.co.softsoldesk.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.LikeBean;
import kr.co.softsoldesk.service.LikeService;

@Controller
@RequestMapping("/like") //마이페이지로 가야해요ㅠㅠ
public class LikeController {

	
	@Autowired
	private LikeService likeService;
	
	@Resource(name="loginCustBean")
	private CustomerBean loginCustBean;
	
	
	
	//로그인한 유저의 모든 찜 목록 가져오기
	@GetMapping("/like_list") //사실은 마이페이지로 가야해요. . .
	public String like_list(Model model) {
	
		List<LikeBean> allLikes=likeService.getAllLikes(loginCustBean.getCust_id());
	   
	   model.addAttribute("allLikes",allLikes);
	   
	   return "like/like_list"; //마이페이지로 가야한다구요. . .ㅠㅠ
	   
	}
	
	@ResponseBody
	@GetMapping("/insertLike")
	public String insertLike(@RequestParam Map<String, Object> map) {
		
		LikeBean likeBean = new LikeBean();
		
		likeBean.setCust_id((String)map.get("cust_id"));
		likeBean.setStore_id(Integer.parseInt((String)map.get("store_id")));
		likeBean.setLike_num(0);
		
		likeService.insertLikeTable(likeBean);
		
		return "success"; 
				
	}
	
	
	@ResponseBody
	@GetMapping("/deleteLike")
	public String deleteLike(@RequestParam Map<String, Object> map) {
		
		LikeBean likeBean = new LikeBean();
		
		likeBean.setCust_id((String)map.get("cust_id"));
		likeBean.setStore_id(Integer.parseInt((String)map.get("store_id")));
		likeBean.setLike_num(0);
	
		likeService.deleteLikeTable(likeBean);
		
		return "success2"; 
				
	}
	
}
