<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap')
	;

a {
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif !important;
}

a:link {
	color: black;
	text-decoration: none !important;
	font-family: 'Noto Sans KR', sans-serif !important;
}

a:active {
	color: black !important;
	text-decoration: none !important;
	font-family: 'Noto Sans KR', sans-serif !important;
}

a:visited {
	color: black !important;
	text-decoration: none !important;
	font-family: 'Noto Sans KR', sans-serif !important;
}

a:hover {
	color: black !important;
	text-decoration: none !important;
	font-family: 'Noto Sans KR', sans-serif !important;
}

div {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.row {
	margin-right: 0px !important;
}

#11 {
	outline: none;
}

#kakao {
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
</head>
<!--■■■■■■■■■■■■■■■■■■■■■■ Bottom ■■■■■■■■■■■■■■■■■■■■■■■■-->
<body>
	<hr>
	<div class="row">
		<div class="col-md-2 col-md-offset-1">
			<h3>
				<strong>SolFood</strong>
			</h3>
		</div>
	</div>
	<br>
	<div class="row"
		style="position: relative; font-size: 12px; font-weight: normal; color: #8C8C8C;">
		<div class="col-xs-1 col-xs-offset-1">
			<input type="button" id="kakao" class="btn btn-default"
				value="카카오톡 문의" onClick="window.open('http://pf.kakao.com/_xgWFsT')"><br>
			<br>
			<br>
			<input type="button" id="11" class="btn btn-default" value="1:1 문의" onClick="location.href='${path}/board/listPage.do'">
		</div>
		<div class="col-xs-2">
			365고객센터<br>오전7시~오후7시<br>
			<br>
			<br>24시간 접수 가능<br>순차적으로 답변해드리겠습니다.
		</div>
		<div class="col-xs-4 col-xs-offset-4">
			법인명(상호):주식회사 SolFood｜사업자등록번호:123-456-78912<br>통신판매업:제
			2019-서울종로-01542호 ｜ 개인정보보호 책임자:진영민<br>주소:서울특별시 종로구 종로12길 15,코아빌딩
			5층 ｜ 대표이사:진영민<br>입점문의:<a href="${path}/board/listPage.do">입점문의하기</a>｜ 마케팅제휴:<a href="${path}/board/listPage.do">marketing@solfood.com</a><br>채용문의:<a
				href="${path}/board/listPage.do">recruit@solfood.com</a><br>팩스:070-1135-5167｜ 이메일:<a
				href="${path}/board/listPage.do">whatdoyoon@naver.com</a><br>
			<br>ⓒ SolFood CORP.ALL RIGHTS RESERVED
		</div>
		<div class="row"
			style="position: absolute; top: -100px !important; left: 46%;">
			<img src="../resources/image/solfoodLogo.png">
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-5 col-md-offset-1">
			<a href="${path}/intro.do">SolFood소개</a>｜<a
				href="${path}/accessTerms.do">이용약관</a>｜<a
				href="${path}/personalInfo.do">개인정보처리방침</a>｜<a
				href="${path}/guide.do">이용안내</a>
		</div>
		<div class="col-md-2 col-md-offset-4 ">
			<a href="https://www.facebook.com"><img
				src="../resources/image/facebook.png"></a>&nbsp;&nbsp;<a
				href="https://twitter.com/?lang=ko"><img
				src="../resources/image/twitter.png"></a>&nbsp;&nbsp;<a
				href="https://www.instagram.com/?hl=ko"><img
				src="../resources/image/instagram.png"></a>&nbsp;&nbsp;<a
				href="https://www.youtube.com"><img
				src="../resources/image/youtube.png"></a>
		</div>
	</div>
	<br>
</body>
</html>