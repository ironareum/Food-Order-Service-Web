package kr.co.softsoldesk.beans;

public class OrdersBean {

	 
	 private int order_num ;// 주문번호(시퀀스값 들어올것)
	 private String cust_id; //고객번호(con 고객)
	 private int store_id ;//주문 가게 id(con 가게테이블)
	 private int menu_id ;//주문 메뉴id (con 메뉴테이블)
	 private int order_quant;//주문 수량
	 private String order_req;//요청사항(20자이내)
	 private String order_date ;// 주문일(default sysdate넣을수도)
	 private int total_pmt;//총 결제금액
	 private String order_contact;//주문시 일회성으로 변경할 전화번호
	 private String useAgain;
	 private String  noDisposable;
	 private String menu_name;
	 private String pmt_method;
	 
	 
	 //조인용----------
	 private String store_name;
	
	 
	 public String getPmt_method() {
		return pmt_method;
	}
	public void setPmt_method(String pmt_method) {
		this.pmt_method = pmt_method;
	}

	 
	 
	 
	 
	 

	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getUseAgain() {
		return useAgain;
	}
	public void setUseAgain(String useAgain) {
		this.useAgain = useAgain;
	}
	public String getNoDisposable() {
		return noDisposable;
	}
	public void setNoDisposable(String noDisposable) {
		this.noDisposable = noDisposable;
	}
	
	public String getOrder_contact() {
		return order_contact;
	}
	public void setOrder_contact(String order_contact) {
		this.order_contact = order_contact;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public int getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}
	public int getOrder_quant() {
		return order_quant;
	}
	public void setOrder_quant(int order_quant) {
		this.order_quant = order_quant;
	}
	public String getOrder_req() {
		return order_req;
	}
	public void setOrder_req(String order_req) {
		this.order_req = order_req;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getTotal_pmt() {
		return total_pmt;
	}
	public void setTotal_pmt(int total_pmt) {
		this.total_pmt = total_pmt;
	}

	 
	 
	 

	 
	 
	
	
	
	
	
}
