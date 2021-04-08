<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
       
       <link rel="stylesheet" type="text/css" href="${root }css/style.css">
       

<style>
@import
	url("https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap")
	;

body {
	background: #EFF1F3;
	min-height: 100vh;
	position: relative;
}

.section-50 {
	padding: 50px 0;
}

.m-b-50 {
	margin-bottom: 50px;
}

.dark-link {
	color: #333;
}

.heading-line {
	position: relative;
	padding-bottom: 5px;
}

.heading-line:after {
	content: "";
	height: 4px;
	width: 75px;
	background-color: #003d00;
	position: absolute;
	bottom: 0;
	left: 0;
}

.notification-ui_dd-content {
	margin-bottom: 30px;
}

.notification-list {
	display: flex;
	justify-content: space-between;
	padding: 20px;
	margin-bottom: 7px;
	width: 715px;
	background: #fff;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.06);
}

.notification-list .notification-list_content {
	display: flex;
}

.notification-list .notification-list_content .notification-list_img img
	{
	height: 100px;
	width: 85px;
	border-radius: 50px;
	margin-right: 30px;
}

.notification-list .notification-list_content .notification-list_detail p
	{
	margin-bottom: 5px;
	line-height: 1.2;
}

@import
	url("https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap")
	;

body {
	background: #f9f9f9;
	font-family: "Roboto", sans-serif;
}

.main-content {
	padding-top: 100px;
	padding-bottom: 100px;
}

.m-r-5 {
	margin-right: 5px;
}

.box {
	margin-bottom: 25px;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 5px 30px -5px rgba(0, 0, 0, 0.1);
	width: 715px;
}

.box__header {
	padding: 20px;
	border-bottom: 1px solid #ddd;
}

.box__header h1, .box__header h2, .box__header h3, .box__header h4,
	.box__header h5, .box__header h6 {
	margin-bottom: 0;
}

.box__body {
	padding: 20px;
}

.timeline__row {
	display: flex;
	position: relative;
}

.timeline__row_icon {
	width: 30px;
	margin-right: 20px;
	z-index: 1;
}

.timeline__row_content {
	width: calc(100% - 1px);
	margin-bottom: 20px;
	display: none;
}

.timeline__row_content .badge {
	margin-bottom: 10px;
}

.timeline__row_content_desc {
	padding: 15px;
	border-radius: 5px;
	background: #fff;
	box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1);
}

.timeline__row_content .timeline__row_content_desc .timeline__row_content_img img
	{
	height: 100px;
	width: 100px;
	border-radius: 7px;
	margin-right: 30px;
	position: relative;
}

.timeline__row:nth-last-child(1) .timeline__row_content {
	border: none;
	padding-bottom: 0;
	margin-bottom: 10px;
}

.timeline__row:nth-last-child(1):before {
	height: 0;
}

:root {
	/* Color */ -
	-white-color: #fff; -
	-black-color: #140a00; -
	-blue-color: #045fd4; -
	-red-color: #ff0000; -
	-grey-dark-color: #909090; -
	-grey-light-color: #e0e0e0; -
	-wine-dark: #793d34; -
	-peach: #e8a45d; -
	-pink-peach: #ff9e80; -
	-pink-peach-dark: #c96f53; -
	-pink-peach-light: #ffd0b0;
	/*   --green-dark: #003d00; 
  --green-primary: #33691e;
  --green-light: #629749; 
  --yellowgreen-primary: #fdd835;
  --yellowgreen-dark: #c6a700;
  --yellowgreen-light: #ffff6b;*/ -
	-green-dark: #003d00; -
	-green-primary: #33691e; -
	-green-light: #629749; -
	-yellowgreen-primary: #fdd835;
	—yellowgreen-dark: #c6a700;
	—yellowgreen-light: #ffff6b;
	/* Size */
	—padding: 12px;
	—padding-big: 15px;
	—avartar-size: 36px;
	—menuImg-size: 180px;
	/* Font Size */
	—font-large: 18px;
	—font-medium: 14px;
	—font-small: 12px;
	—font-micro: 10px;
}

.nav.flex-column.nav-pills .nav-link.active {
	background-color: #003d00;
	color: #629749;
}

