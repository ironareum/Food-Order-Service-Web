<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
	<title>Shopping Cart</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap css v5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous" />
    <link rel="stylesheet" href="style_main.css" />
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
    <!-- js v5.0 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
        crossorigin="anonymous"></script>
</head>
<body>
<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	<!-- <main class="page">
	 	<section class="shopping-cart dark">
	 		<div class="container">
		        <div class="block-heading">
		          <h2>Shopping Cart</h2>
		        </div>
		        
		        <div class="container-fluid">
	 				<div class="row">
	 					<div class="col-md-20 col-lg-14">
	 						<div class="items">
	 								카트에있는 리스트 출력될곳		
				 			</div>아이템 끝
			 			</div>
				
		 			</div>		
				</div>
				
				<div class="summary" >
			 		<div class="summary-item"><span class="text">총계</span><span class="price"></span></div>
			 		<button type="button" class="btn btn-primary btn-block" id="payment">결제하기</button>	
				</div>

		</section>
	</main> -->
	<div style="height:100%; padding: 50px; margin-bottom: -211px;">
	<div class="list-group" style="max-width:650px; margin:auto;">
        <h3><a href="#" class="list-group-item list-group-item-action active" aria-current="true" style="background-color: var(--green-dark);">
            장바구니 목록
        </a></h3>
        <div class="list-group-item  list_menu" style="min-height: 100px;">
           
          
                    <c:if test="${fn:length(cartSelectList) == 0}">
                	
                   			 <h1 style="text-align: center; margin: 100px auto;">장바구니 목록이 없어요 ㅠㅠ</h1>
                	
               
                	</c:if>
           
     
        	</div>
        <div class="summary-item list-group-item list-group-item-action"><span class="text" id="total">총계: </span><span class="total_price" style="padding-left:10px;"> 0 원</span></div>
        
		<div class="summary" >
			<button type="button" class="btn btn-success btn-block" id="payment">결제하기</button>	
		</div>
    </div>
    </div>
	
	
	
	
	
	<!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
	

<!-- Bootstrap CDN -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>
   $("p.title").on('click',function(){
	  $(this).next(".con").slideToggle(100);
	});
   
   
   $(document).ready(function() {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 */

			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);

		}).scroll();

	});

</script>

<script>

//메뉴 리스트 붙이는곳
var newArray = new Array();
var totalcount = 0;
var real_cart_menuList;

var cart_menuList = "${cartSelectList }";


<c:set var="number" value="0"/>
<c:forEach var="cart" items="${cartSelectList}">
var add_cart_menuList = document.createElement("div");

cart_menuList_name = "${cart.menu_name}";
cart_menuList_price = "${cart.menu_price}";
cart_menuList_count = "${cart.menu_count}";
cart_menuList_img = "${cart.menu_img}";
console.log(cart_menuList_img);
totalcount += Number(cart_menuList_price)*Number(cart_menuList_count);

var str = '<div class="menu_${number}" style="display:flex; flex-direction: row; vertical-align: middle; ">'
+'<div class="menuImg" style="display: felx; width:15%;">'
+'<img src="${root}image/menu/${cart.menu_img}.jpg" alt="" class="img" style="width: 100%;" />'
+'</div>'
+'<div class="menuInfo" style="display: flex; flex-direction: row; width:45%;">'
+'<span class="name" style="padding-left: 10px; margin:auto;">'
+'    <strong>${cart.menu_name}</strong>'
+'</span>'
+'<span class="price" style="padding-left: 10px; margin:auto; ">${cart.menu_price}</span>'
+'</div>'
<!-- plus minus button area -->
<!-- old one -->
+'<div class="menuCountBox" style="display: inline-block; width:25%; margin:auto;">'
+'<div class="row">' 
+    '<div class="input-group">'
+        '<span class="input-group-prepend">'
+            '<button type="button" class="btn btn-outline-secondary btn-number_${number}"'
+                'data-type="minus" data-field="quant[1]">'
+               '<span class="fa fa-minus"></span>'
+            '</button>'
+        '</span> <input type="text" name="quant[1]" class="form-control input-number" value="${cart.menu_count}"'
+            'min="1" max="10"> <span class="input-group-append">'
+            '<button type="button" class="btn btn-outline-secondary btn-number_${number}"'
+                'data-type="plus" data-field="quant[1]">'
+                '<span class="fa fa-plus"></span>'
+            '</button>'
+        '</span>'
+    '</div>'
+'</div>'
+'</div>'
+'<div class="col-md-2" style=" margin:auto; width:15%">'
+'<p style="text-align: center; margin: auto;">'
+   '<a href="#" class="btn btn-danger btn-round btn-sm " data-abc="true" ><i class="fa fa-trash" id="delete_${cart.rownum}">삭제</i></a>'
+   '</p>'  
+'</div>'
+'</div>';

