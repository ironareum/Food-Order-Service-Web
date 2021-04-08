package kr.co.softsoldesk.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.softsoldesk.beans.CustomerBean;

public interface LoginMapper {
	
	
	
	//회원가입
	@Insert("insert into customer(cust_num, cust_id, cust_pw, cust_name, cust_phone, cust_email, cust_nickname, content_file) "
			+ "values(cust_seq.nextval, #{cust_id}, #{cust_pw}, #{cust_name}, #{cust_phone}, #{cust_email}, #{cust_nickname},#{content_file,jdbcType=VARCHAR})")
	public void insertCustomer(CustomerBean bean);
	
	//회원가입시 아이디 중복 확인
	@Select("select cust_nickname from customer where cust_id=#{cust_id}")
	String checkCustIdExist(String cust_id);
	
	
	//로그인
	//수정했음
	@Select("select cust_num, cust_name, cust_id, cust_email, cust_nickname, cust_phone, content_file from customer where cust_id=#{cust_id} and cust_pw=#{cust_pw}")
	public CustomerBean getLoginCustomerInfo(CustomerBean tempLoginBean);
	
	//사용자 정보수정
	//수정했음
	@Update("update customer set cust_name=#{cust_name}, cust_pw=#{cust_pw}, cust_email=#{cust_email}, cust_nickname=#{cust_nickname}, cust_phone=#{cust_phone}, content_file = #{content_file, jdbcType=VARCHAR} where cust_num=#{cust_num}")
	public void modifyCustomerInfo(CustomerBean modifyCustomerInfoBean);
	
	//사용자 정보수정시 비밀번호 확인
	@Select("select cust_num from customer where cust_pw = #{cust_pw} and cust_id= #{cust_id}")
	public CustomerBean modifyCheckPW(CustomerBean modifyCheckBean);
	
	@Select("select * from customer where cust_id = #{cust_id}")
	public CustomerBean getCustomerInfo(String cust_id);
	
	
}