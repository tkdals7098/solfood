<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "../module/Top.jsp" %>
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		button {
		  width: 100px;
		  height: 30px;
		  background-color: #f0f0f0; 
		  border: none;
		  color: #363636; 
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 14px;
		  margin: 0px 0px;
		  -webkit-transition-duration: 0.4s; /* Safari */
		  transition-duration: 0.4s;
		  cursor: pointer;
		  border-radius: 0;
		  font-weight: bold;
		  font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>
</head>
<body>
	<div class="container" align="center">
		<br><br>
		<h2>회원가입 완료</h2>
	
    	<h3>${account_name}님 환영합니다.</h3><br>
    	<a href="${path}/member/login.do"><button type="button">로그인하기</button></a>
		<a href="${path}/"><button type="button">메인으로</button></a>
		<br><br>
	</div>
	
	<%--========================= bottom ========================= --%>
	<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>