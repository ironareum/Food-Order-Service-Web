package kr.co.softsoldesk.service;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.softsoldesk.beans.CustomerBean;
import kr.co.softsoldesk.dao.CustomerDAO;

@Service
public class CustomerService {
	
	// option.properties 에 있는, path.upload 뒤의 경로값을 가져와서 path_upload에 저장한다.
			@Value("${path.upload}")
			private String path_upload;

		
	
	

	@Autowired
	private CustomerDAO customerDAO;
	//루트에 올려논 애 
	@Resource(name = "loginCustBean")
	private CustomerBean loginUserBean;

	//================= 회원 가입 =========
	

	// MultipartFile객체의 transferTo(File f) 메서드를 이용해서 업로드처리를 해야 한다.

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

		public void insertCustomer(CustomerBean bean) {

			/*
			 * 데이터 잘 넘어오는지 확인 System.out.println(writeContentBean.getContent_subject());
			 * //게시글 이름 System.out.println(writeContentBean.getContent_text()); //게시글 내용
			 * System.out.println(writeContentBean.getUpload_file().getSize()); //첨부이미지 사이즈
			 */

			MultipartFile upload_file = bean.getUpload_file(); // Raw File의 정보를 ContentBean에 가서 물어온다.

			// 첨부파일이 있으면(0아니면) 저장해라.
			if (upload_file.getSize() > 0) {

				// 업로드한 Rawfile길이가 0 이 아니면, 위의 saveUploadFile메서드 돌려서, 중복을 제거한 file_name에 저장한다.
				String file_name = saveUploadFile(upload_file);
				System.out.println(file_name);

				// 첨부파일 호출. DB에 집어넣을때, 위에서 가공한 String 파일 이름을 세팅해서 집어넣음.
				bean.setContent_file(file_name);
				// 이제 저장할건데, 세션으로부터 로그인정보를 가져와서, 누가 썼는지 인덱스번호(가입할때마다 시퀀스번호생성되는것) 가져와서 세팅한다.
				// 어느 유저가 쓴글인지를 확인해서, 맞으면 수정/삭제시키려한다. 계속 끌고다녀야함.
				//writeConean.setContent_write_idx(loginUserBean.getUser_idx());
				customerDAO.insertCustomer(bean);

			}

		};
	
	
	
	
	
	
	
	
	
	// --------------------------------------------
	/*
	 * public void insertCustomer(CustomerBean bean) {
	 * customerDAO.insertCustomer(bean); }
	 */
	// ----------------------------------------
	public boolean CheckCustIDExist(String cust_id) {

		String cust_nickname = customerDAO.checkCustIdExist(cust_id);
		System.out.println(cust_nickname);
		if (cust_nickname == null) {
			return true; // 가입가능
		}
		return false; // 가입불가능 (ID중복)
	}

	// --------------------------------------Login
	public void getLoginCustomerInfo(CustomerBean tempLoginBean) {
		CustomerBean temp2 = customerDAO.getLoginCustomerInfo(tempLoginBean);

		if (temp2 != null) {
			
					
			
			loginUserBean.setCust_num(temp2.getCust_num());
			loginUserBean.setCust_id(temp2.getCust_id());
			loginUserBean.setCust_name(temp2.getCust_name());
			loginUserBean.setCust_email(temp2.getCust_email());
			loginUserBean.setCust_nickname(temp2.getCust_nickname());
			loginUserBean.setCust_phone(temp2.getCust_phone());
			loginUserBean.setContent_file(temp2.getContent_file());
			loginUserBean.setCust_login(true);
			System.out.println("(서비스)로그인 true 주입완료: " + loginUserBean.isCust_login());
		}
		//System.out.println(loginBean.isCust_login());
	}

	// 회원정보 수정
	public void modifyCustomerInfo(CustomerBean modifyCustomerInfoBean) {
		// num은 입력받을 수 없기 때문에 세션에 올라가 있는 정보를 불러온다.
		System.out.println(modifyCustomerInfoBean.getCust_id());
		System.out.println(modifyCustomerInfoBean.getCust_name());
		modifyCustomerInfoBean.setCust_num(loginUserBean.getCust_num());
		
		// 첨부파일에 대한 처리
				// 업데이트를 안했다면, modify 폼에 있는 첨부파일밑에 붙여놓은 hidden 을 이용해서, 기존의 첨부파일가져간다
				MultipartFile upload_file = modifyCustomerInfoBean.getUpload_file();

				if (upload_file.getSize() > 0) { // upload가 있다면
					String file_name = saveUploadFile(upload_file);
					modifyCustomerInfoBean.setContent_file(file_name);
				}

		
		
		
		customerDAO.modifyCustomerInfo(modifyCustomerInfoBean);
	}

	// 회원정보 수정시 비밀번호 확인
	public boolean modifyCheckPW(CustomerBean modifyCheckBean) {
		if (customerDAO.modifyCheckPW(modifyCheckBean) != null) {
			return true; // 비밀번호 일치
		}
		return false; // 비밀번호 불일치
	}
	
	public CustomerBean getCustomerInfo(String cust_id) {
		return customerDAO.getCustomerInfo(cust_id);
	}

}
