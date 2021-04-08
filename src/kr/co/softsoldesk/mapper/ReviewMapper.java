package kr.co.softsoldesk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;

import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewContentBean;

public interface ReviewMapper {
	@Select("select /*Index_asc( review.review_num)*/ review.order_num, review.cust_id, review.review_subject, "
			+ "review.review_content, review.review_img, review.review_star, "
			+ "to_char(review.review_date, 'yy-mm-dd') as review_date, "
			+ "orders.menu_id, menu.menu_name "
			+ "from review, orders, menu, store_table "
			+ "where review.order_num=orders.order_num "
			+ "and orders.store_id = store_table.store_id and orders.menu_id=menu.menu_id and orders.store_id=${store_id} "
			+ "order by review.review_num desc")
	List<ReviewContentBean> getAllReviews(int store_id, RowBounds rowBounds);
	
	
	@Select ("select count(*) from review, orders, store_table "
			+ "where review.order_num=orders.order_num "
			+ "and orders.store_id = store_table.store_id and orders.store_id=${store_id}")
	int getReviewCnt(int store_id);
	@Select("select rownum, r.* from review r where cust_id=#{cust_id}")
	List<ReviewBean> getAllReviewsByCustId(String cust_id);
	
	
	
	@Insert("insert into review (review_num,order_num,cust_id,review_subject,review_content,review_img,review_star,review_date) "
			+ "values(review_seq.nextval, #{order_num}, #{cust_id},#{review_subject},#{review_content},#{review_img},#{review_star},SYSDATE + 1)")
	void insertReview(ReviewBean reviewBean);

	
	
}
