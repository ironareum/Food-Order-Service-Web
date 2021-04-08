package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.LikeBean;
import kr.co.softsoldesk.mapper.LikeMapper;

@Repository
public class LikeDAO {

	
	@Autowired
	private LikeMapper likeMapper;
	
	
	
	
	//특정 유저의 모든 찜목록 가져오기
	public List<LikeBean> getAllLikes(String cust_id){
		
		return likeMapper.getAllLikes(cust_id);
	};
	
	
	public void insertLikeTable(LikeBean likeBean) {
		likeMapper.insertLikeTable(likeBean);
	}
	
	public void deleteLikeTable(LikeBean likeBean) {
		likeMapper.deleteLikeTable(likeBean);
	}
	
}
