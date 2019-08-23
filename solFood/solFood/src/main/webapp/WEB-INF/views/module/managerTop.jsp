<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*" %>


<!DOCTYPE html>
<html class="has-navbar-fixed-top">
<head>
	<meta charset="UTF-8">
	<title>SolFood Admin</title>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:700" rel="stylesheet">

	<link rel="shortcut icon" href="favicon.ico">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
 	<!-- 
 	<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
	 -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/tablesorter@2.31.1/dist/js/jquery.tablesorter.combined.min.js"></script>
 	
 	<style type="text/css">
	 	body{
	 		font-family: 'Nanum Gothic Coding';
	 		font-size: ;
	 	}
	 	p{
	 		vertical-align: middle;
	 	}
 	</style>
 	
</head>
<body>
	<nav class="navbar is-black is-fixed-top" style="border-radius: 0px; width: 100%;" id="navbar">
		<div class="container is-black">
			<div class="navbar-brand">
				<a class="navbar-item" href="${path}/manager/managerMain.do">
					<img src="${path}/resources/image/logo0.png" width="95" height="35">
				</a>
			</div>
			
			<div class="navbar-burger burger" onclick="document.querySelector('.navbar-menu').classList.toggle('is-active');">
				<span></span>
				<span></span>
				<span></span>
			</div>
	
			<div class="navbar-menu">
				<div class="navbar-start">
					<%--============================== 상품 관리 ===============================--%>
					<div class="navbar-item has-dropdown is-hoverable">
						<a class="navbar-link" href="${path}/manager/product/product_page.do">
							상품관리
						</a>
						<div class="navbar-dropdown " data-style="width: 18rem;">
							<a class="navbar-item" href="${path}/manager/product/product_page.do">
								상품현황
							</a>
							<a class="navbar-item" href="${path}/manager/product/product_register.do">
								상품등록
							</a>
						</div>
					</div>
					
					<%--============================== 게시판 관리 ===============================--%>
					<div class="navbar-item has-dropdown is-hoverable">
						<a class="navbar-link" href="${path}/board/managerBoard_listPage">
							게시판관리
						</a>
						<div class="navbar-dropdown " data-style="width: 18rem;">
							<a class="navbar-item" href="${path}/board/managerBoard_listPage">
								게시판관리
							</a>
							<a class="navbar-item" href="${path}/manager/recipe/recipe_list.do">
								콘텐츠관리
							</a>
						</div>
					</div>
					
					<%--============================== 회원 관리 ===============================--%>
					<a class="navbar-item" href="${path}/manager/account/account_page.do">
						회원관리
					</a>
					<%--============================== 구매 관리 ===============================--%>
					<a class="navbar-item" href="${path}/manager/buy/buy_list.do">
						구매관리
					</a>
					<%--============================== 통계 관리 ===============================--%>
					<a class="navbar-item " href="${path}/chart/chart.do">
						통계자료
					</a>
				</div>
	
		<%--================================= 관리자 메뉴 ========================================--%>
				<div class="navbar-end">
					<a class="navbar-item" href="${path}/">
						SHOP&ensp;
						<span class="icon" style="vertical-align: middle;"><i class="fas fa-home fa-lg"></i></span>
					</a>
					<div class="navbar-item has-dropdown is-hoverable">
						<p class="navbar-link">
							ADMIN&ensp;
							<span class="icon" style="vertical-align: middle;"><i class="fas fa-toolbox fa-lg"></i></span>
						</p>
						<div class="navbar-dropdown is-right">
							<p class="navbar-item">관리자 : ${login.account_name}</p>
					        <p class="navbar-item">관리등급 : ${login.account_grade}</p>
					        
					        <hr class="navbar-divider">
							<a href="${path}/member/logout.do" class="navbar-item">Logout</a>
							<form id="logout-form" action="" method="#" style="display: none;"></form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>