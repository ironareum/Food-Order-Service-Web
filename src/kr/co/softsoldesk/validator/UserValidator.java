package kr.co.softsoldesk.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.co.softsoldesk.beans.CustomerBean;
public class UserValidator implements Validator{
		
	@Override
	public boolean supports(Class<?> clazz) {
			return CustomerBean.class.isAssignableFrom(clazz);
		}

	@Override
	public void validate(Object target, Errors errors) {
		// 형변환
		CustomerBean customerBean = (CustomerBean) target;

		String beanName = errors.getObjectName();
		//Bean을 매개로 사용하는 모든 변수가 유효성검사를 하지 않도록, beanname을 특정하여 주는
		//이중IF문을 사용한다.
		if (beanName.equals("joinCustomerBean") ) {

			
			
			if (customerBean.getCust_pw().equals(customerBean.getCust_pw2()) == false) {
				errors.rejectValue("cust_pw", "NotEquals");
				errors.rejectValue("cust_pw2", "NotEquals");
				
			}

			if (customerBean.isCust_idExist() == false) {
				errors.rejectValue("cust_id","DontCheckCustomerIdExist");
			}
		}
		
		if(beanName.equals("modifyCustomerInfoBean")) {
			
			if (customerBean.getCust_modifyPW().equals(customerBean.getCust_modifyPW2()) == false ) {
				errors.rejectValue("cust_modifyPW", "NotEquals");
				errors.rejectValue("cust_modifyPW2", "NotEquals");		
			}
		}
		}

	}


