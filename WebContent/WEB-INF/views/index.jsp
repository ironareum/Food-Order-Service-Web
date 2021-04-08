<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap css v5.0 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/style_main.css" />
<title>메인페이지</title>
</head>

<body>

	<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	
	<!-- card image -->
	<div class="main card text-white rounded-0"> 
		<img src="image/food1.jpg" class="card-img rounded-0" alt="..." > <!-- style="height: 100vh;" -->
		<!-- 메인 문구 -->
		<div class="searchBlock card-img-overlay">
			<div class="searchBox1">
				<div class="searchTitile">
					<h1 class="card-title">
						<span>포장/방문</span><br />
						<span>휴게소 검색하기</span><br />
					</h1>
				</div>
				<div>
					<form:form class="searchBox" action="${root}shop/proc" method="get"
						modelAttribute="searchMarketBean">
						<div class="input-group mb-3">
						<form:input class="searchInput card-text form-control" path="searchKeyword" type="text"
							placeholder="휴게소 또는 노선명을 입력하세요." aria-label="휴게소 또는 노선명을 입력하세요." aria-describedby="button-addon2" style="font-size:30px; color:var(--green-dark); vertical-align:middle; padding-top:10px;"/>
						<form:button class="searchButton btn btn-outline-secondary" id="button-addon2" style="font-size:30px; color:var(--green-dark); padding-bottom:10px;">검색하기</form:button>
						</div>
					</form:form>

				</div>
			</div>
		</div>
	</div>

	<!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
	<script src="https://kit.fontawesome.com/2d323a629b.js"
		crossorigin="anonymous"></script>

	
	<!-- Bootstrap CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<!-- js v5.0 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
	<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
</body>
</html>