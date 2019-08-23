<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood소개</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/subpage.css" rel="stylesheet" type="text/css">

<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be4510b5ceacfed090ef51cbd4b0466f&libraries=services,clusterer,drawing"></script>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
	// ■■■■■■■■■■■■■■■■■■■■■■ 영어번역 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■
	function intro_eng() {
		$
				.ajax({
					success : function() {

						var a = "", b = "", c = "", directions = "", address = "";
						a += "<p>''<br>But it was not easy to find a food market that is right for us. <br>'So what if we make it ourselves?' <br>That's how SolFood started in 2015. <br>''</p>";
						$("#company1").html(a);

						b += "<p>''<br>People who believe that delicious food is the greatest joy of life have joined together. <br>'Solfood' team members have already been in the team for a good time for the good stuff, overseas fastball, department store, neighborhood mart, traditional market, <br>Furthermore, it was a fierce consumer who searched the mountains of the country and compared quality and price.<br>I was so sad to know only my family and the great producers and the best food we found. <br>''</p>";
						$("#company2").html(b);

						c += "<p>''<br>A vague idea that only expensive food is good food <br>I wanted to introduce a real flavor to consumers.<br>A master who immerses himself in the desert for decades in a mountainous area, <br>I wanted to find a stable sales force for the farmers who insist on pesticides, even though they would have to flee.<br>To be able to live happily and tasty lives from producers, consumers and sellers <br>'Solfood' is struggling today with hard feet. <br>''</p>";
						$("#company3").html(c);

						directions += "<p>Directions</p>";
						$("#directions").html(directions);

						address += "<p>12th Street, Jongno Road, Kuncheon-dong, Jongno-gu, Seoul, Korea<br>TEL: 02-6901-7001</p>"
						$("#address").html(address);
					},
					error : function() {
						alert("test fail");
					}
				});
	}

	// ■■■■■■■■■■■■■■■■■■■■■■ 한글번역 버튼 ■■■■■■■■■■■■■■■■■■■■■■■■
	function intro_kor() {
		$
				.ajax({
					success : function() {

						var a = "", b = "", c = "", directions = "", address = "";
						a += "<p>''<br>이 세상에는 참 다양한 푸드마켓이 있습니다.<br>하지만 우리와 꼭 맞는 마음을 가진 푸드마켓을 찾기란 쉽지 않았습니다.<br>‘그렇다면 우리가 직접 만들어보면 어떨까?’ <br>2015년 'SolFood'는 그렇게 시작되었습니다.<br>''</p>";
						$("#company1").html(a);

						b += "<p>''<br>맛있는 음식이 삶의 가장 큰 즐거움이라 믿는 사람들이 뜻을 합쳤죠.<br>'Solfood'의 팀원들은 이미 팀을 꾸리기 전부터 좋은 재료를 위해서라면 해외 직구, 백화점, 동네 마트, 재래 시장,<br>더 나아가 전국 방방곡곡의 산지를 찾아 다니며 품질과 가격을 비교하던 깐깐한 소비자였습니다.<br>이렇게 찾아낸 훌륭한 생산자와 최상의 먹거리들을 나와 내 가족만 알고 있기에는 너무 아쉬웠습니다. <br>''</p>";
						$("#company2").html(b);

						c += "<p>''<br>비싼 식자재만이 좋은 음식일 것이라고 막연하게 생각하고 있는<br>소비자에게는 진짜 맛을 소개해드리고 싶었고,<br>뚝심 하나로 산골 오지에서 수십 년간 묵묵히 장을 담그는 명인, <br>시들어서 버릴지언정 무농약을 고집하는 농부에게는 안정적인 판매 활로를 찾아드리고 싶었습니다.<br>생산자와 소비자, 판매자까지 모두 행복하고 맛있는 삶을 살 수 있도록<br>'Solfood'는 오늘도 열심히 발로 뛰며 고민합니다.<br>''</p>";
						$("#company3").html(c);
						$("#company3").html(c);

						directions += "<p>찾아오시는 길</p>";
						$("#directions").html(directions);

						address += "<p>서울특별시 종로구 관철동 종로12길 15<br>연락처: 02-6901-7001</p>"
						$("#address").html(address);

					},
					error : function() {
						alert("test fail");
					}
				});
	}
</script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap')
	;

a {
	text-decoration: none;
}

a:link {
	color: black;
	text-decoration: none !important;
}