.nav.flex-column.nav-pills .nav-link {
	color: #629749;
}

.nav.flex-column.nav-pills .nav-link:hover {
	background-color: #003d00;
	color: #629749;
}

.profile-tab-nav .border-right {
	color: #629749;
}

.notification-list, .box__body, .box_header, .box, #myReview {
	width: 900px;
}
</style>

<!-- 아름이꺼 -->
<!-- Bootstrap css v5.0 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/style_main.css" />
</head>
<body>
	
	<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	
	<section class="py-3 my-5">
	
	
		<div class="container">
			
			<div class="bg-white shadow rounded-lg d-block d-sm-flex">
				
				<div class="profile-tab-nav border-right" > <!-- style="width: 35%;" -->
					
					
					
					
					
					<div class="p-4">
						<div class="img-circle text-center mb-3" >
							<p style="width:100px; height:100px; margin:auto; color:var(—green-dark);">
							<!-- <i class="fas fa-user-circle fa-7x" ></i> -->
							<img src="${root }upload/${content_file}" width="100%" />
							</p>
								
						</div>
						<h3 class="text-center" >${cust_name } 님</h3>
					</div>
					
					<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						<a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true" >
							<i class="fa fa-user text-center mr-1"></i> 
							나의 정보
						</a>
						
						<a class="nav-link" id="orderlist-tab" data-toggle="pill" href="#orderlist" role="tab" aria-controls="orderlist" aria-selected="false" >
							<i class="fa fa-edit text-center mr-1"></i> 
							주문 내역
						</a>
						
						<a class="nav-link" id="favorite-tab" data-toggle="pill" href="#favorite" role="tab" aria-controls="favorite" aria-selected="false">
							<i class="fa fa-heart text-center mr-1"></i> 
							찜한 휴게소
						</a>
						<a class="nav-link" id="myReview-tab" data-toggle="pill" href="#myReview" role="tab" aria-controls="notification" aria-selected="false">
							<i class="fa fa-comment text-center mr-1"></i> 
							리뷰 관리
						</a>
						
						
						
						
					</div>
				</div>
				
				
				
				
				
				<div class="tab-content p-5 p-md-5" id="v-pills-tabContent">
					<div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
							<form:form action="${root}Customer/modify/customerModify" modelAttribute="modifyCustomerInfoBean" method="post" enctype="multipart/form-data">
						<h4 class="mb-4">나의 정보 수정</h4>
						<div class="row">
						
						
							
							<div class="col-md-12">	
							<div class="form-group">
							<form:label path="cust_id">아이디</form:label>
							<form:input path="cust_id" value="${cust_id }"
										placeholder="${cust_id }" disabled="true"
										class="form-control" />
							<form:errors path="cust_id" />			
							</div>		
							</div>
			
							
							<form:hidden path="cust_pw" value="${cust_pw }"></form:hidden>
							
							<div class="col-md-12">	
							<div class="form-group">
							<label for="cust_modifyPW">비밀번호</label>
							<form:password path="cust_modifyPW" class="form-control"  />
							<form:errors path="cust_modifyPW" style="color:red"/>		
							</div>
							</div>
							
							<div class="col-md-12">	
							<div class="form-group">
							<label for="cust_modifyPW">비밀번호 확인</label>
							<form:password path="cust_modifyPW2" class="form-control"  />
							<form:errors path="cust_modifyPW2" style="color:red"/>		
							</div>
							</div>
							
	
								
							<div class="col-md-12">
									<div class="form-group">
											<form:label path="cust_name">이름</form:label>
											<form:input path="cust_name" value="${cust_name}"
													 	class="form-control" />
											<form:errors path="cust_name" style="color:red"/>
									</div>
							</div>	
						
							<div class="col-md-12">
									<div class="form-group">
										<form:label path="cust_phone">휴대폰번호</form:label>
										<form:input path="cust_phone" value="${cust_phone}"
													id="phone" class="form-control"
													onkeydown="limitKey(event);" />
										<form:errors path="cust_phone" style="color:red"/>
									</div>
							</div>
					
						
							<div class="col-md-12">
									<div class="form-group">
											<form:label path="cust_modifyEmail">이메일</form:label>
											<form:input path="cust_modifyEmail" value="${cust_email}"
														class="form-control phone" />
											<form:errors path="cust_modifyEmail" style="color:red" />
									</div>
							</div>

							<div class="col-md-12">
									<div class="form-group">
										<form:label path="cust_nickname">별명</form:label>
										<form:input path="cust_nickname" class="form-control"
													value="${cust_nickname }" />
										<form:errors path="cust_nickname" style="color:red" />
									</div>
							</div>
							
							<div class="col-md-12">		
						<div class="form-group">
								<label for="upload_file">프로필 이미지</label>
								<c:if test="${content_file != null }"><!-- modifyCustomerInfoBean.content_file -->
									<img src="${root }upload/${content_file}"width="30%" />
									<!-- 수정시 첨부파일 이미지 파일 변경없이 유지하도록 form태그에 담아둠-->
									<form:hidden path="content_file" />
								</c:if>
								<form:input path="upload_file" type='file' class="form-control" accept="image/*" />
							</div>
						
						</div>
							
							<!-- 
							<div class="col-md-12">
								<div class="form-group">
								  	<label>Bio</label>
									<textarea class="form-control" rows="4">Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore vero enim error similique quia numquam ullam corporis officia odio repellendus aperiam consequatur laudantium porro voluptatibus, itaque laboriosam veritatis voluptatum distinctio!</textarea>
								</div>
							</div>
						 -->
					
						<div style="width:25%; margin:0 auto ;">
							<button type="submit" class="btn btn-success btn-space"> 완료</button>
							<button type="reset" class="btn btn-light"> 취소 </button>
						</div>
				
						
				
						</div>
						</form:form>
					</div>
			
					
					
					
					
					<div class="tab-pane fade" id="orderlist" role="tabpanel" aria-labelledby="orderlist-tab">
						
								
				<div class="notification-ui_dd-content">
				
				<c:forEach var="obj" items="${getAllOrders }">
					<div class="notification-list">
						<div class="notification-list_content">
						<div class="notification-list_detail">
						<p><small> ${obj.order_date }</small></p>
							<p><b>${obj.store_name }</b> </p>
							<p class="text-muted"><small>${obj.menu_name }</small></p>
							<button class="btn  btn-light" onclick="location.href='${root}board/write?num=${obj.order_num }'"><i class="fa fa-pencil text-center mr-1"></i> 리뷰 쓰기</button>&nbsp; 
							<button class=" btn btn-light" onclick="location.href='${root }shop/ea?market_name=${obj.store_name }'"><i class="fa fa-road text-center mr-1" ></i>휴게소 보기</button>&nbsp; 
							<!-- <button class="btn  btn-light "><i class="fa fa-window-restore text-center mr-1"></i>주문 상세</button>&nbsp; -->
						
							</div>
						</div>	
					</div>
				</c:forEach>			
				
			</div>

			<div class="text-center">
				<a href="#!"  style="text-decoration:none; color:var(--green-dark); "  >주문내역 더보기</a>
			</div>
			
			</div>
						
						
						
						
						
						
		<!--  찜한 가게  -->
					
					
					
					<div class="tab-pane fade" id="favorite" role="tabpanel" aria-labelledby="application-tab">
						<div class="notification-ui_dd-content">
				
				<c:forEach var="obj" items="${getAllLikes}">
				<div class="notification-list">
					<div class="notification-list_content">
					<div class="notification-list_img" style="margin-right:10px; display:flex; flex-direction:column; color:var(--green-dark);">
							<i class="fas fa-store fa-3x"></i>
						</div>
									
						<div class="notification-list_detail">
						<a href="#!" style="text-decoration:none" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" >
								<small class="font-weight-bold" style="color:var(--green-dark);">${obj.store_highway}</small>
							</a>
							<p><b>${obj.store_name}</b> </p>
							
							<h3 class="text-muted pl-3" style="padding-left:0px;">
								내가 찜했다!
							</h3>
						</div>
					</div>	
				</div>
				</c:forEach>
				
				
					

			<div class="text-center">
				<a href="#!"  style="text-decoration:none; color:var(--green-dark);" >나의 찜 더보기</a>
			</div>
			</div>
					
			</div>
					
					
					<!-- 리뷰 리스트 탭  -->
					
					<div class="tab-pane fade" id="myReview" role="tabpanel" aria-labelledby="notification-tab">
						
						
				<div class="col-xs-9 offset-xs-3 " >
					<div class="box">
						<div class="box__header">
							<h5><i class="fa fa-clock-o m-r-5" aria-hidden="true"></i> 내가 쓴 리뷰 </h5>
						</div>
						<div class="box__body">
							<div class="timeline">
						
						
						<c:forEach var='obj' items='${getAllReviews}'>
									<div class="timeline__row_content">
										<span class="badge badge-curved badge-success">${obj.review_date}</span>
										<div class="timeline__row_content_desc">
								      					
											<h3><b>${obj.store_name }</b></h3>
										   <h5><b>제목 : ${obj.review_subject}</b></h5>
										   <h7><b>주문한 메뉴 : ${obj.menu_name}</b></h7>
										   	   <p><b>내가 준 별점 : ${obj.review_star} 점 </b>
										   	   <c:forEach var="number" begin="1" end="${obj.review_star}">
										   	   <span><img src="${root }image/star-on.png"/></span>
										   	   </c:forEach>
										   	   </p>
									       
									       <!--<c:if test="${obj.review_img!=null }">-->
									        <div class="timeline__row_content_img">
									       	<img src="${root}upload/${obj.review_img}" alt="review_img" width="200" height="200" color="var(--green-dark)">
						                  	</div> 
										  	<!--</c:if>-->                
										  <hr /> 					                  	
						                   											
											<p>${obj.review_content}</p>
											
											 <!-- 로그인회원과 리뷰작성자가 같을 시에 삭제할 수 있게. 없어도될지도? -->
											 	
											<a href="${root }review/delete?review_num=${obj.rownum}&tab=review" style="text-decoration:none" class="delete_review text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" >
								             <small class="font-weight-bold" style="color:var(--green-dark);">삭제</small></a>
								          
										</div>
									</div>
									</c:forEach>	
								
								
								
								
								
								
								
								
							</div>
						</div>
					</div>
				</div>
						
						
						
						
						
			<div class="text-center">
				<a href="#!"  style="text-decoration:none; color:var(--green-dark);"  id="load_review" >나의 리뷰 더보기</a>
			</div>
						
						
					</div>
					
					
					
				</div>
			</div>
		</div>
		
	</section>

	<!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	
		<!-- 아름이꺼 -->
	<!-- Bootstrap CDN -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<!-- js v5.0 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/2d323a629b.js"
		crossorigin="anonymous"></script>
	
