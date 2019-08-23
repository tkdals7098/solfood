<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		function insertToCart(product_id, account_user){							
			var purchase_count= document.getElementsByName("purchase_count")[0].value;
			var json= {"product_id":product_id, "account_user":account_user, "purchase_count":purchase_count};
			
			$.ajax({
				type: "post",
				url: "/cart/cartInsert.do",
				data: json,
				beforeSend: function(xmlHttpRequest){
					xmlHttpRequest.setRequestHeader("AJAX", "true");
				},
				success: function(data){		
					if(data== "outOfStock"){
						alert("이 상품은 품절입니다");
					} else if(data== "success"){
						alert("장바구니 넣기 완료되었습니다");
						var result= confirm("장바구니로 이동하시겠습니까?");
						if(result){
							window.location.href= "${path}/cart/cartList.do?account_user="+ account_user;
						}	
					} else if(data== "replace"){
						alert("기존에 장바구니에 있는 상품입니다. 장바구니에서 수량 조정 가능합니다");
						var result= confirm("장바구니로 이동하시겠습니까?");
						if(result){
							window.location.href= "${path}/cart/cartList.do?account_user="+ account_user;
						}
					} else if(data== "overStock"){
						alert("선택하신 수량만큼 구매할 수 없습니다.");
					}		
				},
				error: function(){
					alert("장바구니 넣기 실패- 로그인을 하고 다시 시도하세요");
				}
			});
		}
	</script>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
	h2{
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	
	.name {
		font-size: 25px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	.content {
		font-weight: normal;
		font-size: 12px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	.productInfo {
		font-weight: normal;
		font-family: 'Noto Sans KR', sans-serif !important;
	}

</style>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br><br>
	<c:set var="id" value="${param.product_id}"/>
	
	<%--======================== 상품 정보 ===========================--%>
	<div class="container">
		<div class="row">
			<c:forEach items="${productList}" var="productList">
			<div class="col-xs-offset-1 col-xs-3">
				<img src="/img/${productList.product_image}" width="350px" height="500px;">
			</div>
			
			<div class="col-xs-offset-2 col-xs-4" align="left">
				<div class="name">${productList.product_name}</div><br>
				<div class="content">${productList.product_category1} -> ${productList.product_category2}<br><br><br></div>
					
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
						<th width="120px" height="30px">개입</th>
						<td width="200px" height="30px" align="right">${productList.product_ea}</td>
					</tr>
					<tr>
						<th width="120px" height="30px">보관</th>
						<td width="200px" height="30px" align="right">${productList.product_package}</td>
					</tr>
				</table>
				<hr>
				<table>
					<tr>
						<th width="120px" height="30px">유통기한</th>
						<td width="200px" height="30px" align="right">${productList.product_date}</td>
					</tr>
				</table>
				<hr>
				
				<div id= "setProductCount">
					
				</div>
				<table>
					<tr>
						<th width="120px" height="30px">구매수량</th>
						<td width="100px" height="30px" align="right">
							<input type="number" min="1" max="100" value="1" name="purchase_count">
						</td>
						
						<%-- 장바구니 버튼 --%>
						<td width="200px" height="30px" align="right"><input type="button" class="btn btn-md btn-success" onClick="insertToCart(${productList.product_id},${login.account_user})" value="장바구니"></td>
					</tr>
				</table>
			</div>
			</c:forEach>
		</div>
	</div>
	<br><br><br><hr>
	
	<%--======================== 상품 설명 ===========================--%>
	<h2 align="center">상품설명</h2>
	<div class="container" align="center">
		<c:forEach items="${productList}" var="productList">
			${productList.product_content}
		</c:forEach>
	</div>
	<br><br><br>
	
	
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
		<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>