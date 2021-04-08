package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.ShopBean;

public interface ShopMapper {
	
//	@Select("select * from shops where batchMenu='y' and name like '%#{name}%'")
	@Select("select * from shops")
	public List<ShopBean> selectShopInfo(String name);
	
	
}
