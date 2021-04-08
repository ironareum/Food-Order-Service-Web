package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.MenuBean;
import kr.co.softsoldesk.beans.MyCartMenuBean;

public interface MenuMapper {
	
	
	//베스트 메뉴 
	@Select("select menu_name, menu_price, menu_content, menu_img, menu_category "
			+ "from menu "
			+ "where store_name = #{marketName} and menu_best=1")
	List<MenuBean> getBestMenues(String marketName);
	

	//한식메뉴  
	@Select("select menu_name, menu_price, menu_content, menu_img "
			+ "from menu "
			+ "where store_name = #{marketName} and menu_category='한식'")
	List<MenuBean> getKoreanMenues(String marketName);
	
	//양식메뉴  
	@Select("select menu_name, menu_price, menu_content, menu_img "
			+ "from menu "
			+ "where store_name = #{marketName} and menu_category='양식'")
	List<MenuBean> getWesternMenues(String marketName);

	//중식메뉴  
	@Select("select menu_name, menu_price, menu_content, menu_img "
			+ "from menu "
			+ "where store_name = #{marketName} and menu_category='중식'")
	List<MenuBean> getChineseMenues(String marketName);
	
	//신메뉴  
	@Select("select menu_name, menu_price, menu_content, menu_img, menu_category "
			+ "from menu "
			+ "where store_name = #{marketName} and menu_new=1")
	List<MenuBean> getNewMenues(String marketName);
	
//	//메뉴이름
//	@Select("select menu_name from menu where menu_id =7")
//	String getMenuName(int menu_id);
	
	//메뉴이미지 가져오기
	@Select("select menu_img from menu where store_name = #{store_name} and menu_name=#{menu_name}")
	String getMenuImg(MyCartMenuBean myCartMenuBean);
}
