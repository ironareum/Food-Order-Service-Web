package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.softsoldesk.beans.LikeBean;

public interface LikeMapper {

	
	@Select("select s.store_highway, s.store_name "
			+ "from store_table s, like_table l "
			+ "where s.store_id=l.store_id "
			+ "and l.cust_id=#{cust_id}")
	List<LikeBean> getAllLikes(String cust_id);
	
	@Insert("insert into like_table(like_num, cust_id, store_id) "  
			+ "values(like_seq.nextval, #{cust_id}, #{store_id})")
	public void insertLikeTable(LikeBean likeBean);
			
	@Delete("delete from like_table where cust_id=#{cust_id}")
	public void deleteLikeTable(LikeBean likeBean);
	
	
	
}
