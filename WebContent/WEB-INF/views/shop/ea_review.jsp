<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="root" value="${pageContext.request.contextPath }/" />
<link rel="stylesheet" href="${root}css/style_main.css" />


<!-- card-body -->

<div class="summary">
	<div class="eaReview">
		<!-- 리뷰반복 -->
		<c:choose>
			<c:when test="${storedReviews.size()!=0}">

				<c:forEach var="review" items="${storedReviewList}">
					<div class="oneReivew">
						<div class="custId">
							<span><strong>${review.cust_id} 님</strong></span> 
							<span class="orderTime badge bg-success rounded-pill">${review.review_date}</span>
						</div>
						<p class="stars"> 별:

							<c:set var="starCount" value="${review.review_star}" />
							<c:choose>
								<c:when test="${starCount==1}">
									<span><i class="fas fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
								</c:when>
								<c:when test="${starCount==2}">
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
								</c:when>
								<c:when test="${starCount==3}">
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
								</c:when>
								<c:when test="${starCount==4}">
									<span><i class="fas fa-star" ></i></span>
									<span><i class="fas fa-star" ></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="far fa-star"></i></span>
								</c:when>
								<c:when test="${starCount==5}">
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
									<span><i class="fas fa-star"></i></span>
								</c:when>
							</c:choose>
						</p>
						<h5><b>${review.review_subject}</b></h5>
						<div class="img">
							<img src="${root}upload/${review.review_img}" alt="" />
						</div>
						<p class="orderMenu">
							<span class="badge bg-success rounded-pill">주문메뉴</span> <small
								class="text-muted">${review.menu_name}</small>
						</p>
						<p class="content">
							<strong> ${review.review_content}</strong>
						</p>
					</div>
					<hr />
				</c:forEach>
			</c:when>
			<c:otherwise>
				<h1>리뷰가 없어요 ㅠㅠ</h1>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<div class="more">
	<div class="pagination">
		<!-- 페이지네이션 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination">
			<c:choose>
				<c:when test="${pageBean.prePage <=0 }">
					<li class="page-item disabled">
						<a style="color:gray; border-color: var(--green-light);" class="page-link" href="#">이전</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page-item">
						<a style="color: var(--green-primary); border-color: var(--green-light);" class="page-link" href="${root}shop/ea?market_name=${market_name}&page=${pageBean.prePage}">이전</a>
					</li>
				</c:otherwise>
			</c:choose>
				<c:forEach var="currentPage" begin="${pageBean.min }" end="${pageBean.max }">
					<c:choose>
						<c:when test="${currentPage== pageBean.currentPage}">
							<li class="page-item active" >
								<a style="background-color:  var(--green-dark);
    border-color: var(--green-light);" class="page-link linkCurrent" href="${root}shop/ea?market_name=${marketName}&page=${currentPage}">${currentPage}</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="page-item" >
								<a style="color: var(--green-primary); border-color: var(--green-light);" class="page-link linkCurrent" href="${root}shop/ea?market_name=${market_name}&page=${currentPage}">${currentPage}</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${pageBean.nextPage >= pageBean.pageCnt }">
						<li class="page-item disabled">
							<a style="color:gray; border-color: var(--green-light);" class="page-link" href="#">다음</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a style="color: var(--green-primary); border-color: var(--green-light);" class="page-link" href="${root}shop/ea?market_name=${market_name}&page=${pageBean.nextPage}">다음</a>
						</li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</nav>
	</div>
</div>
<!-- jquery cdn -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- 	<script>
		$(function() {
			$(".linkCurrent").on("click", function() {
				$(".eaReview").load("${root}shop/ea?market_name=${marketName}&page=${currentPage}");
			});
		});
	</script> -->

