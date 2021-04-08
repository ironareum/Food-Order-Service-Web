<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Contact Form</title>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
		<link rel="stylesheet" type="text/css" href="resources/css/style.css">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script type="text/javascript" src="${root }js/jquery.raty.js"></script>
     <!--    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
		
		
		<style>
		
		@import url("https://fonts.googleapis.com/css?family=Roboto:300,400,700&display=swap");
body {
  font-family: "Roboto", Helvetica, sans-serif;
  background: #fcfbff;
}

.section-100 {
  padding-top: 100px;
  padding-bottom: 100px;
}

.m-b-15 {
  margin-bottom: 15px;
}

.m-r-5 {
  margin-right: 5px;
}

.light-grey {
  color: #aaa;
}

.contact-form {
  background: #fff;
  box-shadow: 0 23px 73px -17px rgba(0, 0, 0, 0.16);
  display: flex;
  flex-wrap: wrap;
}
@media (min-width: 993px) {
  .contact-form {
    flex-wrap: nowrap;
  }
}
.contact-form__left {
  background: linear-gradient(to bottom,  #21610B,  #0B6121);
  color: #fff;
  padding: 30px 30px 80px 30px;
  width: 100%;
  border-radius: 5px;
  position: relative;
}
@media (min-width: 993px) {
  .contact-form__left {
    width: 350px;
    transform: scale(1.05);
  }
}
.contact-form__left_footer {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 30px;
}
.contact-form__left_footer a {
  margin-right: 2px;
  padding: 8px;
  color: #ccc;
}
.contact-form__left_footer a:hover {
  color: #fff;
}
.contact-form__right {
  padding: 30px;
  width: 100%;
}
@media (min-width: 993px) {
  .contact-form__right {
    padding: 60px;
    width: calc(100% - 350px);
  }
}


.btn-primary {
  background: #0B6121;
  border-color: #208cbd;
}
.btn-primary:hover {
  background: #208cbd;
  border-color: #208cbd;
}
		
		
	  .indent {
        text-indent: 2em;
      }	
		
			
		
		</style>
	
	</head>
	
	
	<script type="text/javascript">
		
         $(function() {
            $('div#star').raty({
                score: 3
                ,path : "${root }image"
                ,width : 200
                ,click: function(score, evt) {
                    $("#starRating2").val(score);
                   //$("#displayStarRating").html(score);
                }
            });
        }); 
        
       
        
      
        $(document).ready(function(){
        	
        	$("#fileInput").on('change',function(){//값이 변경되면
        		if(window.FileReader){
        			var filename=$(this)[0].files[0].name;//모던브라우저
        			
        		}else{//old IE
        			var filename=$(this).val().split('/').pop().split('\\').pop();//파일명만 추출
        		}
        	//추출한 파일명 삽입
        	$("#userfile").val(filename);
        	
        	});
        	
        	
        });
    </script>
	
	
	
	
	
<body>
	<section class="section-100">
		<div class="container">

			<h1 class="text-center">리뷰 작성</h1>
			<br><br><br>

			<div class="contact-form">
			
			
			
				<div class="contact-form__left">
				
					<h3 class="m-b-15">${ordersBean.store_name}</h3>					
					<hr>
					
					<div>					
					<i class="fas fa-shopping-cart m-r-5"></i> 주문번호
							
						<p class="indent"> ${ordersBean.order_num }</p>
						
					</div>
					
					
					
					<div>
						<i class="fas fa-calendar m-r-5"></i> 주문일시
						<p class="indent"> ${ordersBean.order_date } </p>
					
					</div>
					
					
					
					<div>
						<i class="fas fa-list-ol m-r-5"></i> 주문메뉴
						<small class="white">
						<ul>
						<li>${ordersBean.menu_name }</li>
						</ul>
					  </small>
					</div>
					
					
					<div>					
						<i class="fas fa-won-sign m-r-5"></i> 총 결제금액
						<p class="indent">${ordersBean.total_pmt }</p>
					</div>
					
					
					
					<!-- 
					<div class="contact-form__left_footer">
						<a href="#!"><i class="fab fa-facebook-f"></i></a>
						<a href="#!"><i class="fab fa-twitter"></i></a>
						<a href="#!"><i class="fab fa-instagram"></i></a>
						<a href="#!"><i class="fab fa-youtube"></i></a>
						<a href="#!"><i class="fab fa-globe"></i></a>
						<a href="#!"><i class="fab fa-globe"></i></a>
					</div> -->
				</div>
				
				
				
				
				<div class="contact-form__right">
					<h3 class="m-b-15">나의 리뷰</h3>
					<hr>
					<form:form action="${root }board/write_pro?cust_id=${cust_id }&tab=review" method="post" modelAttribute="reviewBean" enctype="multipart/form-data">
						<div class="form-group">
						
							<form:label path="review_subject">제목</form:label>
							<form:input path="review_subject" class="form-control form-control-lg" />
							 <form:errors path="review_subject" style="color:red"></form:errors>
						 
						</div>
						
						<!--별점부분  -->
					<div id="star" style="padding-top:20px;">      
                 <label for="starRating"> 별점 </label><br>
            <span id="displayStarRating" style="padding-left:2px;"></span> 
            </div>
      
						<br>
						
						
						
						<!-- 리뷰내용 -->
						<div class="form-group">
						<form:label path="review_content">내용</form:label>
							<form:textarea path="review_content" class="form-control form-control-lg" rows="5" style="resize: none"></form:textarea>
							<form:errors path="review_content" style="color:red"></form:errors>
						
						</div>
						
						<div class="form-group">
								<form:label path="upload_file">첨부 이미지</form:label> 
								<form:input type="file"
									path="upload_file" class="form-control"
									accept="image/*" />
							
							
						</div>
						
						
						<div class="text-right">
							<form:button  class="btn btn-primary btn-lg btn-block">작성하기</form:button>
						</div>
						
						<form:hidden id="starRating2" path="review_star" value="3"/>
						<form:hidden id="menu_name" path="menu_name" value="${ordersBean.menu_name }"/>
						<form:hidden id="order_num" path="order_num" value="${ordersBean.order_num }"/>
						<form:hidden path="review_img" value="ppap"/>
					</form:form>
				
					
					
				</div>
			</div>
		</div>
	</section>
	
	
	
	
</body>
</html>