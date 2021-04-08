<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">

<title>payment </title>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>




<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>

<link href='https://use.fontawesome.com/releases/v5.7.2/css/all.css'>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

   <link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- 아름이꺼  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous"/>
<link rel="stylesheet" href="${root}css/style_main.css" />

<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- js v5.0 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>




<!--  -->

<style>


body {
    background-color: #f5f6f7
}

.wrapper {
    width: 50%;
    margin-top: 50px
}

@media(max-width:992px) {
    .wrapper {
        width: 100%
    }
}

.panel-heading {
    padding: 0;
    border: 0;
    padding: 9px 3px !important
}

.panel-title>a,
.panel-title>a:active {
    display: block;
    padding: 10px;
    color: #000;
    font-size: 16px;
   
    text-transform: uppercase;
    letter-spacing: 1px;
    word-spacing: 3px;
    text-decoration: none
}

.panel-heading a:before {
    font-family: 'Glyphicons Halflings';
    /* content: "\e114"; */
    float: right;
    transition: all 0.5s
}

.panel-heading.active a:before {
    -webkit-transform: rotate(180deg);
    -moz-transform: rotate(180deg);
    transform: rotate(180deg)
}

.panel-default>.panel-heading {
    color: #282b2f;
    background-color: #ffffff !important;
    border-color: #d5d5d5
}

@keyframes click-wave {
    0% {
        height: 40px;
        width: 40px;
        opacity: 0.15;
        position: relative
    }

    100% {
        height: 200px;
        width: 200px;
        margin-left: -80px;
        margin-top: -80px;
        opacity: 0
    }
}

.option-input {
    -webkit-appearance: none;
    -moz-appearance: none;
    -ms-appearance: none;
    -o-appearance: none;
    appearance: none;
    position: relative;
    top: -8.66667px;
    right: 0;
    bottom: 0;
    left: 0;
    height: 24px;
    width: 24px;
    transition: all 0.15s ease-out 0s;
    background: #cbd1d8;
    border: none;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    margin-right: 0.5rem;
    outline: none;
    position: relative;
    z-index: 1000
}

.option-input:hover {
    background: #9faab7
}

.option-input:checked {
    background: rgb(0, 64, 0);
   }



.option-input.radio {
    border-radius: 50%
}

.option-input.radio::after {
    border-radius: 50%
}

.checkbox input[type="checkbox"],
.checkbox-inline input[type="checkbox"] {
    float: left;
    margin-left: 0px  !important;
    margin-top: 9px
}

input[type="checkbox"]:focus {
    outline: thin dotted #333;
    outline: 0px auto -webkit-focus-ring-color;
    outline-offset: 0px
}

.ml-10 {
    margin-left: 10px;
    font-size: 15px;
    color: #080808
}

.ml-11 {
    display:inline-block;
     margin:3px 3px; 
     padding:10px; 
    font-size: 15px;
    color: #080808
}



.btn {
    border-radius: 2px;
    text-transform: capitalize;
    font-size: 16px;
    padding: 10px 19px;
    cursor: pointer;
    color: #fff;
}

.fa {
    font-size: 12px;
    color: #2874ef
}

.refine {
    padding: 0px 0px !important
}

.filters-text {
    background: #fff;
    border: 1px solid #d5d5d5;
    margin-bottom: 15px;
    padding: 12px
}

.filter-span {
    font-size: 20px;
  color:  #003d00;
}


a:hover{
color : #33691e;

} 
 
 


textarea:focus, input:focus, input[type]:focus, .uneditable-input:focus ,select:focus {
    border-color:#629749 !important;
    box-shadow: 0px 0px 3px 1.5px #629749, 0 0 1px #629749 !important;
    outline: 0 none;
}
 body {
    background-color: #f5f6f7
}

.wrapper {
    width: 50%;
    margin-top: 50px
}

@media(max-width:992px) {
    .wrapper {
        width: 100%
    }
}

.panel-heading {
    padding: 0;
    border: 0;
    padding: 9px 3px !important
}

