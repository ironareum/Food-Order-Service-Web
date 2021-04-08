package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ContentBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.mapper.BoardMapper;

@Repository
public class BoardDao {
	
	@Autowired
	private BoardMapper boardMapper;
	
	public void addContentInfo(ReviewBean writeReviewBean) {
		//리턴값없으니 여기서 sql문 결과물 보면됨. 
		boardMapper.addContentInfo(writeReviewBean);
	}
	public String getBoardInfoName(int board_info_idx) {
		return boardMapper.getBoardInfoName(board_info_idx);
	}

	public List<ContentBean> getContentList(int board_info_idx){
		return boardMapper.getContentList(board_info_idx);
	}
	
	public ContentBean getContentInfo(int content_idx){
		
		return boardMapper.getContentInfo(content_idx);
	}

	
}

