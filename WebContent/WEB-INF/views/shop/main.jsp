<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title>휴게소 검색</title>
</head>

<body>
	<!-- nav bar -->
	<c:import url="/WEB-INF/views/include/top_menu.jsp" />

	<div class="shops wrapper">
		<div class="main-content">
			<!-- 휴게소 검색 & 리스트 -->
			<div class="left">
				<!-- 휴게소 검색 -->
				<div style="padding: 10px;">
					<form:form action="${root}shop/proc" method="get" modelAttribute="searchMarketBean">
						<form:input path="searchKeyword" class="form-control" placeholder="${keyword_name}" id="keyword"/>
						<form:errors path="searchKeyword" style="color:red"/>  
						<form:button style="background-color:var(--green-dark); border: var(--green-dark);" class="btn btn-success" id="btn-movies-find" onclick="checkSearchWord()">휴게소찾기</form:button>
					</form:form>
				</div>

				<!-- 휴게소 리스트 (body) -->
				<div class="shopList">
					<c:import url="/WEB-INF/views/shop/main_body.jsp" />
				</div>
			</div>

			<!-- map 표시부분 -->
			<div class="mapBox right" id="map"></div>
		</div>

		<!-- 하단메뉴 임포트  -->
		<c:import url="/WEB-INF/views/include/bottom_menu.jsp" />
		
		<div id="fff" style="display: none"></div>
		<div id="fff2" style="display: none"></div>
	</div>
		
	
	<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e55d072086b25344a15de0f68b1b0812&libraries=services,clusterer,drawing"></script>
		
		<script>
		
			// 마커를 담을 배열입니다
			var markers = [];

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			
			mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 7
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();
			
			
			var iwContent = 
				'<div class="thisIsTest" style="padding:30px; background-color:red;"></div>';
				 // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; 
			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				zIndex : 1

			});
			
			// 키워드로 장소를 검색합니다
			searchPlaces();

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

				var keyword = document.getElementById('keyword').value;

