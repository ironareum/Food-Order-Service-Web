package kr.co.softsoldesk.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.dao.CartDAO;


@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	public void insertCart(MyCartBean cartBean) {
		//인써트 완료
		cartDAO.insertCart(cartBean);
	}
	
	
	public List<MyCartBean> selectAllMyCart(){
		return cartDAO.selectAllMyCart();
	}
	
	public int selectMenuId(String menu_name) {
		return cartDAO.selectMenuId(menu_name);
	}
	
	
	
}
