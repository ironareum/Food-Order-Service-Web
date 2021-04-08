package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ShopBean;
import kr.co.softsoldesk.mapper.ShopMapper;

@Repository
public class ShopDao {
	
	@Autowired
	ShopMapper shopMapper;
	
	public List<ShopBean> selectShopInfo(String name){
		return shopMapper.selectShopInfo(name);
	}
}
