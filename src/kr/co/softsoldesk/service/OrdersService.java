package kr.co.softsoldesk.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.CartBean;
import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartBean;
import kr.co.softsoldesk.beans.OrdersBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewBean2;
import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.dao.OrdersDAO;

@Service
public class OrdersService {

	
	@Autowired
	private OrdersDAO ordersDAO;
	

	@Resource(name="loginCustBean")
	private CustomerBean loginUserBean;
	
	
	
	
	
	//payment
	
	//1) 주문자 기존 연락처 가져오기
	//CustomerBean pmtCustBean
       public String getPmtCustInfo(String tempCustId) {
		
    	   return ordersDAO.getPmtCustInfo(tempCustId);
       }
    	   
	
			
	 
	
	      
       //2) 장바구니에 있는 -메뉴/가게 이름 가져옴
       public MenuBean getPmtMenuStoreInfo(String cust_id) {
    	   MenuBean tempPmtMenuBean=ordersDAO.getPmtMenuStoreInfo(cust_id);
    	
    	      	   return tempPmtMenuBean;
    	   
       }
	
       
		/*
		 * // 일회성으로 연락처 변경 public void changeOrderContact(String cust_id) {
		 * 
		 * ordersDAO.changeOrderContact(cust_id); };
		 */
       
     
       // 3)DB에 있는 장바구니 정보 가져옴
       public CartBean getOrderCartBean(String cust_id) {
    	   
    	   CartBean tempCartBean=ordersDAO.getOrderCartBean(cust_id);
    	   
    	   return tempCartBean;
       }
       
       
       
       //4) 다 세팅된 주문표를 DB에 넣음
   	   public void addOrderInfo(OrdersBean tempOrdersBean) {
		
		ordersDAO.addOrderInfo(tempOrdersBean);
   		   
   		   
         }
   	   
   	   //5) 장바구니테이블 날리기
   	   
   	   public void cartAllDelete(String cust_id) {
   		   
   		   ordersDAO.cartAllDelete(cust_id);
   	   }
       
   	   
   	   //==================== 주문목록 불러오기 =========================
       
   	   
         public List<OrdersBean> getAllOrders(String cust_id){
        	         	 
        	 
		 return ordersDAO.getAllOrders(cust_id);
	    };

	    
	   public void deleteCartMenu(int menu_name) {
		   ordersDAO.deleteCartMenu(menu_name);
	   }
	   
	   public void insertOrders(OrdersBean ordersBean) {
			 ordersDAO.insertOrders(ordersBean);
		 }
	   
	   public String getOneStoreNameByStoreId(String cust_id) {
			 return ordersDAO.getOneStoreNameByStoreId(cust_id);
		 }
	   
	   public List<OrdersBean> getOneStoreNameByAll(String cust_id){
		   return ordersDAO.getOneStoreNameByAll(cust_id);
	   }
	   
	   public void deleteCustReview(ReviewBean reviewBean) {
		   ordersDAO.deleteCustReview(reviewBean);
	   }
	   
	   public void updateMenuCount(MyCartBean myCartBean) {
		   ordersDAO.updateMenuCount(myCartBean);
	   }
	   
	   public int getLatestOrderNum(String cust_id) {
	    	
	    	return ordersDAO.getLatestOrderNum(cust_id);
	    }
	   
	   public OrdersBean getOrderViewBean(int order_num){
			   
			   
			return ordersDAO.getOrderViewBean(order_num);
	   } 
	   
		 public StoreBean getStoreNHAbyOrderNum(int order_num) {
				return ordersDAO.getStoreNHAbyOrderNum(order_num);
		 }
		 
		public String getOneStoreNameByOrderNum(int order_num) {
			return ordersDAO.getOneStoreNameByOrderNum(order_num);
		}
		
		public String getOneMenuNameByOrderNum(int order_num) {
			return ordersDAO.getOneMenuNameByOrderNum(order_num);
		}
	   
}
