package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartMenuBean;
import kr.co.softsoldesk.dao.MenuDao;

@Service
public class MenuService {
	@Autowired
	MenuDao menuDao;
	
	
	//베스트메뉴 
	public List<MenuBean> getBestMenues(String market_name){
		System.out.println("BestMenu Service: "+market_name);
		return menuDao.getBestMenues(market_name);
	}
	//한식
	public List<MenuBean> getKoreanMenues(String market_name){
		System.out.println("KoreanMenu Service: "+market_name);
		return menuDao.getKoreanMenues(market_name);
	}
	//양식
	public List<MenuBean> getWesternMenues(String market_name){
		System.out.println("WesternMenu Service: "+market_name);
		return menuDao.getWesternMenues(market_name);
	}
	//중식
	public List<MenuBean> getChineseMenues(String market_name){
		System.out.println("ChineseMenu Service: "+market_name);
		return menuDao.getChineseMenues(market_name);
	}
	//신메뉴
	public List<MenuBean> getNewMenues(String market_name){
		System.out.println("NewMenu Service: "+market_name);
		return menuDao.getNewMenues(market_name);
	}
	
//	public String getMenuName(int menu_id) {
//		return menuDao.getMenuName(menu_id);
//	}
	
	public String getMenuImg(MyCartMenuBean myCartMenuBean) {
		return menuDao.getMenuImg(myCartMenuBean);
	}
	
}
