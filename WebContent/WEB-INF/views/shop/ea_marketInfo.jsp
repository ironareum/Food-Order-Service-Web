<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="root" value="${pageContext.request.contextPath }/" />
<link rel="stylesheet" href="${root}css/style_main.css" />


<!-- card-body -->

	<div class="summary">
		<div class="marketInfo">
				<br />
				<h1>${oneMarketInfo.store_name} </h1>
				<h1><i class="fas fa-utensils"></i></h1>
				<p>고속노로 노선: ${oneMarketInfo.store_highway}</p>
				<p>주소: ${oneMarketInfo.store_addr}</p>
				<p>전화번호: ${oneMarketInfo.store_phone}</p>
				<p>영업시간: ${oneMarketInfo.store_open} ~ ${oneMarketInfo.store_close}</p>
				<br />

		</div>
	</div>

