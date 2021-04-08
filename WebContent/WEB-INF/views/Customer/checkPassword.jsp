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
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

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

	<%-- <!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" /> --%>
	<div
		style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
		<div style="max-width: 500px; margin: 200px auto;"
			class="shadow p-3 mb-5 bg-body rounded ">

			<h1>확인을 위해 패스워드를 입력 하여 주십시오.</h1>
			<form:form action="${root}Customer/modify/modifyPro?tab=${tab }"
				modelAttribute="modifyCustomerInfoBean" method="post">
				<form:password path="cust_pw" class="form-control" />
				<form:button type="submit" class="btn btn-success">확인</form:button>
				<form:button onclick="location.href='${root}Customer/modify/access'"
					class="btn btn-success">취소</form:button>
			</form:form>

		</div>
	</div>
	<%-- <!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" /> --%>


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

</body>
</html>