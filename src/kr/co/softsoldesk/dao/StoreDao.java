package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.StoreBean;
import kr.co.softsoldesk.mapper.StoreMapper;
@Repository
public class StoreDao {
	
	@Autowired
	StoreMapper marketMapper;
	
	public List<StoreBean> getStoreInfoByName(String store_name) {
		//System.out.println("marketDao"+ store_name);
		return marketMapper.getStoreInfoByName(store_name);
	}
	public List<StoreBean> getStoreInfoByHighway(String store_highway) {
		//System.out.println("marketDao"+ store_highway);
		return marketMapper.getStoreInfoByHighway(store_highway);
	}
	
	public StoreBean getOneStoreInfoByName(String store_name) {
		return marketMapper.getOneStoreInfoByName(store_name);
	}
	
	public int getReviewCount(int store_id) {
		return marketMapper.getReviewCount(store_id);
	}
	
	
	
}
