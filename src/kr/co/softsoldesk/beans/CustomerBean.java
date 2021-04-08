package kr.co.softsoldesk.beans;


import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

public class CustomerBean {
	
	private int cust_num;
	
	@Size(min = 4 ,max = 12)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String cust_id;
	
	@Size(min = 4 , max =20 )
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String cust_pw;
	
	@Size(min = 4 , max =20 )
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String cust_pw2;
	
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String cust_modifyPW;
	
	@Size(min=4, max=20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String cust_modifyPW2;
	
	@Size(max = 13)
	private String cust_phone;

	@Size(min = 1)
	@Pattern(regexp = "[가-힣]*")
	private String cust_name;
	
	//@Pattern(regexp = "[a-zA-Z0-9]*")
	@Pattern(regexp=".+@.+\\.[a-z]+")
	private String cust_email;
//	private String cust_emailAddr;
//	private String cust_emailAddr2;
	private String cust_modifyEmail;
	@Size(max = 8)
	private String cust_nickname;
	
	private boolean cust_idExist;
	private boolean cust_login;
	

	//정적데이터 타입 : enctype="multipart/form-data"
	//브라우저에서 인식하는 실제 파일데이터.---> write.jsp에서 첨부이미지에서는 이녀석을 잡아야한다.
	private MultipartFile upload_file;
	
	//우리가 보는 String형태의 파일 이름. 
	private String content_file;//DB에 보낼 파일이름.
	
	
	

	
	public MultipartFile getUpload_file() {
		return upload_file;
	}


	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}


	public String getContent_file() {
		return content_file;
	}


	public void setContent_file(String content_file) {
		this.content_file = content_file;
	}


	
	
	
	
	
	
	
	
	public CustomerBean() {
		this.cust_idExist=false;
		this.cust_login=false;
	}
	
	
	public boolean isCust_idExist() {
		return cust_idExist;
	}


	public void setCust_idExist(boolean cust_idExist) {
		this.cust_idExist = cust_idExist;
	}


	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_pw() {
		return cust_pw;
	}
	public void setCust_pw(String cust_pw) {
		this.cust_pw = cust_pw;
	}
	public String getCust_phone() {
		return cust_phone;
	}
	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}
	public String getCust_email() {
		return cust_email;
	}
	public void setCust_email(String cust_email) {
		this.cust_email = cust_email;
	}
	public String getCust_nickname() {
		return cust_nickname;
	}
	public void setCust_nickname(String cust_nickname) {
		this.cust_nickname = cust_nickname;
	}
	public String getCust_pw2() {
		return cust_pw2;
	}
	public void setCust_pw2(String cust_pw2) {
		this.cust_pw2 = cust_pw2;
	}
//	public String getCust_emailAddr() {
//		return cust_emailAddr;
//	}
//	public void setCust_emailAddr(String cust_emailAddr) {
//		this.cust_emailAddr = cust_emailAddr;
//	}
//
//
//	public String getCust_emailAddr2() {
//		return cust_emailAddr2;
//	}
//
//
//	public void setCust_emailAddr2(String cust_emailAddr2) {
//		this.cust_emailAddr2 = cust_emailAddr2;
//	}


	public String getCust_name() {
		return cust_name;
	}


	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}


	public int getCust_num() {
		return cust_num;
	}


	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}


	public boolean isCust_login() {
		return cust_login;
	}


	public void setCust_login(boolean cust_login) {
		this.cust_login = cust_login;
	}


	public String getCust_modifyPW() {
		return cust_modifyPW;
	}


	public void setCust_modifyPW(String cust_modifyPW) {
		this.cust_modifyPW = cust_modifyPW;
	}


	public String getCust_modifyPW2() {
		return cust_modifyPW2;
	}


	public void setCust_modifyPW2(String cust_modifyPW2) {
		this.cust_modifyPW2 = cust_modifyPW2;
	}


	public String getCust_modifyEmail() {
		return cust_modifyEmail;
	}


	public void setCust_modifyEmail(String cust_modifyEmail) {
		this.cust_modifyEmail = cust_modifyEmail;
	}
	


}