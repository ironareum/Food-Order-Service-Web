package kr.co.softsoldesk.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ReviewContentBean;
import kr.co.softsoldesk.beans.ReviewPageBean;
import kr.co.softsoldesk.dao.ReviewDao;

@Service 
@PropertySource("/WEB-INF/properties/option.properties")
public class ReviewService {
	@Autowired
	ReviewDao reviewDao;
	
	@Value("${page.listcnt}")
	private int page_listcnt;

	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	@Value("${path.upload}")
	private String path_upload;

	// 로그인 세션정보도 잡아와야함.
	@Resource(name = "loginCustBean")
	private CustomerBean loginUserBean;
	
	
	public List<ReviewContentBean> getAllReviews(int store_id, int page){
		int start = (page-1)* page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return reviewDao.getAllReviews(store_id, rowBounds);
	}
	
	public ReviewPageBean getReviewCnt(int store_id, int currentPage) {
		System.out.println("currentPage: " + currentPage);
		
		int reviewCnt= reviewDao.getReviewCnt(store_id);
		
		ReviewPageBean reviewBean = new ReviewPageBean(reviewCnt, currentPage, page_listcnt, page_paginationcnt);
//		System.out.println("bean에 찍힌 이전페이지: "+ reviewBean.getPrePage());
//		System.out.println("bean에 찍힌 현재페이지: "+ reviewBean.getCurrentPage());
//		System.out.println("bean에 찍힌 다음페이지: "+ reviewBean.getNextPage());
//		System.out.println("bean에 찍힌 min: "+ reviewBean.getMin());
//		System.out.println("bean에 찍힌 max: "+ reviewBean.getMax());
		return reviewBean;
	}
	
	public List<ReviewBean> getAllReviewsByCustId(String cust_id){
		return reviewDao.getAllReviewsByCustId(cust_id);
	}
	public void insertReview(ReviewBean reviewBean) {
		reviewDao.insertReview(reviewBean);
	}
	private String saveUploadFile(MultipartFile upload_file) {

		// 중복되는 파일명이 있을 수 있기때문에, 밀리초단위의 현재시간과 Raw파일이 제공하는 파일네임(getName으로 알수있음)을 합쳐서,
		// 중복되지않도록한다.
		// getOriginalname을 하면, 업로드된 파일이 원래 위치하고 있던 곳의 주소가 붙어온다.
		String file_name = System.currentTimeMillis() + "_" + upload_file.getName();

		// =====cf) 52번의 경로 오류시 솔루션
		/*
		 * String file_name = System.currentTimeMillis() + "_" +
		 * FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "." +
		 * FilenameUtils.getExtension(upload_file.getOriginalFilename());
		 */

		try {

			// write.jsp에서 인풋타입이 file이기때문에, file타입으로 Raw데이터가 변환되어야한다.
			// 괄호안 : file객체를 만드는데, 뒤에 온 String을 경로로 잡는 file을 만든것.
			upload_file.transferTo(new File(path_upload + "/" + file_name));

		} catch (Exception e) {
			e.printStackTrace();
		}

		// try문안에서 임시파일을 업로드처리해놓고, 시간을 붙여 ReName한 주소를 리턴한다.
		return file_name;

	}

	// ================ 컨텐츠 추가 =====================================

	public void addContentInfo(ReviewBean writeReviewBean) {

		/*
		 * 데이터 잘 넘어오는지 확인 System.out.println(writeContentBean.getContent_subject());
		 * //게시글 이름 System.out.println(writeContentBean.getContent_text()); //게시글 내용
		 * System.out.println(writeContentBean.getUpload_file().getSize()); //첨부이미지 사이즈
		 */

		MultipartFile upload_file = writeReviewBean.getUpload_file(); // Raw File의 정보를 ContentBean에 가서 물어온다.

		// 첨부파일이 있으면(0아니면) 저장해라.
		if (upload_file.getSize() > 0) {

			// 업로드한 Rawfile길이가 0 이 아니면, 위의 saveUploadFile메서드 돌려서, 중복을 제거한 file_name에 저장한다.
			String file_name = saveUploadFile(upload_file);
			System.out.println(file_name);

			// 첨부파일 호출. DB에 집어넣을때, 위에서 가공한 String 파일 이름을 세팅해서 집어넣음.
			writeReviewBean.setReview_img(file_name);

		}
		// 이제 저장할건데, 세션으로부터 로그인정보를 가져와서, 누가 썼는지 인덱스번호(가입할때마다 시퀀스번호생성되는것) 가져와서 세팅한다.
		// 어느 유저가 글인지를 확인해서, 맞으면 수정/삭제시키려한다. 계속 끌고다녀야함.
		//writeReviewBean.setContent_write_idx(5);
		reviewDao.insertReview(writeReviewBean);

	}
	
}
