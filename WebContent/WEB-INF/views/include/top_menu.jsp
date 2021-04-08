<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<link rel="stylesheet" href="${root}css/style_main.css" />

<!-- Bootstrap css v5.0 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">


<nav class="mainNavBar navbar navbar-expand-lg navbar-dark" style="padding: 10;" >
	<div class="container-fluid" > <!-- style="vertical-align: middle; margin:auto 0;" -->
		<a class="navbar-brand" href="${root }index"><img class="logoImg" src="${root}image/logo/logo_hr.png" alt="" /></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link " aria-current="page" href="${root}index">홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${root}shop/main?searchKeyword=">휴게소검색</a>
				</li>
				<c:choose>
					<c:when test="${loginUserBean.cust_login ==true}">
						<li class="nav-item">
							<a class="nav-link" href="${root }Customer/modify/access?tab=like">찜한휴게소</a>
						</li>
					</c:when>
					<c:otherwise>
						<p></p>
					</c:otherwise>
				</c:choose>
			</ul>

			<form class="d-flex">
				<c:choose>
					<c:when test="${loginUserBean.cust_login ==true}">
						<li class="nav-item dropdown">
											
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fas fa-user-circle"></i></a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li>
									<h3><a class="dropdown-item" href="#">${loginUserBean.cust_name} 님,</a></h3>
								</li>
								<li>
									<a class="dropdown-item" href="${root}Customer/modify/access">나의정보</a>
								</li>
								
							</ul>
						</li>
						<li class="nav-item">
							<a href="${root }order/cart?store_name=${currentStore.store_name}" class="nav-link"><i class="fas fa-shopping-cart"></i></a>
						</li>
						
						<li class="nav-item">
							<a href="${root }Customer/logout" class="nav-link">로그아웃</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<a href="${root }Customer/login" class="nav-link">로그인</a>
						</li>
						<li class="nav-item">
							<a href="${root }Customer/new" class="nav-link">회원가입</a>
						</li>
					</c:otherwise>
				</c:choose>

			</form>
		</div>
	</div>
</nav>
