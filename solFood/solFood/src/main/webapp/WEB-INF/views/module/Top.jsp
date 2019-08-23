<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.*" %>
<%NumberFormat nf = NumberFormat.getNumberInstance();%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>top top</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:700" rel="stylesheet">
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/animate.css" rel="stylesheet">
	<link href="../resources/css/wickedcss.min.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		a { text-decoration: none; font-family: 'Noto Sans KR', sans-serif;}
 		a:link { color: black; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
 		a:active { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
		a:visited { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
 		a:hover { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif !important;}
	</style>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		.logo {
			position: absolute;
			top: 22px;
			left: 45% !important;
			display:block;
			z-index: 10;
		}
	 	body{
	 		font-family: 'Noto Sans KR', sans-serif;
	 		font-size: ;
	 	}
	 	p{
	 		vertical-align: middle;
	 	}
	 	div{
	 		font-family: 'Noto Sans KR', sans-serif;
	 	}
	</style>



</head>
<body style="padding: 0px 0px 0px 0px;">

<!-- 
	<a href="/member/login.do">로그인1</a>
	<a href="${path}/member/login.do">로그인2</a>
	
	<a href="../">메인메뉴 1</a>
	<a href="../${path}">메인메뉴 2</a>
	<a href="../../${path}">메인메뉴 3</a>
	똑같이 연결됨
 -->
	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Top ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div class="row">
		<c:choose>
		    <c:when test="${login.account_user == null}">
		    <div class="col-sm-offset-10"></div>
		    <div class="col-sm-offset-10">
		        <a href="${path}/member/login.do"><strong>로그인&nbsp;</strong></a>&nbsp;｜&nbsp;
		        <a href="${path}/member/joinMember.do"><strong>회원가입&nbsp;</strong></a>
		    </div>
		    </c:when>
		    <c:otherwise>
		    <div class="col-sm-offset-7"></div>
		    <div class="col-sm-offset-8">
		        <a href="${path}/member/mypage.do?account_user=${login.account_user}"><strong>마이페이지&nbsp;</strong></a>&nbsp;｜&nbsp;
		        <a href="${path}/cart/cartList.do?account_user=${login.account_user}"><strong>장바구니&nbsp;</strong></a>&nbsp;｜&nbsp;  
		        <a href="${path}/buy/buy.do?account_user=${login.account_user}"><strong>구매이력&nbsp;</strong></a>&nbsp;｜&nbsp;  
		        <a href="${path}/member/logout.do"><strong>로그아웃&nbsp;</strong></a>
		        <c:if test="${login.account_grade eq '0'}">
					<strong>｜&nbsp;</strong><a href="${path}/manager/managerMain.do">관리페이지</a>
				</c:if>
		    </div>
		    </c:otherwise>
		</c:choose>
	</div>
	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<!-- 메인 로고 : 클릭시 메인으로 이동 -->
		<a href="../../${path}" class="logo"><img src="../resources/image/solfoodLogo.png"></a>
	
	<!-- 로고 애니메이션 : 클릭시 메인으로 이동 -->
	<div class="row">
		<div class="col-md-6 col-md-offset-1">
			<div style="position: relative; top: 10px; left: 40px !important;"><a href="../../${path}"><img src="../resources/image/trees.png"></a></div>
			<div style="position: absolute; top: 20px; left: 80px;"><img src="../resources/image/sun.png" class="rotation">	</div>
			<div style="position: absolute; top: 110px; left: 67px;"><img src="../resources/image/cheese.png" class=floating></div>
			<div style="position: absolute; top: 120px; left: 83px;"><img src="../resources/image/carrot.png" class=floating></div>
			<div style="position: absolute; top: 110px; left: 100px;"><img src="../resources/image/apple.png" class=floating></div>
			<div style="position: absolute; top: 120px; left: 117px;"><img src="../resources/image/grapes.png" class=floating></div>
			<div style="position: absolute; top: 110px; left: 126px;"><img src="../resources/image/orange.png" class=floating></div>
			<div style="position: absolute; top: 120px; left: 141px;"><img src="../resources/image/strawberry.png" class=floating></div>
			<div style="position: absolute; top: 110px; left: 152px;"><img src="../resources/image/tomato.png" class=floating></div>
		</div>	
	</div>
	<br><br><br>

<%--■■■■■■■■■■■■■■■■■■■■■■ Top ■■■■■■■■■■■■■■■■■■■■■■■■--%>
</body>
	<%@ include file = "topMenu.jsp" %>
	<%@ include file = "topQuickMenu.jsp" %>

</html>