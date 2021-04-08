<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<c:set var="root" value="${pageContext.request.contextPath }/" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>


	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	
	<!-- 본문부 -->

	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
					<!-- 작성하기 누르면 갈곳을 정해주자-->
						<form:form action="${root }board/write_pro?cust_id=${cust_id }" method="post" modelAttribute="reviewBean" enctype="multipart/form-data">
							 <div class="form-group">
								<form:label path="review_subject">제목</form:label>
								 <form:input path="review_subject" class="form-control" />
								 <form:errors path="review_subject" style="color:red"></form:errors>
							</div>
							<div class="form-group">
								<form:label path="review_content">내용</form:label>
								<form:textarea path="review_content"
									class="form-control" rows="10" style="resize: none"></form:textarea>
							<form:errors path="review_content" style="color:red"></form:errors>
							</div>
							<div class="form-group">
								<form:label path="upload_file">첨부 이미지</form:label> 
								<form:input type="file"
									path="upload_file" class="form-control"
									accept="image/*" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<form:button  class="btn btn-primary">작성하기</form:button>
								</div>
							</div>
						<form:hidden path="review_star" value="5"/>
						<form:hidden path="review_img" value="ppap"/>
						</form:form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<!-- 하단 -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />

</body>
</html>
