package kr.co.softsoldesk.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewContentBean;
import kr.co.softsoldesk.mapper.ReviewMapper;

@Repository
public class ReviewDao {
	@Autowired
	ReviewMapper reviewMapper;
	
	public List<ReviewContentBean> getAllReviews(int store_id, RowBounds rowBounds){
		return reviewMapper.getAllReviews(store_id, rowBounds);
	}
	
	public int getReviewCnt(int store_id) {
		return reviewMapper.getReviewCnt(store_id);
	}
	public List<ReviewBean> getAllReviewsByCustId(String cust_id){
		return reviewMapper.getAllReviewsByCustId(cust_id);
	}
	
	public void insertReview(ReviewBean reviewBean) {
		reviewMapper.insertReview(reviewBean);
	}
}
