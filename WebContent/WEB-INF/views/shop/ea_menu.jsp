<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<link rel="stylesheet" href="${root}css/style_main.css" />
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>

<!-- 메뉴 아코디언 -->

<div class="accordion" id="accordionExample">
<!-- 카테고리별 메뉴 반복 -->
	<c:forEach var="marketMenus_" items="${marketMenus}" varStatus="counting">
		<!-- 메뉴카테고리 헤더 -->
		<div class="accordion-item" id="${marketMenus_[0].category_name }">
			<h2 class="accordion-header" id="popularMenu">
				<button style="background-color: var(--green-light); color:white;" class="accordion-button" type="button"
					data-bs-toggle="collapse"
					data-bs-target="#collapse${counting.index}" aria-expanded="true"
					aria-controls="collapse${counting.index}">${marketMenus_[0].category_name}
				</button>
			</h2>
			<div id="collapse${counting.index}"
				class="accordion-collapse collapse show"
				aria-labelledby="heading${counting.index}"
				data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<!-- 카테고리별 반복될 메뉴 -->
					<c:forEach var="menu" items="${marketMenus_}" varStatus="status">
						<div class="menues">
						<!--각 메뉴정보 -->
							<div class="menu">
								<div class="menuImg">
									<img src="${root}image/menu/${menu.menu_img}.jpg" alt=""
										class="img" />
								</div>
								<div class="menuInfo">
									<h3 class="name">
										<strong>${menu.menu_name}</strong>
									</h3>
									<p class="content">${menu.menu_content}</p>
									<h5 class="price">${menu.menu_price}원</h5>
								</div>
								<!-- plus minus button area -->
								<!-- old one -->
								<div class="menuCountBox">
									수량
									<div class="row">
										<div class="input-group">
											<span class="input-group-prepend">
												<button type="button"
													class="btn btn-outline-secondary btn-number_${status.index}"
													disabled="disabled" data-type="minus" data-field="quant[1]">
													<span class="fa fa-minus"></span>
												</button>
											</span> <input type="text" name="quant[1]"
												class="form-control input-number" value="1" min="1" max="10"
												> <span
												class="input-group-append">
												<button type="button"
													class="btn btn-outline-secondary btn-number_${status.index}"
													data-type="plus" data-field="quant[1]">
													<span class="fa fa-plus"></span>
												</button>
											</span>
										</div>
									</div>
									<div class="addToCart">
										<button  class="btn btn-success btn_add_${status.index}">주문표에 담기</button>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>
		</div>
	</c:forEach>
</div>

<!-- 아코디언 끝 -->
