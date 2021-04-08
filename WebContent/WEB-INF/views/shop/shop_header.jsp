<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!-- Bootstrap css v5.0 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="${root}css/style_main.css" />


	<div class="eaHeader card text-center bg-dark text-white" style="height: 300px">
		<img class="card-img" src="${root }image/bg6.jpg" alt="Card image" style="height: 300px">
		<div class="card-img-overlay">
		<div claee="infoBox">
			<h1 class="card-title">${oneMarketInfo.store_name}</h1>
			<h1 class="card-title">${oneMarketInfo.store_highway}고속도로</h1>
			<span  style="background-color: var(--green-dark);" class="badge rounded-pill">별점: ${oneMarketInfo.store_staravg}</span> &nbsp;
			<span style="background-color: var(--green-dark);" class="badge  rounded-pill">리뷰수: ${reviewCount}</span> &nbsp;
			
			<c:choose>
				<c:when test="">
				<span id="liked_span" style="color:red;"><i class="fas fa-heart fa-heart-man" id="liked"></i></span>
				</c:when>
				<c:otherwise>
				<span id="liked_span" style="color:white;"><i class="far fa-heart fa-heart-man" id="noliked"></i></span>
				</c:otherwise>
			</c:choose>
		</div>
		</div>
		<!-- 		<div class="review">
			<div class="score">
				<h1>점수: 4.6</h1>
			</div>
		</div> -->
	</div>
	
	<script>
	
		
		$(".fa-heart-man").on('click', function(){
			console.log($(".fa-heart-man").attr("id"));
			//라이크(빨간색) 일때 누르면 흰색으로
			if($(this).attr("id") == 'liked'){
				$(this).parents("#liked_span").css("color", "white");
				console.log($(this).attr('id'));
				$(this).attr('id', 'noliked');
				
				
				//찜테이블 인서트 통신
				$.ajax({
				
					url : "${root }like/deleteLike",
					type : "get",
					dataType : "text", 
					data : { 
						"cust_id" : "${cust_id}",//$(".cart-add-list").find("." + "item_" + i).find('.menu_name').text(),
						"store_id" :"${oneMarketInfo.store_id}",//$(".cart-add-list").find("." + "item_" + i).find('.menu_price').text(),
						"like_num" : 1
					},
					//응답 오바
					success : function (data){
						console.log(data)
					},
					
					error : function(error) {
					        console.log(error);
					}
						
				});
				
				
			
			}else if($(this).attr("id") == 'noliked'){
				$(this).parents("#liked_span").css("color", "red");
				$(this).attr('id', 'liked');
				
				//찜테이블 인서트 통신
				$.ajax({
				
					url : "${root }like/insertLike",
					type : "get",
					dataType : "text", 
					data : { 
						"cust_id" : "${cust_id}",//$(".cart-add-list").find("." + "item_" + i).find('.menu_name').text(),
						"store_id" :"${oneMarketInfo.store_id}",//$(".cart-add-list").find("." + "item_" + i).find('.menu_price').text(),
						"like_num" : 1
					},
					//응답 오바
					success : function (data){
						console.log(data)
					},
					
					error : function(error) {
					        console.log(error);
					}
						
				});
				
				
			}
			
		});
		
	
	
	
	</script>