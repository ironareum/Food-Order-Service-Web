package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.dao.StoreDao;

@Service
public class StoreService {
	@Autowired
	StoreDao marketDao;
	
	public List<StoreBean> getStoreInfoByName(String store_name) {
		return marketDao.getStoreInfoByName(store_name);
	}
	
	public List<StoreBean> getStoreInfoByHighway(String store_highway) {
		return marketDao.getStoreInfoByHighway(store_highway);
	}

	public StoreBean getOneStoreInfoByName(String store_name) {
		return marketDao.getOneStoreInfoByName(store_name);
	}
	
	public int getReviewCount(int store_id) {
		return marketDao.getReviewCount(store_id);
	}
}