.panel-title>a,
.panel-title>a:active {
    display: block;
    padding: 10px;
    color: #000;
    font-size: 16px;
   
    text-transform: uppercase;
    letter-spacing: 1px;
    word-spacing: 3px;
    text-decoration: none
}

.panel-heading a:before {
    font-family: 'Glyphicons Halflings';
    /* content: "\e114"; */
    float: right;
    transition: all 0.5s
}

.panel-heading.active a:before {
    -webkit-transform: rotate(180deg);
    -moz-transform: rotate(180deg);
    transform: rotate(180deg)
}

.panel-default>.panel-heading {
    color: #282b2f;
    background-color: #ffffff !important;
    border-color: #d5d5d5
}

@keyframes click-wave {
    0% {
        height: 40px;
        width: 40px;
        opacity: 0.15;
        position: relative
    }

    100% {
        height: 200px;
        width: 200px;
        margin-left: -80px;
        margin-top: -80px;
        opacity: 0
    }
}

.option-input {
    -webkit-appearance: none;
    -moz-appearance: none;
    -ms-appearance: none;
    -o-appearance: none;
    appearance: none;
    position: relative;
    top: -8.66667px;
    right: 0;
    bottom: 0;
    left: 0;
    height: 24px;
    width: 24px;
    transition: all 0.15s ease-out 0s;
    background: #cbd1d8;
    border: none;
    color: #fff;
    cursor: pointer;
    display: inline-block;
    margin-right: 0.5rem;
    outline: none;
    position: relative;
    z-index: 1000
}

.option-input:hover {
    background: #9faab7
}

.option-input:checked {
    background: rgb(0, 64, 0);
   }



.option-input.radio {
    border-radius: 50%
}

.option-input.radio::after {
    border-radius: 50%
}

.checkbox input[type="checkbox"],
.checkbox-inline input[type="checkbox"] {
    float: left;
    margin-left: 0px  !important;
    margin-top: 9px
}

input[type="checkbox"]:focus {
    outline: thin dotted #333;
    outline: 0px auto -webkit-focus-ring-color;
    outline-offset: 0px
}

.ml-10 {
    margin-left: 10px;
    font-size: 15px;
    color: #080808
}

.ml-11 {
    display:inline-block;
     margin:3px 3px; 
     padding:10px; 
    font-size: 15px;
    color: #080808
}



.btn {
    border-radius: 2px;
    text-transform: capitalize;
    font-size: 16px;
    padding: 10px 19px;
    cursor: pointer;
    color: #fff;
}

.fa {
    font-size: 12px;
    color: #2874ef
}

.refine {
    padding: 0px 0px !important
}

.filters-text {
    background: #fff;
    border: 1px solid #d5d5d5;
    margin-bottom: 15px;
    padding: 12px
}

.filter-span {
    font-size: 20px;
  color:  #003d00;
}


a:hover{
color : #33691e;

} 
 
 


textarea:focus, input:focus, input[type]:focus, .uneditable-input:focus ,select:focus {
    border-color:#629749 !important;
    box-shadow: 0px 0px 3px 1.5px #629749, 0 0 1px #629749 !important;
    outline: 0 none;
}
 
 
  
</style>
</head>






