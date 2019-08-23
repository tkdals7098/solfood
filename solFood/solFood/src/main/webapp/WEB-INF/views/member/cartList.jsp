<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.text.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<style>

	body {
		padding: 30px 20px 0px 20px;
		width: 1417px;
		font-family: 굴림체;
	}
	th {
		font-style: bold;
	}
	#line {
		border: 0;
    	height: 1px;
    	background: #050099;
	}
	#valign {
		vertical-align: middle;
	}
	#count {
		width: 30px;
		text-align: center;
	}
	#plusminus {
		border: 0;
		outline: 0;
		background: #FFFFFF;
	}
	#price {
		width: 150px;
   		height: 150px;
  		border: 2px solid #050099;
   		border-radius: 10px;
	}
	#buyInfo {
		width: 450px;
		height: 65px;
		border: 0;
		background: #E7E7E7;
	}
</style>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■-->
<header>
	<jsp:include page="../module/Top.jsp" flush="false"/>
</header>
	<div align="center"><h2><label><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;장바구니</label></h2></div><br>
	<div align="center"><h5>주문하실 상품명 및 수량을 정확하게 확인해 주세요.</h5></div><br><hr id="line">
	<div align="center">
	
	<!-- 임시로 설정한 변수 -->
		<% 
		   NumberFormat nf = NumberFormat.getNumberInstance();
		   int item1 = 1500000;
		   int item2 = 1800000;
		   int item3 = 2000000;
		   int price = 5300000; 
		   int sale	 = 1000000;
		   int delivery = 5000;
		   int total = price - sale + delivery;
		%>
	
	<table class="table">
		<thead>
			<tr>
				<td width="100" align="center"><input type="checkbox" value="전체선택">&nbsp;전체선택</td><td width="400" align="center">상품 정보</td><td width="100" align="center">수량</td><td width="100" align="center">상품 금액</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="valign" align="center" valign="middle"><input type="checkbox"></td>
				<td align="center"><img src="resources/image/noodle.jpg">&nbsp;&nbsp;맛이 기똥찬 라면</td>
				<td id="valign" align="center"><button id="plusminus"><img src="resources/image/minus.jpg"></button><input type="text" width="20"value="1" id="count"><button id="plusminus"><img src="resources/image/plus.jpg"></button></td>
				<td id="valign" align="center"><%=nf.format(item1) %>원</td>
			</tr>		
			<tr>
				<td id="valign" align="center" valign="middle"><input type="checkbox"></td>
				<td align="center"><img src="resources/image/noodle.jpg">&nbsp;&nbsp;맛이 기똥찬 라면 2</td>
				<td id="valign" align="center"><button id="plusminus"><img src="resources/image/minus.jpg"></button><input type="text" width="20"value="1" id="count"><button id="plusminus"><img src="resources/image/plus.jpg"></button></td>
				<td id="valign" align="center"><%=nf.format(item2) %>원</td>
			</tr>		
			<tr>
				<td id="valign" align="center" valign="middle"><input type="checkbox"></td>
				<td align="center"><img src="resources/image/noodle.jpg">&nbsp;&nbsp;맛이 기똥찬 라면 3</td>
				<td id="valign" align="center"><button id="plusminus"><img src="resources/image/minus.jpg"></button><input type="text" width="20"value="1" id="count"><button id="plusminus"><img src="resources/image/plus.jpg"></button></td>
				<td id="valign" align="center"><%=nf.format(item3) %>원</td>
			</tr>	
		</tbody>
	</table>
	<hr>
	<br><br><br><br>
	<div class="row">
	<div class="col-md-offset-8 col-md-1"><input type="checkbox" value="전체선택">&nbsp;전체선택</div>
	<div class="col-md-3"><input type="button" class="btn" value="선택 삭제">&nbsp;&nbsp;<input type="button" class="btn" value="품절 상품 삭제"></div>
		</div>
		<br><br><br><br>
		
		<div class="row" id="valign">
			<div class="col-sm-offset-1 col-md-2"><label id="price"><br><br>상품금액<br><br><%=nf.format(price)%>원</label></div>
			<div class="col-sm-1"><br><br><br><img src="resources/image/minus.jpg"></div>
			<div class="col-md-2"><label id="price"><br><br>할인금액<br><br><%=nf.format(sale)%>원</label></div>
			<div class="col-sm-1"><br><br><br><img src="resources/image/plus.jpg"></div>
			<div class="col-md-2"><label id="price"><br><br>배송비<br><br><%=nf.format(delivery)%>원</label></div>
			<div class="col-sm-1"><br><br><br><img src="resources/image/result.jpg"></div>
			<div class="col-md-2"><label id="price"><br><br>결제예정금액<br><br><%=nf.format(total)%>원</label></div>
		</div>
	</div>
	<br><br><br>
	<div class="col-md-offset-8"><h5><span class="glyphicon glyphicon-hand-right"></span>&nbsp;쿠폰, 적립금은 다음화면인'주문서'에서 확인가능합니다.</h5></div>
	<br><br><br><br>
	<div align="center"><input type="button" class="btn btn-primary" value="질러버리기"></div>
	<br><br><br><br><br>
	<div align="center">
	<label id="buyInfo"><h6 align="center">주문 취소는 샛별지역:배송일 전날 19시까지/택배지역:배송일 전날 18시까지<br><br>
						고객센터(1644-1107) 1:1문의 게시판/카카오톡으로 취소 요청 바랍니다.</h6></label></div>
	
	
	
<!--■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■-->	
<footer>
	<jsp:include page="../module/Bottom.jsp" flush="false"/>
</footer>
</body>
</html>