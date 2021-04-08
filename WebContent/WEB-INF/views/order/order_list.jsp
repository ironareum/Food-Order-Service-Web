<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>주문목록</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<style>
@import url("https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap");
body {
  font-family: "Roboto", sans-serif;
  background: #EFF1F3;
  min-height: 100vh;
  position: relative;
}

.section-50 {
  padding: 50px 0;
}

.m-b-50 {
  margin-bottom: 50px;
}

.dark-link {
  color: #333;
}

.heading-line {
  position: relative;
  padding-bottom: 5px;
}
.heading-line:after {
  content: "";
  height: 4px;
  width: 75px;
  background-color: #29B6F6;
  position: absolute;
  bottom: 0;
  left: 0;
}

.notification-ui_dd-content {
  margin-bottom: 30px;

}

.notification-list {
  display: none;
  justify-content: space-between;
  padding: 20px;
  margin-bottom: 7px;
  background: #fff;
  box-shadow: 0 3px 10px rgba(0, 0, 0, 0.06);
}


.notification-list .notification-list_content {
  display: flex;
}


.notification-list .notification-list_content .notification-list_img img {
  height: 100px;
  width: 85px;
  border-radius: 50px;
  margin-right: 30px;
}

.notification-list .notification-list_content .notification-list_detail p {
  margin-bottom: 5px;
  line-height: 1.2;
}

/*
.notification-list .notification-list_feature-img img {
  height: 48px;
  width: 48px;
  border-radius: 5px;
  margin-left: 20px;
}
*/
</style>
</head>
<body>


	<section class="section-50">
		<div class="container">
		
			<div class="notification-ui_dd-content" >

				<!-- 게시글 -->
				<c:forEach var='obj' items='${allOrders}'>
					<div class="notification-list">
					<div class="notification-list_content">
						<div class="notification-list_detail">
						<p><small> ${obj.order_date}</small></p>
							<p><b>${obj.store_id}</b> </p>
							<p class="text-muted"><small>${obj.menu_name}</small></p>
							<button class="btn  btn-light"><i class="fa fa-pencil text-center mr-1"></i> 리뷰 쓰기</button>
							<button class=" btn btn-light "><i class="fa fa-road text-center mr-1"></i>휴게소 보기</button>
							<button class="btn  btn-light "><i class="fa fa-window-restore text-center mr-1"></i>주문 상세</button>
						
						</div>
					</div>	
				</div>
				</c:forEach>
				
				
				

			<div class="text-center">
				<button class="btn  btn-dark" id="load">주문내역 더보기</button>
			</div>
			
		

		</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<!-- script : 더보기 버튼 구현 (3개씩)-->

<script>
$(function(){
	$(".notification-list").slice(0,3).show(); //최초 0,1,2 세개 선택
	$("#load").click(function(e){
	e.preventDefault();
	$(".notification-list:hidden").slice(0,3).show();//숨김설정된다음, 다음 3개
     if($(".notification-list:hidden").length==0){
    	 
    	 $('#load').css('display','none');//더이상 로드할 항목이 없는경우
     }		
	});
	
	
});



</script>


</body>
</html>