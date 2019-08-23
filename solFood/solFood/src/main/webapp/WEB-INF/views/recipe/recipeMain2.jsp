<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<c:set var="id" value="${param.recipe_id}"/>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Recipe ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->

<div class="container">
	<div class="recipeHeader" align="center">
	
	<%-- 
	<c:set var="list" value="${recipeList_detail}" />
	--%>
		
			${status}
			<table>
				<tr>
					<td width="150px" height="50px" align="center" style="background-color: #E7E7E7; border-top: 2px solid #003399; border-bottom: 1px solid #EAEAEA;">제목</td>
					<td width="800px" height="50px" align="left" style="border-top: 2px solid #003399; border-bottom: 1px solid #EAEAEA; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.recipe_name}</td>
				</tr>
				<tr>
					<td width="150px" height="50px" align="center" style="background-color: #E7E7E7; border-bottom: 1px solid #EAEAEA;">작성자</td>
					<td width="800px" height="50px" align="left" style="border-bottom: 1px solid #EAEAEA; font-weight: normal;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SolFood</td>
				</tr>
			</table>
			<br><br><br><br>
			<div align="center" style="font-size: 50px; font-weight: bold; color: #5D5D5D;">
				SolFood's Recipe
			</div>
			<div align="center" style="border-top: 1px solid #5D5D5D; width: 500px;"></div>
			<br><br>
			<div align="center" style="font-size: 35px; font-weight: bold; color: #5D5D5D;">
				${recipe_name_detail}
			</div>
			<br><br><br>
				<img src="/img/${recipe_image_detail}" style="width:800px; height:500px;"/>
			<br><br><br>
			<div class="col-xs-offset-2" align="left">
			${recipe_content_detail}
			</div>
	</div>
	<br><br><br>
	<hr>
	<div class="col-xs-offset-2" style="border-bottom: 5px solid #5D5D5D; width: 50px;"></div>
	<div class="col-xs-offset-2">RECIPE ITEMS</div>
	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 연관상품 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<div class="container">
		<c:set var="i" value="0"/>
		<c:set var="j" value="4"/>
		<table border=1>
			<c:choose>
				<c:when test="${recipeList != null && fn:length(recipeList) > 0}">
					<c:forEach var="resultList" items="${recipeList_relate}">
						<c:if test="{i%j == 0}">
							<tr>
						</c:if>
								<td>
									${resultList.product_name}
									<br>
									${resultList.product_image}
								</td>
						<c:if test="${i%j == j-1 }">
							</tr>
						</c:if>
						<c:set var="i" value="${i+1}"/>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
		
	<hr>
	<hr>
		<c:forEach var="resultList" items="${recipeList}">
		
		 	<%-- ${resultList.product_id} --%>
			<div class="row">
				
				<div class=".col-md-1">
		  		${resultList.product_name}
				</div>
				<div class=".col-md-1">
			  	<img src="/img/${resultList.product_image}" style="width:180px; height:130px;"/><br>
			  	</div>
			</div>
			
		</c:forEach>
			   
		
		
	<br><br><br><br><br>
	
	<br><br><br><br>
	<hr style="border: 1px solid #003399;">
	<div class="col-xs-offset-11"><button class="btn btn-primary">목록</button></div>
</div>

 
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>