<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function limitKey(event) {

		var key = event.key;
		var key2 = event.keyCode;

		if (key === '-' || key2 == "109") {
			alert("하이픈키를 입력하지 마십시오.");
			event.preventDefault();
			var str = document.getElementById("phone").value;
			str.slice(0, -1);
			document.getElementById('phone').value = str.slice(0, -1)

		}

	}

	function directEnter() {
		if ($("#emailSelect").val() == 1) {
			document.querySelector('#emailSelect').style.display = "none";
			document.querySelector('#directEnter').style.display = "block";

		}
	}

	function directInput(event) {

		if (event.key === '@') {
			event.preventDefault();

		}

	}
	function checkCustIdExist(){
		//변수선언 : 사용자가 입력한 id값 가져오기
		var cust_id = $("#cust_id").val()
		//아이디를 입력하지 않았을 경우
		if(cust_id.length == 0){
			alert('아이디를 입력해주세요')
			return
		}
		
		$.ajax({
			//요청할 주소
			url : '${root}Customer/checkCustIdExist/' + cust_id,
			//요청타입
			type : 'get',
			//응답결과
			dataType : 'text',
			//성공시 호출할 함수
			success : function(result){
				if(result.trim() == 'true'){
					alert('사용할 수 있는 아이디입니다')
					$("#cust_idExist").val('true')
				} else if(result.trim() == 'false'){
					alert('사용할 수 없는 아이디 입니다')
					$("#cust_idExist").val('false')
				}
			}
		})
	}
	//사용자 아이디란에 입력하면 무조건 false
	function resetCustIdExist(){
		$("#cust_idExist").val('false')
	}
	
	
	
	
</script>


<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>

<body>

<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />
	
	<div class="container" style="margin: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">

						<h1 align="center">회원가입</h1>

						<div id="form">
							<form:form action="${root}Customer/insert"
								modelAttribute="joinCustomerBean" method="post" enctype="multipart/form-data">
								<form:hidden path="cust_idExist" />
								<div class="form-group">
									<form:label path="cust_id">아이디</form:label>
									<div class="input-group">
										<form:input path="cust_id" placeholder="ID는 영문과 숫자로 입력해 주십시오."
											class="form-control" onkeypress="resetCustIdExist()" />
										<div class="input-group-append">
											<button type="button" class="btn btn-success"
												onclick='checkCustIdExist()'>중복확인</button>
										</div>
								
										
									</div>
									<form:errors path="cust_id" style="color:red" />
								</div>




								<div class="form-group">
									<form:label path="cust_pw">비밀번호</form:label>
									<form:password path="cust_pw" placeholder="비밀번호를 입력하십시오"
										class="form-control" />
									<form:errors path="cust_pw" style="color:red" />
								</div>
								<div class="form-group">
									<form:label path="cust_pw2">비밀번호확인</form:label>
									<form:password path="cust_pw2"
										placeholder="비밀번호를 한번 더 입력하십시오.." class="form-control" />
									<form:errors path="cust_pw2" style="color:red" />
								</div>

								<div class="form-group">
									<form:label path="cust_name">이름</form:label>
									<form:input path="cust_name" placeholder="성함을 입력하십시오"
										class="form-control" />
									<form:errors path="cust_name" style="color:red"/>
								</div>

								<div class="form-group">
									<form:label path="cust_phone">휴대폰번호</form:label>
									<form:input path="cust_phone"
										placeholder="숫자만 입력하여 주세요 예(01012341234)" id="phone"
										class="form-control" onkeydown="limitKey(event);" />
									<form:errors path="cust_phone" style="color:red" />
								</div>



								<div class="form-group">

									<form:label path="cust_email">이메일</form:label>
									<form:input path="cust_email"
										placeholder="이메일을 입력하세요. 예) hong@welcometogo.com"
										class="form-control phone" />
									<form:errors path="cust_email" style="color:red" />
								</div>
								
								
								<div class="form-group">
			                        <form:label path="upload_file">프로필 이미지</form:label> 
			                        <form:input type="file"
			                           path="upload_file" class="form-control"
			                           accept="image/*" />
			                     </div>
								
								
								<form:label path="cust_nickname">별명</form:label>
								<form:input path="cust_nickname" class="form-control" />
								<form:errors path="cust_nickname" style="color:red" />
								<br />
								<br />

								<div class="form-group text-right" id="commit">
									<form:button type="submit" class="btn btn-success"> 확인 </form:button>
									<form:button type="reset" class="btn btn-success"> 취소 </form:button>
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
<!-- 하단메뉴 임포트  -->
	<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
	
</body>
</html>