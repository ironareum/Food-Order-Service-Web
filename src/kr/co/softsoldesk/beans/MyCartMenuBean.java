package kr.co.softsoldesk.beans;

public class MyCartMenuBean {
	
	private String store_name;
	private int menu_price;
	private int menu_count; 
	private String menu_name;
	private String menu_img;
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	private int rownum;
	
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
	
	
	public String getStore_name() {
		return store_name;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
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
	
	
	
}
