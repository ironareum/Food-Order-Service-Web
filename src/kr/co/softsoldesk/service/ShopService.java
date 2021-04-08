package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ShopBean;
import kr.co.softsoldesk.dao.ShopDao;

@Service
public class ShopService {
	
	@Autowired ShopDao shopDao;
	
	public List<ShopBean> selectShopInfo(String name){
		return shopDao.selectShopInfo(name);
	}
	
}