add_cart_menuList.innerHTML = str;
$(".list_menu").append(add_cart_menuList);
$(".list-group").find(".total_price").text(totalcount + " 원");

var count = "btn-number_" + "${number}";
console.log($('.menuCountBox').find("."+count));
$('.menuCountBox').find("." + count).on('click', function() {
		
			
			if($(this).attr("data-type") == "minus"){
				let int_tmp_inputVal = $(this).parents(".menuCountBox").find(".input-number").val();
				
				if(int_tmp_inputVal > 1){
					$(this).attr("disabled", false);
					int_tmp_inputVal--;
					$(this).parents(".menuCountBox").find(".input-number").val(int_tmp_inputVal);
				}else{
					$(this).parents(".menuCountBox").find('button[data-type="plus"]').attr("disabled", false);
					$(this).attr("disabled", true);
				}
				
			
				totalcount -= Number($(this).parents(".menu_${number}").find(".price").text());
				console.log($(this).parents(".menu_${number}").find(".price").text());
				console.log(totalcount);
				$(".list-group").find(".total_price").text(totalcount + " 원");
			}
			
			
			
			if($(this).attr("data-type") == "plus"){
				let int_tmp_inputVal = $(this).parents(".menuCountBox").find(".input-number").val();
				
				if(int_tmp_inputVal > 9){
					
					$(this).attr("disabled", true);
				}else{
					$(this).attr("disabled", false);
					console.log($(this).parents(".menuCountBox").find('button[data-type="minus"]'));
					$(this).parents(".menuCountBox").find('button[data-type="minus"]').attr("disabled", false);
					int_tmp_inputVal++;
					$(this).parents(".menuCountBox").find(".input-number").val(int_tmp_inputVal);
				}
				
				totalcount += Number($(this).parents(".menu_${number}").find(".price").text());
				console.log($(this).parents(".menu_${number}").find(".price").text());
				console.log(totalcount);
				
				$(".list-group").find(".total_price").text(totalcount + " 원");
				
				
			}
			
			
			
			
			
			
			
			console.log($(this));
});



console.log("${cart.rownum}")
$("#"+"delete_"+"${cart.rownum}").on('click', function(){
		let number = Number("${cart.rownum}");
		console.log(number);
		let j = 0;
		
		//현재 수량정보 전부 저장
		for(let i = 1 ; i <= "${fn:length(cartSelectList)}"; i++){
			
			$.ajax({
				url : "${root}order/preDelete",
				type : "get",
				data : { 
					
					menu_count : $("." + "menu_" + j).find(".input-number").val(),
					rownum : i
				},
				dataType : "text",
				success : function(data){
					console.log("성공했다다아아아아")
				}
			
			
			});
			j++;
		}
		
		
		
		 //삭제 누르는 순간 현재 정보도 저장
  		$.ajax({
			url : "${root}order/delete",
			type : "get",
			
			data : { 
				//삭제할 항목
				menu_name : number
		
			
			},
			dataType : "text",
			success : function(data){
				location.reload();
				console.log("헬로헬로");
			}
		
		});   
 		
		
		
		
  		//토탈값 현재 인풋값기준으로 다빼기 값 수정
 		
 		
 		
}); 


<c:set var="number" value="${number+1}"/>
</c:forEach>


//메뉴 추가하는 스크립트 끝




 


$("#payment").on('click', function(){
	
	
	let j = 0;
	
	//현재 수량정보 전부 저장
	for(let i = 1 ; i <= "${fn:length(cartSelectList)}"; i++){
		
		//똑같은 로직이라 복붙
		$.ajax({
			url : "${root}order/preDelete",
			type : "get",
			data : { 
				
				menu_count : $("." + "menu_" + j).find(".input-number").val(),
				rownum : i
			},
			dataType : "text",
			success : function(data){
				console.log("성공했다다아아아아")
			}
		
		
		});
		j++;
	}
	
	
	location.href = "${root }order/payment";
});







</script>

</body>
</html>
