package kr.co.softsoldesk.beans;

public class MyCartBean {
	
	private int rownum;
	private String menu_name; 
	private int menu_price;
	private int menu_count;
	private int store_id;
	
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_count() {
		return menu_count;
	}
	public void setMenu_count(int menu_count) {
		this.menu_count = menu_count;
	}

}
