<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap css v5.0 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/style_main.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="container loginBackground" style="align-items: center;">

				<div class="card shadow" style="border-radius:25px; margin: auto; max-width:500px;">
					<div class="card-body">


						<c:if test="${fail==true}">
							<!-- 로그인 실패 -->
							<div class="alert alert-danger">
								<h3>로그인 실패</h3>
								<p>아이디 비밀번호를 확인해주세요</p>
							</div>
						</c:if>
						<form:form action="${root }Customer/login_pro" method="post"
							modelAttribute="tempLoginCustomerBean">
							<div style="background-color: var(--green-dark); text-align: center; border-radius:25px;">
								<span><img class="logoImg" src="${root}image/logo/logo_ver.png" alt="" style="width:200px; "/></span>
							</div>
							<br />
							<div class="form-group">
								<form:label path="cust_id">아이디</form:label>
								<form:input path="cust_id" class="form-control" />
								<%-- <form:errors path="cust_id" style='color:red' /> --%>
							</div>
							<div class="form-group">
								<form:label path="cust_pw">비밀번호</form:label>
								<form:password path="cust_pw" class="form-control" />
								<%-- <form:errors path="cust_pw" style='color:red' /> --%>
							</div>
							<div class="form-group text-right">
								<form:button type="submit" class="btn btn-success">로그인</form:button>
								<a href="${root }Customer/new" class="btn btn-success">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>


	<!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />

</body>
</html>