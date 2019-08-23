<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>buy page</title>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>   
	<script>
	// 문서가 모두 ready되면 buyList 실행
	$(document).ready(function(){
		var account_user = document.getElementsByName("account_user")[0].value;
		buyList(account_user);
	});

	// 숫자에 콤마 넣는 함수
	function addComma(num)
	{
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
	}

	var nData = addComma(nData);
	
	function buyList(account_user){
		var json= {"account_user":account_user}
		
		$.ajax({
			type: "post",
			url: "/buy/buy2.do",
			data: json, 
			success: function(data){
				var html= "";
				var cnt= data.length;
				
				// table에 buy list 붙이기
				if(cnt> 0){	
					for(i=0; i<cnt; i++){
						html+= "<tr height='50' class='info'>";
						html+= "<td align='center' width='100' height='140'>"+ data[i].buy_date+ "</td>";
						html+= "<td align='center' width='100' height='140'><img src='/img/"+ data[i].product_image+"' width='100px' height='120px'></td>";
						html+= "<td align='center' width='100' height='140'>"+ data[i].product_name+ "</td>";
						html+= "<td align='center' width='100' height='140'>"+ data[i].buy_count+ "</td>";
						html+= "<td align='center' width='100' height='140'>"+ addComma(data[i].product_price)+ " 원</td>";
						html+= "<td align='center' width='100' height='140'>"+ data[i].buy_delivery+ "</td>";
						html+= "</tr>";		
					}
					$("#buyList").html(html);
					html= "";
				} else{
					$("#buyList").html(html);
				}
			},
			error: function(request, status, error){
				alert("데이터 cartList 뿌리기 실패");
			} 
		});
	}
	
	//------------------------------------------------------------------
	//	clearCart()--> cart에서 상품 삭제하는 메소드
	//------------------------------------------------------------------
	<%--
	function clearCart(account_user){
		var json= {"account_user":account_user}
		
		$.ajax({
			type: "post",
			url: "/cart/clearCart.do",
			data: json, 
			success: function(){
				alert("장바구니 삭제완료");
			},
			error: function(request, status, error){
				alert("장바구니 삭제실패");
			} 
		});
	}
	--%>
	</script>
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		.tableHead {
			background-color: white;
			border-top: 2px solid #003399;
		}
		#subBtn {
			border: 1px solid;
			border-color: #f0f0f0;
			width: 120px;
			height: 40px;
			outline: none;
			background-color: #f0f0f0;
			font-weight: normal;
			color: #363636;
			text-align: center;
			border-radius: 0;
			font-size: 15px;
			font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>
</head>
<body>
	<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<header>
		<jsp:include page="../module/Top.jsp" flush="false"/>
	</header>
	<br><br><br>
	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div align="center"><h2><label><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;구매 완료</label></h2></div><br><br>
	
	<%-- account_user 받기 --%>
	<c:set var= "account_user" value="${account_user}"/>
	<input type="text" hidden="true" value="${account_user}" name="account_user">
	
	<%-- 구매 목록 --%>
	<div class="container">
		<table class="table">
			<tr height="50" class="tableHead">
			
				<%-- cart 상품 list --%>
				<td align= "center" width="50">일시</td>
				<td align= "center" width="50">사진</td>
				<td align= "center" width="50">상품명</td>
				<td align= "center" width="50">구매 수량</td>
				<td align= "center" width="50">가격</td>
				<td align= "center" width="50">배송상태</td>
			</tr>
		</table>
	</div>
	
	<div class="container">
		<table class="table" id="buyList">
			
		</table>
	</div>
	
	<hr><br>
	<%--===================================== 버튼 ==========================================--%>
	<div class="container" align="center">
		<a href="${path}/"><input type="button" id="subBtn" value="메인으로 가기"></a>&nbsp;&nbsp;&nbsp;
		<a href="${path}/cart/cartList.do"><input type="button" id="subBtn" value="장바구니로 가기"></a>
	</div>
	<br><br><br><br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ bottom ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<footer>
		<jsp:include page="../module/Bottom.jsp" flush="false"/>
	</footer>
</body>
</html>





