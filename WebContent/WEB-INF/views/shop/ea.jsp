<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap css v5.0 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous"/>
<link rel="stylesheet" href="${root}css/style_main.css" />
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- js v5.0 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<body>
	<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<!-- 메뉴 리스트 -->
	<div class="ea wrapper" > <!-- style="background-color: var(--pink-peach-light);" -->
		<section class="left">
			<!-- header: 휴게소 정보  -->
			<c:import url="/WEB-INF/views/shop/shop_header.jsp" />
			<div class="eaItemList" style="margin: 0;">
				<!-- card add!!!! -->
				<div class="card text-center">
					<div class="card-header " style="background-color: var(--green-primary)">
						<ul class="nav nav-tabs card-header-tabs ">
							<li class="nav-item ">
								<!-- onclick="clickMenu()"  -->
								<button onclick="clickMenu()"
									class="navCategory navMenu menu_ nav-link ">
									<span>메뉴</span>
								</button>
							</li>
							<!--  -->
							<li class="nav-item ">
								<!-- onclick="clickReview()" -->
								<button onclick="clickReview()"
									class="navCategory review_ nav-link ">
									<span>리뷰</span>
								</button>
							</li>
							<li class="nav-item ">
								<!-- onclick="clickMarketInfo()" -->
								<button onclick="clickMarketInfo()"
									class="navCategory marketInfo_ nav-link">
									<span>휴게소상세정보</span>
								</button>
							</li>
						</ul>
					</div>

					<div class="card-body" id="cardBodyInsert" style="padding: 0;">
						<!-- cardbody 시작 -->
						<!-- 메뉴 -->
						<!-- style="display: block; "-->
						<div id="menuToggle" class=" " >
							<c:import url="/WEB-INF/views/shop/ea_menu.jsp" />
						</div>

						<!-- 리뷰 -->
						<!-- style="display: none; "-->
						<div id="reviewToggle" class=" " >
							<c:import url="/WEB-INF/views/shop/ea_review.jsp" />
						</div>

						<!-- 휴게소 정보 -->
						<!-- style="display: none;" -->
						<div id="marketInfoToggle" class=" " >
							<c:import url="/WEB-INF/views/shop/ea_marketInfo.jsp" />
						</div>
					</div>
					<!-- cardbody 끝 -->
				</div>
			</div>

		</section>

		<!-- 주문표 -->
		<section class="right">

			<div class="cart">
				<div class="cartBox card">
					<div class="card-header" style="background-color: var(--green-light); color:white; margin:auto;"><h3>주문표</h3></div>
					<ul class="list-group list-group-flush cart-add-list"> </ul>
					
						
						<%-- <c:forEach  var="menuInBucket" items="${tempMenuItem}"> 
							
							<li class="list-group-item">
								<p class="addToCart_menuName">메뉴이름: ${menuInBucket.menu_name }</p>
								<p class="addToCart_menuPrice">금액:${menuInBucket.menu_price }</p>
								<p class="addToCart_menuCount">수량: </p>
							</li>
						</c:forEach> --%>
					<ul class="list-group list-group-flush">
						<li class="list-group-item" style="background-color: var(--green-dark); color:white;">
							<span>합계 :</span>
							<span class="total-price"><strong>0</strong></span>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-success me-2" type="button"
								data-bs-toggle="modal" data-bs-target="#myModal">주문하기</button>
						</li>
					</ul>

				</div>
			</div>
		</section>
	</div>

	<!-- 휴게소 상세정보 modal -->
	<div class="modal" id="myModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">주문메세지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h1>주문을 진행 하시겠습니까?</h1>
					<p>장바구니로 이동 합니다.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<a href="#결제페이지">
						<button type="button" class="btn btn-success btn-payment">결제하기</button>
					</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />

	<script >
	<!-- 탭화면 클릭 후 새로고침 시 탭 고정 -->
	$(document).ready(function() {
		let tabValue = localStorage.getItem('selectedTab');
		if(tabValue == '') {
			console.log("선택한적 없음 -> 메뉴보여짐");
			$('.navMenu').addClass('active');
	    	$('#reviewToggle').addClass('hideBlock');
	    	$('#marketInfoToggle').addClass('hideBlock'); 
    	} 
		else if(tabValue == "메뉴"){
	   		 console.log("메뉴가 선택됨 ")
	   		 $('#menuToggle').removeClass('hideBlock');
	   		 $('#reviewToggle').addClass('hideBlock');
	   		 $('#marketInfoToggle').addClass('hideBlock');
	  		 }
	   	 else if(tabValue == "리뷰"){
	   		 console.log("리뷰가 선택됨 ")
	   		 $('#menuToggle').addClass('hideBlock');
	   		 $('#reviewToggle').removeClass('hideBlock');
	   		 $('#marketInfoToggle').addClass('hideBlock');
	  		 }
	   	  /* else if(tabValue == "휴게소상세정보"){
	   		 console.log("휴게소상세정보가 선택됨 ")
	   		 $('#menuToggle').addClass('hideBlock');
	   		 $('#reviewToggle').addClass('hideBlock');
	   		 $('#marketInfoToggle').removeClass('hideBlock');
	  		 }   */
	
 	
	  		 
	  		 
     $(".navCategory").on('click', function(){
    	 $(this).addClass('active');
    	 let text = $(this).find('span').text();
    	 console.log(text+"가 클릭 됨!!");
    	if(text === "휴게소상세정보"){
    		localStorage.setItem('selectedTab', "메뉴"); 
    	}
    	 localStorage.setItem('selectedTab', text); 

    	 /* 컨텐츠 창  */
    	 if(text == '') {
    		 console.log("클릭클릭: 아무것도 없으니 메뉴로 출동 ")
    		 $('.navMenu').addClass('active');
    		 $('#reviewToggle').addClass('hideBlock');
    		 $('#marketInfoToggle').addClass('hideBlock'); 
   		 }
    	 else if(text == "메뉴"){
    		 console.log("클릭클릭: 메뉴가 선택됨 ")
    		 $('#menuToggle').removeClass('hideBlock');
    		 $('#reviewToggle').addClass('hideBlock');
    		 $('#marketInfoToggle').addClass('hideBlock');
   		 }
    	 else if(text == "리뷰"){
    		 console.log("클릭클릭:리뷰가 선택됨 ")
    		 $('#menuToggle').addClass('hideBlock');
    		 $('#reviewToggle').removeClass('hideBlock');
    		 $('#marketInfoToggle').addClass('hideBlock');
   		 }
    	 else if(text == "휴게소상세정보"){
    		 console.log("클릭클릭:휴게소상세정보가 선택됨 ")
    		 $('#menuToggle').addClass('hideBlock');
    		 $('#reviewToggle').addClass('hideBlock');
    		 $('#marketInfoToggle').removeClass('hideBlock');
   		 } 
    	 
    	 /* 탭창 액티브삭제 */
    	 $('.navCategory').find('span').each(function() {
    		 if($(this).text() !== text) {
    			 $(this).parent().removeClass('active');
   			 }
   		 })
     });
	//새로고침시 
     let selectedTab = localStorage.getItem('selectedTab');
     $('.navCategory').find('span').each(function() {
         if($(this).text() === selectedTab) {
        	 if($(this).text() === "휴게소상세정보"){
        		 $('.navMenu').addClass('active');
        		 $('#reviewToggle').addClass('hideBlock');
     	    	$('#marketInfoToggle').addClass('hideBlock'); 
        	 } else {
	        	 $(this).parent().addClass('active');        		 
        	 }
         }
     });
	});

	</script>

	<script defer>
		var menuToggle = document.getElementById("menuToggle");
		var reviewToggle = document.getElementById("reviewToggle");
		var marketInfoToggle = document.getElementById("marketInfoToggle");
		
		function clickMenu(){
		}
		function clickReview(){
		}
		function clickMarketInfo(){
		}

	</script>

	<!-- new countBox / add cart script -->
	<script>
	var menuList_count = 0;
	//el태그 그대로 쓰면 for문 length가 이상하게 잡힘 --> 문자열 그대로 넘어오는듯
	let list_bestMenu = "${marketMenus[0]}";
	let list_koreanMenu = "${marketMenus[1]}"
	let list_westernMenu = "${marketMenus[2]}";
	let list_chineseMenu = "${marketMenus[3]}";
	let list_newMenu = "${marketMenus[4]}";

	/* console.log(list_bestMenu);
	console.log(list_koreanMenu);
	console.log(list_westernMenu);
	console.log(list_chineseMenu); */
	//"bestMenu", "koreanMenu", "westernMenu", "chineseMenu" 
	let list_all_menu = [list_bestMenu, list_koreanMenu, list_westernMenu, list_chineseMenu, list_newMenu];
	let list_all_menu_id = ["인기메뉴", "한식메뉴", "양식메뉴", "중식메뉴", "신메뉴" ];
	//베스트 메뉴리스트부터 시작
	console.log(list_all_menu);
	for(let k = 0; k< list_all_menu.length; k++){
	for(let i = 0; i< list_all_menu[k].length; i++){
		let btn_number_i = "btn-number_" + i;
		//이벤트 리스너 하나씩 달기
		console.log(list_all_menu_id[k]);
		console.log(btn_number_i);
		console.log($('#' + list_all_menu_id[k]));
		
		$('#'+ list_all_menu_id[k]).find("." + btn_number_i).on('click', function() {
		
			
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
				
				
			}
			
			console.log($(this));
		});
		
	/* 	<li class="list-group-item">
			<p class="addToCart_menuName">메뉴이름: ${menuInBucket.menu_name }</p>
			<p class="addToCart_menuPrice">금액:${menuInBucket.menu_price }</p>
			<p class="addToCart_menuCount">수량: </p>
		</li> */
		
		
		//각종 카테고리(한식,중식...) 안에서 주문표에담기_i을 달아서 전송되게
		var btn_add_i = "btn_add_" + i;
		$('#'+ list_all_menu_id[k]).find("." + btn_add_i).on('click', function(){
			var create_cartBox = document.createElement('div');
			//클래스 네임 2개 추가
			create_cartBox.className += $(this).parents(".menu").find(".menuInfo").find(".name").text();
			create_cartBox.className += "item_" + i;
			console.log($(this));
			var cart_list =   //'<li class="list-group-item">'
							'<div class="list-group-item" style="display:flex;">'
								+'<div class="menu_name" style="padding:5px; width="55%;"">'
								+ $(this).parents(".menu").find(".menuInfo").find(".name").text()
								+ '</div> &nbsp;'
								+ '<div class="menu_price" style="padding:5px; width="25%;">'
								+ $(this).parents(".menu").find(".menuInfo").find(".price").text()
								+ '</div>'
								+ '<div class="menu_count" style="padding:5px; width="20%;"> x '
								+ $(this).parents(".menu").find(".menuCountBox").find(".input-number").val()
								+ ' 개 </div>'
							+ '</div>';
			//만든거 붙여넣고
			create_cartBox.innerHTML = cart_list;
			$(".cart-add-list").append(create_cartBox);
			
			var total_price = Number($(".cart").find(".total-price").text());
			/* console.log(total_price); */
			
			var total_price_sum1 = Number($(this).parents(".menuCountBox").find(".input-number").val());
			var total_price_sum2 = $(this).parents(".menu").find(".menuInfo").find(".price").text();
			total_price_sum2=total_price_sum2.replace("원","");
			
			/* console.log(total_price_sum1);
			console.log(total_price_sum2); */
			
			menuList_count++;
			total_price += total_price_sum1 * Number(total_price_sum2);
			$(".cart").find(".total-price").text(total_price);
			
			
		});
		
		
		
		}//포문 끝부분
	}

	//----------------------------------------------담기버튼 만들기

	$(".btn-payment").on('click', function() {
		

		for(let i = 0; i < menuList_count; i++){
			//주문표에 있는 메뉴 이름,가격,숫자를 가져온다.
		
			
			let menu_name_ori = $(".cart-add-list").find("." + "item_" + i).find('.menu_name').text();
			let menu_price_ori = $(".cart-add-list").find("." + "item_" + i).find('.menu_price').text();
			let menu_count_ori = $(".cart-add-list").find("." + "item_" + i).find('.menu_count').text();
			

			
	 		menu_name_ori = menu_name_ori.replace(/(\s*)/g, "");
			menu_price_ori = menu_price_ori.replace("금액:","");
			menu_price_ori = menu_price_ori.replace("원","");
			menu_count_ori = menu_count_ori.replace(" x ",""); 
			menu_count_ori = menu_count_ori.replace(" 개 ","");
		
		
			
			console.log(menu_name_ori);
			console.log(menu_price_ori);
			console.log(menu_count_ori);

			
			//빈에 넣어서 하나씩 db에 넣기 위해 ajax 통신 개시
			$.ajax({
				url : "${root }shop/cart",
				type : "get",
				dataType : "text", 
				data : { 
					"menu_name" : menu_name_ori,//$(".cart-add-list").find("." + "item_" + i).find('.menu_name').text(),
					"menu_price" : menu_price_ori,//$(".cart-add-list").find("." + "item_" + i).find('.menu_price').text(),
					"menu_count" : menu_count_ori,
					"stord_id" : "${oneMarketInfo.store_id}"
				},
				
				
				//응답 오바
				success : function (data){
					console.log(data);
					location.href = "${root }order/cart?store_name=${market_name}";
				},
				
				error : function(error) {
				        console.log(error);
				}
			
			});
		}

		 
	});
	</script>
	
	<!-- Bootstrap CDN -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


</body>
</html>