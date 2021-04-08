package kr.co.softsoldesk.beans;

public class CartBean {
	
	
			private String cust_id ;//고객아이디(con 고객테이블)
			private int menu_id;// 담은 메뉴id (con 메뉴테이블)
			private int cart_quant;//담은 수량
			private int cart_total;//장바구니물품 금액 소계
	

			//--------Getter/Setter
			
			public String getCust_id() {
				return cust_id;
			}
			public void setCust_id(String cust_id) {
				this.cust_id = cust_id;
			}
			public int getMenu_id() {
				return menu_id;
			}
			public void setMenu_id(int menu_id) {
				this.menu_id = menu_id;
			}
			public int getCart_quant() {
				return cart_quant;
			}
			public void setCart_quant(int cart_quant) {
				this.cart_quant = cart_quant;
			}
			public int getCart_total() {
				return cart_total;
			}
			public void setCart_total(int cart_total) {
				this.cart_total = cart_total;
			}
		
	
			
			
			
			
			
			
	
	
}
