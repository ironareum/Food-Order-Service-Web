package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.RequestScope;

@Component
@RequestScope
public class StoreBean {
	
	@NotBlank
	private String searchKeyword;
	//
	private int store_id;
	private String store_name;
	private String store_highway;
	private String store_addr;
	private String store_phone;
	private String store_open;
	private String store_close;
	private int store_reviewcnt;
	private int store_likecnt;
	private float store_staravg;
	
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getStore_highway() {
		return store_highway;
	}
	public void setStore_highway(String store_highway) {
		this.store_highway = store_highway;
	}
	public String getStore_addr() {
		return store_addr;
	}
	public void setStore_addr(String store_addr) {
		this.store_addr = store_addr;
	}
	public String getStore_phone() {
		return store_phone;
	}
	public void setStore_phone(String store_phone) {
		this.store_phone = store_phone;
	}
	public String getStore_open() {
		return store_open;
	}
	public void setStore_open(String store_open) {
		this.store_open = store_open;
	}
	public String getStore_close() {
		return store_close;
	}
	public void setStore_close(String store_close) {
		this.store_close = store_close;
	}
	public int getStore_reviewcnt() {
		return store_reviewcnt;
	}
	public void setStore_reviewcnt(int store_reviewcnt) {
		this.store_reviewcnt = store_reviewcnt;
	}
	public int getStore_likecnt() {
		return store_likecnt;
	}
	public void setStore_likecnt(int store_likecnt) {
		this.store_likecnt = store_likecnt;
	}
	public float getStore_staravg() {
		return store_staravg;
	}
	public void setStore_staravg(int store_staravg) {
		this.store_staravg = store_staravg;
	}
	
	
	
	
}

