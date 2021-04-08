package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.beans.CartBean;

import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.beans.OrdersBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewBean2;
import kr.co.softsoldesk.beans.StoreBean;

public interface OrdersMapper {
	
	    //로그인된 상태에서 불러오는 것이므로 세팅된것이 있으니, 세팅된 id 정보를 where절에 사용.
		//1) 폰번호불러오기	
		@Select("select cust_phone "
				+ "from customer "
				+ "where cust_id=#{cust_id} ")
		String getPmtCustInfo(String cust_id);
		
		
		//2) 장바구니에 담긴 메뉴에 대한 메뉴이름/판매가게 정보 가져오기
		
		@Select("select m.store_name, m.menu_name "
				+ "from  cart c, menu m "
				+ "where c.menu_id=m.menu_id "
				+ "and c.cust_id=#{cust_id}")
		MenuBean getPmtMenuStoreInfo(String cust_id);
		
			
	
		
		/*
		 * // 1회성으로 연락처 바꾸기(불필요한데 괜히했다-_-)
		 * 
		 * @Update("update orders set order_contact=#{order_contact} where cust_id=#{cust_id}"
		 * ) void changeOrderContact(String cust_id) ;
		 */
		
		
		//3) DB로부터 장바구니 정보가져옴 (주문표채워넣기위함)
		@Select("select * from cart where cust_id=#{cust_id}")
		CartBean getOrderCartBean(String cust_id);
		
		
		
		//4) 완성된 주문표가 오더로 변환되는 시점
		
		@Insert("insert into orders(ORDER_NUM ,CUST_ID ,STORE_ID, MENU_ID, ORDER_QUANT, ORDER_REQ, ORDER_DATE, TOTAL_PMT,ORDER_CONTACT,USEAGAIN,NODISPOSABLE) "
				+ "values(order_seq.nextval, #{cust_id},"
				+ "#{store_id}, #{menu_id} ,#{order_quant}, #{order_req}, sysdate, #{total_pmt},"
				+ "#{order_contact},#{useagain},#{nodisposable});")
		void addOrderInfo(OrdersBean tempOrdersBean );
		
		
		//5) 주문끝났고 장바구니 비우기
		
		@Delete("delete cart where cust_id = #{cust_id}")
		void cartAllDelete(String cust_id);
		
		
		//================== 주문목록관련 ===============================================
		
		//특정 주문자의 전체주문 읽어오기
		@Select("select * from orders where cust_id=#{cust_id}")
		List<OrdersBean> getAllOrders(String cust_id);
		
		
		@Update("update my_cart set menu_count = #{menu_count} "
				+ "WHERE ROWID = "
				+ "(SELECT rid FROM (SELECT ROWNUM rn, ROWID rid FROM my_cart) WHERE rn = #{rownum})")
		void updateMenuCount(MyCartBean myCartBean);
		
		
		@Delete("DELETE FROM my_cart "
				+ "WHERE ROWID = "
				+ "(SELECT rid FROM (SELECT ROWNUM rn, ROWID rid FROM my_cart) WHERE rn = #{menu_name})")
		void deleteCartMenu(int menu_name);
		
		
		@Delete("DELETE FROM review "
				+ "WHERE ROWID = "
				+ "(SELECT rid FROM (SELECT ROWNUM rn, ROWID rid FROM review WHERE cust_id=#{cust_id}) WHERE rn = #{rownum})")
		void deleteCustReview(ReviewBean reviewBean);

		
		
		
		
		@Insert("insert into orders (order_num, cust_id,store_id,menu_id,order_req,order_date,total_pmt,pmt_method, menu_name ,order_quant) "
				+ "values(order_seq.nextval,#{cust_id},#{store_id},#{menu_id},#{order_req},sysdate,#{total_pmt},#{pmt_method}, #{menu_name}, #{order_quant})")
		void insertOrders(OrdersBean ordersBean);


		@Select("select store_name from orders o, store_table s " + 
				"where o.store_id = s.store_id and cust_id = #{cust_id}")
		String getOneStoreNameByStoreId(String cust_id);
		
		
		@Select("select order_num, total_pmt, store_name, menu_name, order_date, order_req from orders o, store_table s " + 
				"where o.store_id = s.store_id and cust_id = #{cust_id}")
		List<OrdersBean> getOneStoreNameByAll(String cust_id);

		@Select("select store_name from orders o, store_table s " + 
				"where o.store_id = s.store_id and o.order_num = #{order_num}")
		String getOneStoreNameByOrderNum(int order_num);
		
		@Select("select menu_name from orders where order_num = #{order_num}")
		String getOneMenuNameByOrderNum(int order_num);
		
		
		
		@Select("select order_num "
				+ "from orders "
				+ "where order_num=(SELECT max(order_num) FROM orders where cust_id=#{cust_id})")
		int getLatestOrderNum(String cust_id);

		
		//2) 찾아낸 가장 최근의 주문번호로 order_vw의 정보찾아오기(우리는 하나만. .주문한다. . .!!)
		@Select("select * "
				+ "from orders "
				+ "where order_num=#{order_num}")
		OrdersBean getOrderViewBean(int order_num);
		
		@Select("select store_name, store_highway, store_addr, store_phone from store_table s, orders o where s.store_id = o.store_id and o.order_num=#{order_num}")
		StoreBean getStoreNHAbyOrderNum(int order_num);
		
}

