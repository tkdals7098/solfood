<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>product list</title>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<h2>장바구니에 넣기 눌렀을 때 제대로 들어가는지 확인하기 위한 임시 테스트 페이지</h2>
	
	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<table class="table">
		<%-- 상품 정보 --%>
		<tr height="30" class="info">
			<td align= "center" width="50">PRODUCT_ID</td>
			<td align= "center" width="50">PRODUCT_NAME</td>
			<td align= "center" width="50">PRODUCT_CATEGORY1</td>
			<td align= "center" width="50">PRODUCT_CATEGORY2</td>
			<td align= "center" width="50">PRODUCT_PRICE</td>
			<td align= "center" width="50">PRODUCT_DISCOUNTRATE</td>
			<td align= "center" width="50">PRODUCT_COUNT</td>
			<td align= "center" width="50">PRODUCT_IMAGE</td>
			<td align= "center" width="50">PRODUCT_PACKAGE</td>
			<td align= "center" width="50">PRODUCT_EA</td>
			<td align= "center" width="50">PRODUCT_CONTENT</td>
			<td align= "center" width="50">PRODUCT_DATE</td>
		</tr>
			
	<c:forEach items="${productList}" var="product">
		<tr>
			<td align="center">${product.product_id}</td>
			<td align="center">${product.product_name}</td>
			<td align="center">${product.product_category1}</td>
			<td align="center">${product.product_category2}</td>
			<td align="center">${product.product_price}</td>
			<td align="center">${product.product_discountrate}</td>
			<td align="center">${product.product_count}</td>
			<td align="center">${product.product_image}</td>
			<td align="center">${product.product_package}</td>
			<td align="center">${product.product_ea}</td>
			<td align="center">${product.product_content}</td>
			<td align="center">${product.product_date}</td>
		</tr>	
	</table>
	
	<%-- 장바구니 넣기 버튼--%>
	<a href="${path}/cart/cartInsert.do?product_id=${product.product_id}&account_user=${login.account_user}"><input type="button" value="장바구니 넣기"></a>
	
	</c:forEach>
</body>
</html>