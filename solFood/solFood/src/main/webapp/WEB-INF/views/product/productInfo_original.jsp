<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<style>
	.name {
		font-size: 25px;
	}
	.content {
		font-weight: normal;
		font-size: 12px;
	}
	.productInfo {
		font-weight: normal;
	}

</style>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br><br>
	<c:set var="id" value="${param.product_id}"/>
	
	

	
		
	<div class="container">
		<div class="row">
			<div class="col-xs-offset-1 col-xs-3">
				<img src="../resources/image/cate1-1.png" width="350px" height="500px;">
			</div>
			
			<div class="col-xs-offset-2 col-xs-4" align="left">
				<c:forEach items="${productList}" var="productList">
					<div class="name">${productList.product_name}</div><br>
					<div class="content">
					${productList.product_category1} -> ${productList.product_category2}<br><br><br>
					</div>
					<table class="productInfo">
					<tr>
					<th width="120px" height="30px">판매가</th>
					<td width="200px" height="30px" align="right"><b><del><fmt:formatNumber>${productList.product_price}</fmt:formatNumber> 원</del> → <fmt:formatNumber>${productList.product_price - (productList.product_price * productList.product_discountrate / 100)}</fmt:formatNumber> 원</b></td>
					</tr>
					<tr>
					<th width="120px" height="30px">할인금액</th>
					<td width="200px" height="30px" align="right"><fmt:formatNumber>${productList.product_price * productList.product_discountrate / 100}</fmt:formatNumber> 원</td>
					</tr>
					</table>
					<hr>
					<table>
					<tr>
					<th width="120px" height="30px">재고</th>
					<td width="200px" height="30px" align="right">${productList.product_count}</td>
					</tr>
					</table>
					<hr>
					<table>
					<tr>
					<th width="120px" height="30px">product_ea</th>
					<td width="200px" height="30px" align="right">${productList.product_ea}</td>
					</tr>
					<tr>
					<th width="120px" height="30px">product_package</th>
					<td width="200px" height="30px" align="right">${productList.product_package}</td>
					</tr>
					</table>
					<hr>
					<table>
					<tr>
					<th width="120px" height="30px">상품설명</th>
					<td width="200px" height="30px" align="right">${productList.product_content}</td>
					</tr>
					</table>
					<hr>
					<table>
					<tr>
					<th width="120px" height="30px">product_date</th>
					<td width="200px" height="30px" align="right">${productList.product_date}</td>
					</tr>
					</table>
					<br>
					<hr>
					구매수량
				</c:forEach>
				
			</div>
		</div>
	</div>
	
	<%

	//상품에 대한 정보를 쿠키에 담기.
	//쿠키에 한글은 저장되지 않으므로 encode함수로 인코딩 해야 한다.
	Cookie cook = new Cookie("product1", URLEncoder.encode("냉장고", "UTF-8")); //최근본상품에 넘겨줄 이름
	cook.setMaxAge(20); // 쿠키 유지 시간/ 초
	response.addCookie(cook);
	
	
%>
	
	
	
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>