<!-- script : 리뷰 더보기 버튼 구현 -->

<script>
$(function(){
	$(".timeline__row_content").slice(0,3).show(); //최초 0,1,2 세개 선택
	$("#load_review").click(function(e){
	e.preventDefault();
	$(".timeline__row_content:hidden").slice(0,3).show();//숨김설정된다음, 다음 3개
     if($(".timeline__row_content:hidden").length==0){
    	 
    	 $('#load_review').css('display','none');//더이상 로드할 항목이 없는경우
     }		
	});
	
//찜한 휴게소로 들어올시..
if('${tab}' == 'like'){

	$(".flex-column").find(".nav-link").find('i').each(function (index, item){
		if($(item).is(".fa-heart")){
			//a태그일떄는 이렇게 한다
			$(item).parent('.nav-link').get(0).click();
		}
	})
}else if('${tab}' == 'review'){

	$(".flex-column").find(".nav-link").find('i').each(function (index, item){
		if($(item).is(".fa-comment")){
			//a태그일떄는 이렇게 한다
			$(item).parent('.nav-link').get(0).click();
		}
	})
}else if('${tab}' == 'edit'){

	$(".flex-column").find(".nav-link").find('i').each(function (index, item){
		if($(item).is(".fa-edit")){
			//a태그일떄는 이렇게 한다
			$(item).parent('.nav-link').get(0).click();
		}
	})
}		
	
	
});

	


	
	</script>
	



	
</body>
</html>