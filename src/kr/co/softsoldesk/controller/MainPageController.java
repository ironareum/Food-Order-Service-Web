package kr.co.softsoldesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.softsoldesk.beans.StoreBean;

@Controller
public class MainPageController {
	@GetMapping("/index")
	public String index(@ModelAttribute("searchMarketBean") StoreBean searchMarketBean) {
		return "index";
	}
	
}
