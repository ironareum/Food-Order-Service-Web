package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.LikeBean;
import kr.co.softsoldesk.dao.LikeDAO;

@Service
public class LikeService {

	@Autowired
	private LikeDAO likeDAO;

	
	
	// 특정 유저의 모든 찜목록 가져오기
	public List<LikeBean> getAllLikes(String cust_id) {

		return likeDAO.getAllLikes(cust_id);
	};

	public void insertLikeTable(LikeBean likeBean) {
		likeDAO.insertLikeTable(likeBean);
	}
	
	public void deleteLikeTable(LikeBean likeBean) {
		likeDAO.deleteLikeTable(likeBean);
	}
	
}