/* 				if (!keyword.replace(/^\s+|\s+$/g, '')) {
					alert('키워드를 입력해주세요!');
					return false;
				} */

				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				ps.keywordSearch("${keyword_name}", placesSearchCB);
			}
	
			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면
					// 검색 목록과 마커를 표출합니다
					displayPlaces(data);

					// 페이지 번호를 표출합니다
					displayPagination(pagination);

				} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

					//alert('검색 결과가 존재하지 않습니다.');
					return;

				} else if (status === kakao.maps.services.Status.ERROR) {

					alert('검색 결과 중 오류가 발생했습니다.');
					return;

				}
			}

			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {
				//목록은 fff태그에 가져가서 붙여버리고 리스트 태그 id는 fff2
				var listEl = document.getElementById('fff'), menuEl = document
						.getElementById('fff2'), fragment = document
						.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
				// 검색 결과 목록에 추가된 항목들을 제거합니다
				removeAllChildNods(listEl);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();
				
				for (var i = 0; i < places.length; i++) {
					// 마커를 생성하고 지도에 표시합니다
					var placePosition = new kakao.maps.LatLng(places[i].y,
							places[i].x), 
						marker = addMarker(placePosition, i), 
						itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
						console.log(itemEl)
					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(placePosition);

					// 마커와 검색결과 항목에 mouseover 했을때
					// 해당 장소에 인포윈도우에 장소명을 표시합니다
					// mouseout 했을 때는 인포윈도우를 닫습니다
					(function(marker, title) {
						kakao.maps.event.addListener(marker, 'click',
								function() {
									displayInfowindow(marker, title, places[i]);
								});

						kakao.maps.event.addListener(marker, '',
								function() {
									infowindow.close();
								});

					/* 	itemEl.onmouseover = function() {
							displayInfowindow(marker, title);
						};

						itemEl.onmouseout = function() {
							infowindow.close();
						}; */
					})(marker, places[i].place_name);

					fragment.appendChild(itemEl);
					
				}
	
				// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
				listEl.appendChild(fragment);
				menuEl.scrollTop = 0;

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {
				
				
				
				
				itemStr3 = 
				'<div class="shopBox accordion-item">'
				+ '<div class="accordion-header" id="heading">'
			 	+ '<div class="shopInfo">'
				+				'<div>'
				+					'<h5 class=" font-weight-light">'+places.place_name+'</h5>'
				+				'</div>'
					
				+				'<div class="button text-center flexbox">'
				+					'<a href="${root}shop/ea?market_name="안성휴게소(부산방향)"  class="btn btn-outline-success">휴게소가기 </a>'
				+				'</div>'

				+			'</div>'
				+		'</div>'
			
				+	'</div>'
			
				+'<div class="shopBox accordion-item">'
				+'<div class="accordion-header" id="heading_${status.index}">'
				+	'<div class="shopInfo">'
				+		'<div>'
				+			'<h3 class=" font-weight-light">${shop.store_name}</h3>'
				+			'<p>고속도로 방면: ${shop.store_highway}</p>'
				+		'</div>'
						<!-- 휴게소 가기 -->
				+		'<div class="button text-center flexbox">'
				+			'<a href="${root}shop/ea?market_name=${shop.store_name}"  class="btn btn-outline-success">휴게소가기 </a>'
				+		'</div>'

				+	'</div>'
				+		'<button class="moreInfo accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse_${status.index}" aria-expanded="false" aria-controls="collapse_${status.index}">상세설명'
				+		'</button>'
				+'</div>'
				<!-- 상세보기 -->
				+'<div id="collapse_${status.index}"'
				+	'class="accordion-collapse collapse"'
				+	'aria-labelledby="heading_${status.index}"'
				+	'data-bs-parent="#accordionExample">'
				+	'<div class="accordion-body">'
				+		'<p>'
				+			'<small class="text-muted">주소: ${shop.store_addr}</small>'
				+		'</p>'
				+		'<p>'
				+			'<small class="text-muted">전화번호: ${shop.store_phone}</small>'
				+		'</p>'
				+		'<p>'
				+			'<small class="text-muted">영업시간: ${shop.store_open} ~'
				+				'${shop.store_close} </small>'
				+		'</p>'
				+		'<p>'
				+			'<small class="text-muted">대표메뉴: </small>'
				+		'</p>'
				+		'<p>'
				+			'<small class="text-muted">별점: ${shop.store_staravg}</small>'
				+		'</p>'
				+		'<p>'
				+			'<small class="text-muted">리뷰수: ${shop.store_reviewcnt}</small>'
				+		'</p>'
				+	'</div>';
				
				
				
				
				
				
				
				
				/* itemStr2 = '<div class="shopBox accordion-item">'
					+ '<div class="accordion-header" id="flush-heading${status.index}">'
				+ '<div class="shopInfo">'
				+ '<div>'
				+ '<h3 class="font-weight-light">${shop.store_name}</h3>'
				+ '<p>고속도로 방면:' 
				+ places.place_name
				+ '</p>'
				+ '</div>'
					<!-- 휴게소 가기 -->
				+ '<div class="button text-center flexbox">'
				+ '<a href="${root}shop/ea?market_name=' + places.place_name +'" class="btn btn-info">휴게소보기 </a>'
				+ '</div>'
				+ '</div>'
				+ '<h1>'
				+	'<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse${status.index}" aria-expanded="false" aria-controls="flush-collapse${status.index}" >상세설명</button>'
				+ '</h1>'
				+ '</div>'
			<!-- 상세보기 -->
			+ '<div id="flush-collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="flush-heading${status.index}" data-bs-parent="#accordionFlushExample">'
			+	'<div class="accordion-body">'
			+   '<p><small class="text-muted">주소: ${shop.store_addr}</small></p>'
			+		'<p><small class="text-muted">전화번호: ${shop.store_phone}</small></p>'
			+		'<p><small class="text-muted">영업시간: ${shop.store_open} ~ ${shop.store_close} </small></p>'
			+		'<p><small class="text-muted">대표메뉴: </small></p>'
			+		'<p><small class="text-muted">별점: ${shop.store_staravg}</small></p>'
			+		'<p><small class="text-muted">리뷰수: ${shop.store_reviewcnt}</small></p>'
			+	'</div>'
			+'</div>'
			+'</div>';
				 */
				

				var el = document.createElement('div'), itemStr = '<span class="markerbg marker_'
						+ (index + 1)
						+ '"></span>'
						+ '<div class="info">'
						+ '   <h5>'
						+ (index + 1)
						+ '</h5>'
						+ '   <h5>'
						+ places.place_name
						+ '</h5>'
						+ '   <a href="${root }shop/ea?market_name='
						+ "안성휴게소(부산방향)" + '">' + '상세보기' + '</a><br/>';

				if (places.road_address_name) {
					itemStr += '    <span>' + places.road_address_name
							+ '</span>' + '   <span class="jibun gray">'
							+ places.address_name + '</span>';
				} else {
					itemStr += '    <span>' + places.address_name + '</span>';
				}

				itemStr += '  <span class="tel">' + places.phone + '</span>'
						+ '</div>';

				el.innerHTML = itemStr3;
				el.className = 'item';

				return el;
			}
			
			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
				var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
					spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new kakao.maps.Point(13, 37)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new kakao.maps.MarkerImage(imageSrc,
						imageSize, imgOptions), marker = new kakao.maps.Marker(
						{
							position : position, // 마커의 위치
							image : markerImage
						});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
				var paginationEl = document.getElementById('pagination'), fragment = document
						.createDocumentFragment(), i;

				// 기존에 추가된 페이지번호를 삭제합니다
				while (paginationEl.hasChildNodes()) {
					paginationEl.removeChild(paginationEl.lastChild);
				}

				for (i = 1; i <= pagination.last; i++) {
					var el = document.createElement('a');
					el.href = "#";
					el.innerHTML = i;

					if (i === pagination.current) {
						el.className = 'on';
					} else {
						el.onclick = (function(i) {
							return function() {
								pagination.gotoPage(i);
							}
						})(i);
					}

					fragment.appendChild(el);
				}
				paginationEl.appendChild(fragment);
			}

			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
				var content = "";
				
				if(title == "서울만남의광장휴게소 부산방향"){
					content = '<div style="width:350px;  margin:10px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<img src="${root }image/rest/서울만남의광장 부산방향.jpg"  width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=서울만남의광장휴게소(부산방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				 if(title == "죽전휴게소 서울방향"){
				content = '<div style="width:300px; margin:10px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
					+ '<img src="${root }image/rest/죽전휴게소 서울방향.jpg" width="100" height="100"/>'
					+ '<br/>'
					+ '<a href="${root }shop/ea?market_name=죽전휴게소(서울방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
				    + '휴게소가기' + '</a><br/>'
					+ '</div>';
				}
				
				if(title == "기흥휴게소 부산방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/기흥휴게소 부산방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=기흥휴게소(부산방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "안성휴게소 서울방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/안성휴게소 서울방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=안성휴게소(서울방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
		
				
				if(title == "안성휴게소 부산방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/안성휴게소 부산방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=안성휴게소(부산방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "입장거봉포도휴게소 서울방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/입장거봉포도휴게소 서울방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=입장거봉포도휴게소(서울방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "망향휴게소 부산방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/망향휴게소 부산방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=망향휴게소(부산방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "천안호두휴게소 부산방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/천안호두휴게소 부산방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=천안호두휴게소(부산방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "옥산휴게소 부산방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/옥산휴게소 부산방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=옥산휴게소(부산방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "신탄진 휴게소 서울방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/신탄진 휴게소 서울방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=신탄진 휴게소(서울방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "금강휴게소 양방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/금강휴게소 양방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=금강휴게소(양방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "추풍령휴게소 서울방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/추풍령휴게소 서울방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=추풍령휴게소(서울방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				}
				
				if(title == "칠곡휴게소 서울방향"){
					content = '<div style="width:300px; padding:20px;z-index:1; display: flex; flex-direction:column; align-items: center; justify-content: center;">' + '<h3 class=" font-weight-light">'+title+'</h3>'
						+ '<br/>'
						+ '<img src="${root }image/rest/칠곡휴게소 서울방향.jpg" width="100" height="100"/>'
						+ '<br/>'
						+ '<a href="${root }shop/ea?market_name=칠곡휴게소(서울방향)" class="text-uppercase py-0 px-2 rounded-lg  border mb-2 d-inline-block" style="color:var(--green-dark);">'
					    + '휴게소가기' + '</a><br/>'
						+ '</div>';
				} 
				

				infowindow.setContent(content);
				infowindow.open(map, marker);
			}

			// 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {
				while (el.hasChildNodes()) {
					el.removeChild(el.lastChild);
				}
			}
		</script>
<link rel="stylesheet" href="${root}css/style_main.css" />	
</body>
</html>