package kr.co.softsoldesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.softsoldesk.service.CustomerService;

@RestController
public class RestAPIController {
	
	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/Customer/checkCustIdExist/{cust_id}")
	public String CheckCustIDExist(@PathVariable String cust_id) {
		System.out.println(cust_id);
		boolean chk = customerService.CheckCustIDExist(cust_id);
		return chk+"";
	}

}
