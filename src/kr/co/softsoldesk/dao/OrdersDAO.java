package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.beans.OrdersBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewBean2;
import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.mapper.OrdersMapper;

@Repository
public class OrdersDAO {
	
	@Autowired
	private OrdersMapper ordersMapper;

	public String getPmtCustInfo(String cust_id) {
		return ordersMapper.getPmtCustInfo(cust_id);
	}
	
	public MenuBean getPmtMenuStoreInfo(String cust_id) {
		
		return ordersMapper.getPmtMenuStoreInfo(cust_id);
	}
	
	/*
	 * //1회성으로 연락처 변경 public void changeOrderContact(String cust_id) {
	 * 
	 * ordersMapper.changeOrderContact(cust_id); };
	 */
	
	
	
	public CartBean getOrderCartBean(String cust_id) {
		
		return ordersMapper.getOrderCartBean(cust_id);
	};
	
	

	//주문표에 있는것들이 주문표로 들어감
	public void addOrderInfo(OrdersBean tempOrdersBean) {
		
		ordersMapper.addOrderInfo(tempOrdersBean);
	}
	
	//장바구니 비우기
	
	 public void cartAllDelete(String cust_id) {
		 
		 ordersMapper.cartAllDelete(cust_id);
	 }
	
	 
	 //============= 주문 목록 관련 ===============================
	
	 public List<OrdersBean> getAllOrders(String cust_id){
		 
		 return ordersMapper.getAllOrders(cust_id);
	 };

	 public void deleteCartMenu(int menu_name) {
		 ordersMapper.deleteCartMenu(menu_name);
	 }
	 
	 public void insertOrders(OrdersBean ordersBean) {
		 ordersMapper.insertOrders(ordersBean);
	 }
	 
	 public String getOneStoreNameByStoreId(String cust_id) {
		 return ordersMapper.getOneStoreNameByStoreId(cust_id);
	 }
	 
	 public List<OrdersBean> getOneStoreNameByAll(String cust_id){
		 return ordersMapper.getOneStoreNameByAll(cust_id);
	 }
	 
	 public void deleteCustReview(ReviewBean reviewBean) {
		 ordersMapper.deleteCustReview(reviewBean);
	 }
	 
	 public void updateMenuCount(MyCartBean myCartBean) {
		 ordersMapper.updateMenuCount(myCartBean);
	 }
	 
	 public int getLatestOrderNum(String cust_id) {

	    return ordersMapper.getLatestOrderNum(cust_id);
	 }
	 
	 public OrdersBean getOrderViewBean(int order_num){
		   
		   
		return ordersMapper.getOrderViewBean(order_num);
	 }
	    
	 public StoreBean getStoreNHAbyOrderNum(int order_num) {
			return ordersMapper.getStoreNHAbyOrderNum(order_num);
	 }
	 
	 public String getOneStoreNameByOrderNum(int order_num) {
		 return ordersMapper.getOneStoreNameByOrderNum(order_num);
	 }
	 
	 public String getOneMenuNameByOrderNum(int order_num) {
		 return ordersMapper.getOneMenuNameByOrderNum(order_num);
	 }
}
