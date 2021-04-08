package kr.co.softsoldesk.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.mapper.LoginMapper;



@Repository
public class CustomerDAO {

	@Autowired
	private LoginMapper mapper;

	//회원가입
	public void insertCustomer(CustomerBean bean) {
		mapper.insertCustomer(bean);
	}
	
	//회원가입시 중복확인
	public String checkCustIdExist(String cust_id) {
		return mapper.checkCustIdExist(cust_id);
	}
	
	
	//로그인
	public CustomerBean getLoginCustomerInfo(CustomerBean tempLoginInfo) {
		return mapper.getLoginCustomerInfo(tempLoginInfo);
		
	}
	
	//회원정보수정
	public void modifyCustomerInfo(CustomerBean modifyCustomerInfoBean) {
		mapper.modifyCustomerInfo(modifyCustomerInfoBean);
	}
	//회원정보수정시 비밀번호확인
	public CustomerBean modifyCheckPW(CustomerBean modifyCheckBean) {
		return mapper.modifyCheckPW(modifyCheckBean);
	}
	
	public CustomerBean getCustomerInfo(String cust_id) {
		return mapper.getCustomerInfo(cust_id);
	}

}