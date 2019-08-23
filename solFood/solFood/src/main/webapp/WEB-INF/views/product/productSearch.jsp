<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색</title>
	<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
		type="text/css" />
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../module/Top.jsp" flush="false"/>
<br>
	<br>
	<br>
	<div class="container" align="center">
		<h2>"<%= request.getParameter("keyword_p") %>" 검색 결과</h2><br><br>
	</div>
	
	<div class="container" id="allVegeC">
		<c:forEach items="${productList_search}" var="product">
			
			<div class="col-xs-4" align="center">			
				<!--===================  상품 id, 사진, 이름, 찜하기, 가격 순 ========================-->
				<input type="text" hidden="true" value= "${product.product_id}" name="product_id"/>
				<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><img src="/img/${product.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
		      	${product.product_name}&nbsp;
				 
		 		<!-- login 값이 없으면 하트 안보이게 -->
		 		<c:choose>
				    <c:when test="${login.account_user== null}">
						<br>
				    </c:when>
				    <c:otherwise>
				   		<input type="button" id='heartImage' name='heartImage${product.product_id}' onclick= "changeHeart(${product.product_id},1809)" class='beforeClick' style="width:29px; height:23px;"><br>
				    </c:otherwise>
				</c:choose>

				<a href="${path}/product/productInfo.do?product_id=${product.product_id}"><fmt:formatNumber value="${product.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			</div>
		</c:forEach>
	</div>
	<br><br>
</body>
</html>