<body>

	
<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div style="display:flex; padding:100px ;">
	<div style=" width:100%; background-color: #F5F5F5;">
	<form:form action="${root }order/payment_pro" method="post" modelAttribute="ordersBean">
	<div class="d-flex justify-content-center">
		<div class="wrapper center-block">
			<div class="filters-text">
				<span class="filter-span">결제하기 </span>
			
			</div>
			<div class="panel-group" id="accordion" role="tablist">
				
				
				<!-- 결제정보 -->
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="heading1">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapse1"> 결제정보 </a>
						</h4>
						
					</div>
					<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
						
						<div class="panel-body">
						
						<table class="table">
						<tbody >
						<tr>
							<th>${store_name}</th>
						</tr>	
						
						<tr>
							<td style="color:light-grey;">${menu_str }</td>
						</tr>	
						
						
						
								<tr>
										<td >
										<form:input  value="${cust_phone}" path="order_contact" style="background-color:transparent;border:0 solid black; "/>
										&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
										<a href="#" style="color : #629749; text-decoration:none ; "onclick="openChild()">변경</a> 
										</td>
					
								</tr>

					     
						
						
						<tr>
							<th style="font-size:large;">합계 : ${total_price } 원</th>
							</tr>
						

							</table>
						</div>
					</div>
				</div>
				
				<!-- 요청사항시작 -->
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="heading2">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapse2" aria-expanded="false"
								aria-controls="collapse2"> 요청사항 </a>
						</h4>
					</div>
				
					
					<div id="collapse2" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="heading2">
						<div cass="panel-body">

							<div class="myRequest">
								<!-- <label for="order_req" class="col-lg-2 control-label"> -->
								<span class="ml-11">가게 사장님께 </span>
								<form:input class="form-control request" path="order_req"
									placeholder="예) 견과류 빼주세요, 덜맵게 해주세요" maxlength="20" />
							</div>
							<br>




							<div class="checkbox">

								<!--  체크옵션 받기  -->
								            
								<form:checkbox path="useAgain" class="option-input checkbox" value="1" label="다음에도 사용"/>
								<br/>
								<br/>
								<form:checkbox path="noDisposable" class="option-input checkbox" value="1" label="일회용 수저,포크 안주셔도 돼요" />
								<br/>
							</div>

						</div>

					</div>
					

				</div>
				<!-- 요청사항 끝 -->

				<!-- 결제수단 -->
				
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="heading3">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapse3" aria-expanded="false"
								aria-controls="collapse3"> 결제수단 </a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse" role="tabpanel"
						aria-labelledby="heading3">
						<div class="panel-body">
							<div class="form-group">
								<br> <label for="pmt_method"><span
									class="select_payment"
									style="font-size: 12pt; font-weight: bold;">&nbsp;결제수단을
										선택해주세요</span></label><br>

								  
              
                      <div class="select_payment">
              
              <form:select class="form-control" path="pmt_method" style="font-size:16px" >
              <form:option value="선택">선택</form:option>
              <form:option value="신용카드">신용카드</form:option>
              <form:option value="카카오페이">카카오페이</form:option>
              <form:option value="페이코">페이코</form:option>
              </form:select> 
              
								</div>
							</div>


						</div>
					</div>
				</div>
				<!-- 결제수단 끝 -->


			</div>
		</div>
	</div>
	
	<br />
	<div class=" text-center refine">
		<form:button class="btn btn-out btn-success btn-square btn-xlarge"
			id="button-filter">결제하기</form:button>
	</div>
	<br />
	<!-- 필요없거나 시퀀스로 올라가는건 여기서 전부 무의미한 값으로 처리 -->
	<!-- order_num 시퀀스값 -->
	<form:hidden path="order_num" value="20"/>
	<!-- 로그인 아이디로 가져옴  -->
	<form:hidden path="cust_id" value="${loginUserBean.cust_id }"/>
	<!-- mycart정보에 있음 -->
	<form:hidden path="store_id" value="${myCart[0].store_id }"/>
	<!-- 무의미한값 -->
	<form:hidden path="menu_id" value="41"/>
	<!-- 무의미한 값 : 총 음식 주문개수-->
	<form:hidden path="order_quant" value="${my_cart_orderSize}"/>
	<!-- db에서 저장될값 -->
	<form:hidden path="order_date" value="19700101"/>
	<!-- 총가격 -->
	<form:hidden path="total_pmt" value="${total_price }"/>
	<form:hidden path="menu_name" value="${menu_str}"/>
	<!--<form:hidden path="pmt_method" value="신용카드"/>-->
	
	<!-- 입력으로 받아야 할것 req, pmt_method-->

	</form:form>
	
	</div>
	
</div>

<!-- 하단메뉴 임포트  -->
		<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
		


	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/scripts.js"></script>
	
	
	
	
<!-- 모달창 -->
    <script type="text/javascript">
    
        var openWin;
    
        function openChild()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window(경로인가??)", "자식창 이름", "팝업창 옵션");
            openWin = window.open("${root}order/child",
                    "childForm", "width=400, height=200, resizable = no, scrollbars = no");    
        }
        
     


        </script>


</body>
</html>
