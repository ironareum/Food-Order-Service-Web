<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!-- Bootstrap css v5.0 -->


<link rel="stylesheet" href="${root}css/style_main.css" />

<!-- 휴게소 리스트  -->
<div class="shops accordion" id="accordionExample">
	<!-- 게시물 결과 반복 -->
	<c:forEach var="shop" items="${marketInfos}" varStatus="status">
		<div class="shopBox accordion-item">
			<div class="accordion-header" id="heading_${status.index}">
				<div class="shopInfo">
					<div>
						<h3 class=" font-weight-light">${shop.store_name}</h3>
						<p>고속도로 방면: ${shop.store_highway}</p>
					</div>
					<!-- 휴게소 가기 -->
					<div class="button text-center flexbox">
						<a href="${root}shop/ea?market_name=${shop.store_name}"  class="btn btn-outline-success">휴게소가기 </a>
					</div>

				</div>
					<button class="moreInfo accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_${status.index}" aria-expanded="false" aria-controls="collapse_${status.index}">상세설명
					</button>
			</div>
			<!-- 상세보기 -->
			<div id="collapse_${status.index}"
				class="accordion-collapse collapse"
				aria-labelledby="heading_${status.index}"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<p>
						<small class="text-muted">주소: ${shop.store_addr}</small>
					</p>
					<p>
						<small class="text-muted">전화번호: ${shop.store_phone}</small>
					</p>
					<p>
						<small class="text-muted">영업시간: ${shop.store_open} ~
							${shop.store_close} </small>
					</p>
					<!-- <p>
						<small class="text-muted">대표메뉴: </small>
					</p> -->
					<p>
						<small class="text-muted">별점: ${shop.store_staravg}</small>
					</p>
					<p>
						<small class="text-muted">리뷰수: ${shop.store_reviewcnt}</small>
					</p>
				</div>
			</div>
		</div>
	</c:forEach>

</div>
<!-- jquery cdn -->

