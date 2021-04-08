<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='root' value='${pageContext.request.contextPath}/' />


<!DOCTYPE html>
<html>

<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- 설정한 시간(여기서는 5초) 후에 페이지 자동 이동 예 -->

<!-- 혹은 자바스크립트사용. 스크립트 사용해놨음! -->
<!-- http://blog.naver.com/PostView.nhn?blogId=gtime4u&logNo=36671112&from=search 참고 -->

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<script src="https://kit.fontawesome.com/2d323a629b.js"
	crossorigin="anonymous"></script>

<style type="text/css">
body, table, td, a {
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}

table, td {
	mso-table-lspace: 0pt;
	mso-table-rspace: 0pt;
}

img {
	-ms-interpolation-mode: bicubic;
}

img {
	border: 0;
	height: auto;
	line-height: 100%;
	outline: none;
	text-decoration: none;
}

table {
	border-collapse: collapse !important;
}

body {
	height: 100% !important;
	margin: 0 !important;
	padding: 0 !important;
	width: 100% !important;
}

a[x-apple-data-detectors] {
	color: inherit !important;
	text-decoration: none !important;
	font-size: inherit !important;
	font-family: inherit !important;
	font-weight: inherit !important;
	line-height: inherit !important;
}

@media screen and (max-width: 480px) {
	.mobile-hide {
		display: none !important;
	}
	.mobile-center {
		text-align: center !important;
	}
}

div[style*="margin: 16px 0;"] {
	margin: 0 !important;
}
</style>
<body
	style="margin: 0 !important; padding: 0 !important; background-color: #eeeeee;"
	bgcolor="#eeeeee">

	<table
		style="border: 0px; padding: 0px; border-spacing: 0px; width: 100%;">
		<tr>
			<td align="center" style="background-color: #eeeeee;"
				bgcolor="#eeeeee">
				<table align="center" border="0" cellpadding="0" cellspacing="0"
					width="100%" style="max-width: 600px;">
					<tr>
						<td align="center" valign="top"
							style="font-size: 0; padding: 35px;" bgcolor="#33691e;">
							<div
								style="display: inline-block; max-width: 50%; min-width: 100px; vertical-align: top; width: 100%;">
								<table align="left" border="0" cellpadding="0" cellspacing="0"
									width="100%" style="max-width: 300px;">
									<tr>
										<td align="center" valign="top"
											style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;"
											class="mobile-center">
											<h1
												style="font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;">결제
												완료!</h1>
										</td>
									</tr>
								</table>
							</div>



						</td>
					</tr>
					<tr>
						<td align="center"
							style="padding: 35px 35px 10px 35px; background-color: #ffffff;"
							bgcolor="#ffffff">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 600px;">
								<tr>
									<td align="center"
										style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;">
										<img
										src="https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png"
										width="125" height="120" style="display: block; border: 0px;" /><br>
										<h2
											style="font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;">
											주문해주셔서 감사해요!</h2>
									</td>
								</tr>
								<tr>
									<td align="center"
										style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 10px;">
										<p
											style="font-size: 16px; font-weight: 400; line-height: 24px; color: #777777;">고객님의
											주문이 잘 전달되었습니다. 휴게소에서 연락이 갈거에요!</p>
									</td>
								</tr>
								<tr>
									<td align="left" style="padding-top: 20px;">

										<table cellspacing="0" cellpadding="0" border="0" width="100%">
											<tr>
												<td width="75%" align="left" bgcolor="#eeeeee"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;">
													주문 번호</td>
												<td width="25%" align="left" bgcolor="#eeeeee"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;">
													${orderViewBean.order_num}</td>
											</tr>


											<tr>
												<td width="75%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;">
													${ orderViewBean.menu_name } &nbsp; (수량 :
													${orderViewBean.order_quant } 개)</td>
												<td width="25%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;">
													${orderViewBean.total_pmt } 원</td>
											</tr>


										</table>
									</td>
								</tr>
								<tr>
									<td align="left" style="padding-top: 20px;">
										<table cellspacing="0" cellpadding="0" border="0" width="100%">
											<tr>
												<td width="75%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;">
													총 주문금액</td>
												<td width="25%" align="left"
													style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px; border-top: 3px solid #eeeeee; border-bottom: 3px solid #eeeeee;">
													${orderViewBean.total_pmt} 원</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" height="100%" valign="top" width="100%"
							style="padding: 0 35px 35px 35px; background-color: #ffffff;"
							bgcolor="#ffffff">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 660px;">
								<tr>
									<td align="center" valign="top" style="font-size: 0;">
										<div
											style="display: inline-block; max-width: 50%; min-width: 240px; vertical-align: top; width: 100%;">
											<table align="left" border="0" cellpadding="0"
												cellspacing="0" width="100%" style="max-width: 300px;">
												<tr>
													<td align="center" valign="top"
														style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
														<p style="font-weight: 800;">픽업하실 주소</p>
														<p>${store_addr}</p>
													</td>
												</tr>
											</table>
										</div>


										<div
											style="display: inline-block; max-width: 50%; min-width: 240px; vertical-align: top; width: 100%;">
											<table align="left" border="0" cellpadding="0"
												cellspacing="0" width="100%" style="max-width: 300px;">
												<tr>
													<td align="center" valign="top"
														style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
														<p style="font-weight: 800;">휴게소 전화번호</p>
														<p>${store_phone}</p>
													</td>
												</tr>



											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>


					<!-- 로고부분 -->
					<tr>
						<td align="center"
							style="padding: 5px 35px 20px 35px; background-color: #ffffff;"
							bgcolor="#ffffff">
							<table align="center" border="0" cellpadding="0" cellspacing="0"
								width="100%" style="max-width: 600px;">


								<tr>
									<td align="center"
										style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-weight: 400; line-height: 24px; padding-top: 25px;">
										<h4>
											<i class="fas fa-utensils"></i> &nbsp; &nbsp; <span
												id="count">5</span>초 후 메인으로 이동해요! &nbsp; &nbsp; <i
												class="fas fa-utensils"></i>
										</h4>
										<h1 style="color: #003d00">
											다음에 또 보고~ <i class="fas fa-hand-sparkles"></i>
										</h1>

									</td>
								</tr>


								<!-- <tr style="display: flex; flex-direction: column;">
									<td align="center"
										style="font-family: font-weight : 400; line-height: 24px; padding-top: 25px;">
										<h4 style="color: #003d00;">
											<i class="fas fa-utensils"></i> &nbsp; &nbsp; <span
												id="count">5</span>초 후 메인으로 이동해요! &nbsp; &nbsp; <i
												class="fas fa-utensils"></i>
										</h4>
									</td>
									<br>
									<td align="center" style="color: #003d00;">
										

										<h2
											style="font-size: 24px; font-weight: 800; line-height: 30px; color: #ffffff; margin: 0;">
											Get 30% off your next order.</h2>
									</td>
								</tr> -->



							</table>
						</td>
					</tr>

				</table>

			</td>
		</tr>
	</table>



	<script type="text/javascript">
		var cnt = 5;
		var msg = document.getElementById('count');

		//화면에 카운트 다운을 보여주기 위한 타이머
		setInterval(function() {
			cnt--;
			msg.innerHTML = cnt;
		}, 1000);

		setTimeout(function() {
			alert("메인으로 이동합니다.");
			location.href = "${root}index";//a태그와 같은 역할을 하는 녀석// "${root}main"
		}, 5000);
	</script>





</body>