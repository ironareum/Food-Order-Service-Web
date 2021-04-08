package kr.co.softsoldesk.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		System.out.println("실제경로: "+request.getServletContext().getRealPath("/")); // 실제 경로 확인
		return "redirect:/index";
	}
}

