package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartMenuBean;
import kr.co.softsoldesk.mapper.MenuMapper;

@Repository
public class MenuDao {
	@Autowired
	MenuMapper menuMapper;
	
	
	//베스트메뉴 
	public List<MenuBean> getBestMenues(String market_name){
		//System.out.println("BestMenu Dao: "+market_name);
		return menuMapper.getBestMenues(market_name);
	}
	
	//한식
	public List<MenuBean> getKoreanMenues(String market_name){
		//System.out.println("KoreanMenu Dao: "+market_name);
		return menuMapper.getKoreanMenues(market_name);
	}
	
	//양식
	public List<MenuBean> getWesternMenues(String market_name){
		//System.out.println("WesternMenu Dao: "+market_name);
		return menuMapper.getWesternMenues(market_name);
	}
	
	//중식
	public List<MenuBean> getChineseMenues(String market_name){
		//System.out.println("ChineseMenu Dao: "+market_name);
		return menuMapper.getChineseMenues(market_name);
	}
	
	//신메뉴 
	public List<MenuBean> getNewMenues(String market_name){
		//System.out.println("NewMenu Dao: "+market_name);
		return menuMapper.getNewMenues(market_name);
	}
	
//	public String getMenuName(int menu_id) {
//		return menuMapper.getMenuName(menu_id);
//	}
	
	public String getMenuImg(MyCartMenuBean myCartMenuBean) {
		return menuMapper.getMenuImg(myCartMenuBean);
	}
	
}
