package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.StoreBean;

public interface StoreMapper {
	@Select("select store_id, store_name, store_highway, store_addr, store_phone, store_open, store_close, store_reviewcnt, store_likecnt, store_staravg "
			+ "from store_table "
			+ "where store_name like '%'||#{store_name}||'%'")
	List<StoreBean> getStoreInfoByName(String store_name);

	@Select("select store_id, store_name, store_highway, store_addr, store_phone, store_open, store_close, store_reviewcnt, store_likecnt, store_staravg "
			+ "from store_table "
			+ "where store_highway like '%'||#{store_highway}||'%'")
	List<StoreBean> getStoreInfoByHighway(String store_highway);

	@Select("select store_id, store_name, store_highway, store_addr, store_phone, store_open, store_close, store_reviewcnt, store_likecnt, store_staravg "
			+ "from store_table "
			+ "where store_name= #{marketName}")
	StoreBean getOneStoreInfoByName(String store_name);
	
	@Select("select count(*) from review r, orders o where r.order_num = o.order_num and o.store_id = #{store_id}")
	int getReviewCount(int store_id);
}