a:active {
	color: black !important;
	text-decoration: none !important;
}

a:visited {
	color: black !important;
	text-decoration: none !important;
}

a:hover {
	color: black !important;
	text-decoration: none !important;
}

.intro-text {
	color: gray !important;
	text-decoration: none !important;
	font-size: "12px";
	font-family: 'Noto Sans KR', sans-serif !important;
}

#intro_page {
	align: center;
	font-size: 19px;
}

.sidebar {
	font-size: 20px;
}

.sub-menu-li {
	margin: 10px;
}
</style>
</head>

<body>
	<jsp:include page="../module/Top.jsp" flush="false" />
	<img src="resources/companyimage/intro4.png" style="max-width: 100%;">
	<br>
	<br>
	<div class="container" align="center">
		<img src="https://image.flaticon.com/icons/svg/197/197582.svg"
			style="width: 50px;" onclick="intro_kor()"> <img
			src="https://image.flaticon.com/icons/svg/197/197484.svg"
			style="width: 50px;" onclick="intro_eng()">
	</div>
	<hr>
	<p class="intro_title" align="center" style="font-size: 50px;">SolFood</p>

	<br>


	<div id="company1" class="intro-text" align="center"
		Style="font-size: 19px;">
		<p>

			"<br> 이 세상에는 참 다양한 푸드마켓이 있습니다.<br> 하지만 우리와 꼭 맞는 마음을 가진
			푸드마켓을 찾기란 쉽지 않았습니다.<br> ‘그렇다면 우리가 직접 만들어보면 어떨까?’ <br> 2015년
			'SolFood'는 그렇게 시작되었습니다.<br> "

		</p>
	</div>
	<br>
	<br>
	<br>


	<img src="resources/companyimage/intro2.jpg" style="max-width: 100%;">
	<br>
	<br>
	<br>
	<div id="company2" class="intro-text" align="center"
		Style="font-size: 19px;">
		<p>
			"<br> 맛있는 음식이 삶의 가장 큰 즐거움이라 믿는 사람들이 뜻을 합쳤죠.<br> 'Solfood'의
			팀원들은 이미 팀을 꾸리기 전부터 좋은 재료를 위해서라면 해외 직구, 백화점, 동네 마트, 재래 시장,<br> 더
			나아가 전국 방방곡곡의 산지를 찾아 다니며 품질과 가격을 비교하던 깐깐한 소비자였습니다.<br> 이렇게 찾아낸
			훌륭한 생산자와 최상의 먹거리들을 나와 내 가족만 알고 있기에는 너무 아쉬웠습니다. <br> "
		</p>
	</div>
	<br>
	<br>
	<br>

	<img src="resources/companyimage/intro1.jpg" style="max-width: 100%;">
	<br>
	<br>
	<br>

	<div id="company3" class="intro-text" align="center"
		Style="font-size: 19px;">
		<p>
			"<br> 비싼 식자재만이 좋은 음식일 것이라고 막연하게 생각하고 있는<br> 소비자에게는 진짜 맛을
			소개해드리고 싶었고,<br> 뚝심 하나로 산골 오지에서 수십 년간 묵묵히 장을 담그는 명인, <br>
			시들어서 버릴지언정 무농약을 고집하는 농부에게는 안정적인 판매 활로를 찾아드리고 싶었습니다.<br> 생산자와
			소비자, 판매자까지 모두 행복하고 맛있는 삶을 살 수 있도록<br> 'Solfood'는 오늘도 열심히 발로 뛰며
			고민합니다.<br> "
		</p>
	</div>
	<br>
	<br>
	<br>



	<hr>
	<br>
	<br>
	<br>
	<div class="container" align="center">
		<div id="directions" class="intro_title" align="center"
			style="font-size: 50px;">
			<p>찾아오시는 길</p>
			<br>
			<br>
		</div>
		<div id="map" style="width: 900px; height: 500px;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e26a97d51b2b2fd2fe9efb58f595c75a"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(37.569473, 126.986126), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(37.569473, 126.986126);

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;"> SolFood <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				position : iwPosition,
				content : iwContent
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
		</script>
	</div>


	<hr>
	<div id="address" class="intro-text" style="font-size: 15px;"
		align="center">
		<p>
			서울특별시 종로구 관철동 종로12길 15<br>연락처: 02-6901-7001
		</p>
	</div>



	<jsp:include page="../module/Bottom.jsp" flush="false" />
</body>
</html>