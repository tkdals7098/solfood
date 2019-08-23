<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br>
	<div class="col-xs-offset-2" style="font-size: 35px; font-weight: bold; color: #5D5D5D;">
	RECIPE
	</div><br><br><br>
	<div class="container" align="center">
		<c:forEach items="${allRecipe}" var="allRecipe">
			<div class="col-xs-6" style="font-size: 20px; color: #5D5D5D;">
			<a href="${path}/recipe.do?recipe_id=${allRecipe.recipe_id}"><img src="/img/${allRecipe.recipe_image}" style="width: 400px; height: 300px;"/><br><br>
			${allRecipe.recipe_name}<br><br><br>
			</a>
			</div>
		</c:forEach>
		
	</div>
	
	<br><br><br>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>