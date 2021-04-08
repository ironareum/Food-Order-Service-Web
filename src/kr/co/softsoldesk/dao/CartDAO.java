package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.mapper.CartMapper;
import kr.co.softsoldesk.mapper.LoginMapper;

@Repository
public class CartDAO {
	
	@Autowired
	private CartMapper mapper;
	
	
	public void insertCart(MyCartBean cartBean) {
		mapper.insertCart(cartBean);
	}
	
	public List<MyCartBean> selectAllMyCart(){
		return mapper.selectAllMyCart();
	}
	
	public int selectMenuId(String menu_name) {
		return mapper.selectMenuId(menu_name);
	}
	
	
}
