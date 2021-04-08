package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.beans.StoreBean;

public interface CartMapper {

//	//장바구니(카트)에 메뉴 넣기
//	@Insert("insert into customer(cust_id, menu_id, cart_quant, cart_total)"
//			+ "values(#{cust_id}, #{menu_id}, #{cart_quant}, #{cart_total})")
//	public void insertCart(CartBean cartBean);
	

	
	@Select("select menu_id from menu where menu_name = #{menu_name}")
	public int selectMenuId(String menu_name);
	
	@Select("select rownum, menu_name, menu_price, menu_count, store_id from my_cart")
	public List<MyCartBean> selectAllMyCart();
	
	//장바구니(카트)에 메뉴 넣기
	@Insert("insert into my_cart(menu_name, menu_price, menu_count, store_id) "
			+ "values(#{menu_name}, #{menu_price}, #{menu_count}, #{store_id})")
	public void insertCart(MyCartBean cartBean);
	
	@Delete("DELETE FROM my_cart "
			+ "WHERE ROWID = "
			+ "(SELECT rid FROM (SELECT ROWNUM rn, ROWID rid FROM my_cart) WHERE rn = #{menu_number})")
	public void deleteCart(int menu_number);
	
	
}
