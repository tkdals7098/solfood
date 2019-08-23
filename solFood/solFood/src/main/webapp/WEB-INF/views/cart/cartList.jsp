<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	NumberFormat nf = NumberFormat.getNumberInstance();	%>    
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>cart list</title>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>   
	<script>
		$(document).ready(function(){
			cartList();
		});
		
		// 숫자에 콤마 넣는 함수
		function addComma(num)
		{
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
		}

		var nData = addComma(nData);

		//------------------------------------------------------------------
		//	cartList--> 해당 유저의 cart list 불러오는 메소드
		//------------------------------------------------------------------
		function cartList(){
			var account_user = document.getElementsByName("account_user")[0].value;
			
			$.ajax({
				type: "post",
				url: "/cart/cartList2.do?account_user="+ account_user,
				success: function(data){
					var html= "";
					var cnt= data.length;
					
					//----------------------------------------------------------
					//	table에 붙일 cartlist 
					//----------------------------------------------------------
					if(cnt> 0){	
						for(i=0; i<cnt; i++){
							html+= "<tr height='50' class='info'>";
							html+= "<td align='center' width='100' height='130'><button class='btn' id='subBtn' onClick='deleteFromCart("+ data[i].product_id+","+ account_user +")'>삭제</button></td>";
							html+= "<td align='center' width='100' height='130'><button class='btn' id='subBtn' onClick='cartPlus("+ account_user+","+ data[i].product_id+","+ data[i].cart_count+")'>+</button></td>";
							html+= "<td align='center' width='100' height='130'><button class='btn' id='subBtn' onClick='cartMinus("+ account_user+","+ data[i].product_id+","+ data[i].cart_count+")'>-</button></td>";
							html+= "<td align='center' width='100' height='130'>"+ data[i].cart_date+ "</td>";
							html+= "<td align='center' width='100' height='130'>"+ data[i].product_name+ "</td>";
							html+= "<td align='center' width='100' height='130'>"+ data[i].cart_count+ "</td>";
							html+= "<td align='center' width='100' height='130'>"+ data[i].product_count+ "</td>";
							html+= "<td align='center' width='100' height='130'>"+ addComma(data[i].product_price) + " 원</td>";
							html+= "<td align='center' width='100' height='130'><img src='/img/"+ data[i].product_image +"' style='width:90px; height:115px;'/></td>";
							html+= "</tr>";		
						}
						$("#cartList").html(html);
						html= "";
					} else{
						$("#cartList").html(html);
					}
					
					//----------------------------------------------------------
					//	selectedPrice--> 상품 정가 표시 
					//----------------------------------------------------------
					html= "";
					var total= 0;
					
					for(i=0; i<cnt; i++){
						html+= "<h6>"+ data[i].product_name +" X "+ data[i].cart_count +"="+ addComma(data[i].product_price* data[i].cart_count) +"</h6> ";				
						total+= (data[i].product_price * data[i].cart_count);
					}
					html+= "<h4>"+ addComma(total) +" 원</h4>" 
					
					$("#selectedPrice").html(html);


					//----------------------------------------------------------
					//	discountPrice--> 상품 discount rate적용해서 가격 표시
					//----------------------------------------------------------
					html= "";
					// var total= 0;
					var discountTotal= 0;
					var temp= 0;

					html+= "<input type='button' onclick='show()' id='show' value='상세'>";
					html+= "<h6 id='temp' hidden='true' style='display:none;'>";
					
					for(i=0; i<cnt; i++){
						html+= data[i].product_name + " : " +data[i].product_discountrate+ "% 할인= "+ (data[i].product_price* 0.01* data[i].product_discountrate) +"원<br><br>";				
						discountTotal+= (data[i].product_price* 0.01* data[i].product_discountrate)						
					}
					total= total- discountTotal+ 2500;
					
					html+= "</h6><h4>할인된 금액: "+ addComma(discountTotal) +"원</h4><br>";
					$("#discountPrice").html(html);

					
					//----------------------------------------------------------
					//	totalPrice--> discountprice+ 배송비 가격 표시==> 총결제할금액
					//----------------------------------------------------------
					html= "";
					var all_total= total;
					html+= "<h4>"+ addComma(all_total) +" 원</h4><br>"; 
					html+= "<c:set var='all_total' value='"+ all_total +"'/>";
					
					$("#payBtn").attr({
						'href' : '${path}/cart/pay.do?account_user='+ account_user+ '&totalPrice=' +all_total
					});
					
					$("#totalPrice").html(html);
				},
				
				error: function(request, status, error){
					alert("데이터 cartList 뿌리기 실패");
				} 
			});
		}
		// show()
		function show(){
			$("#temp").attr({
				'style' : 'display:block;'
			});
		}
		
		//------------------------------------------------------------------
		//	deleteFromCart--> cart에서 상품 삭제하는 메소드
		//------------------------------------------------------------------
		function deleteFromCart(product_id, account_user){			
			var json= {"product_id":product_id, "account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/cart/cartDelete.do",
				data: json,
				success: function(){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		//------------------------------------------------------------------
		//	deleteOutOfStock()--> cart에서 상품 삭제하는 메소드
		//------------------------------------------------------------------
		function deleteOutOfStock(account_user){	
			var json= {"account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/cart/cartDeleteOutOfStock.do",
				data: json,
				success: function(data){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		
		//------------------------------------------------------------------
		//	cartPlus()--> cart에서 상품 추가하는 메소드
		//------------------------------------------------------------------
		function cartPlus(account_user, product_id, cart_count){
			var json= {"account_user":account_user, "product_id":product_id, "cart_count":cart_count};
			
			$.ajax({
				type: "post",
				url: "/cart/cartPlus.do",
				data: json,
				success: function(data){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		//------------------------------------------------------------------
		//	cartMinus()--> cart에서 상품 삭제하는 메소드
		//------------------------------------------------------------------
		function cartMinus(account_user, product_id, cart_count){	
			var json= {"account_user":account_user, "product_id":product_id, "cart_count":cart_count};
			
			$.ajax({
				type: "post",
				url: "/cart/cartMinus.do",
				data: json,
				success: function(data){
					cartList();
				},
				error: function(){
					cartList();
				}
			});
		}
		
		//------------------------------------------------------------------
		//	cartToBuy()--> cart에서 buy로 넘어가기 
		//------------------------------------------------------------------
		function cartToBuy(account_user){
			var json= {"account_user":account_user}
						
			$.ajax({
				type: "post",
				url: "/cart/cartToBuy.do",
				data: json,
				success: function(){
				},
				error: function(){
				}
			});
		}
	</script>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
	body {
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	table{
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	h5{
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	.tableHead {
		background-color: white;
		border-top: 2px solid #363636;
	}
	#cartList {
		position: relative;
		top: -40px;
		font-family: 'Nanum Myeongjo', serif;
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
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	#plusminus {
		border: 0;
		outline: 0;
		background: #FFFFFF;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	#deleteOutOfStock {
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
		font-weight: normal;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	#price {
		border: 2px solid;
		border-color: #f0f0f0;
		width: 200px;
		height: 180;
		overflow: auto;
		background-color: #f0f0f0;
		color: #363636;
		text-align: center;
		border-radius: 30px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	#buyInfo {
		width: 450px;
		height: 65px;
		border: 0;
		background: white;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	.glyphicon {
		position: relative;
		top: 15px;
		font-size: 25px;
	}
	#subBtn {		
		border: 1px solid;
		border-color: #f0f0f0;
		width: 60px;
		height: 35px;
		outline: none;
		background-color: #f0f0f0;
		font-weight: normal;
		color: #363636;
		text-align: center;
		border-radius: 0;
		font-weight: normal;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	#show {
		border: 1px solid #003399;
		border-radius: 3px;
		width: 45px;
		height: 25px;
		outline: none;
		background-color: white;
		font-weight: normal;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	.payBtn {
		border: 1px solid;
		width: 90px;
		height: 40px;
		outline: none;
		background-color: #363636; 
		color: #f0f0f0;
		text-align: center;
		border-radius: 0;
		font-weight: bold;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
	.toMainBtn {
		border: 1px solid;
		width: 90px;
		height: 40px;
		outline: none;
		background-color: #f0f0f0;  
		border-color: #f0f0f0;
		color: #363636;
		text-align: center;
		border-radius: 0;
		font-weight: bold;
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif !important;
	}
</style>
<body>
	<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<header>
		<jsp:include page="../module/Top.jsp" flush="false"/>
	</header>

	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<br><br>
	<div align="center"><h2><label><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;장바구니</label></h2></div><br>
	<div align="center">
		<h5 id='ttt'>
			**주문하실 상품명 및 수량을 정확하게 확인해 주세요.**<br><br>
			**구매하기 버튼을 누를 때, 품절 상품은 구매되지 않습니다**
		</h5>
	</div><br>
	
	<%--  ================================== 품절상품 삭제 버튼 ================================ --%>
	<div class="row">
		<div class="col-xs-offset-1 col-xs-6">
			<c:forEach items="${cartList}" var="cart" >
				<c:set var= "account_user" value="${cart.account_user}"/>
			</c:forEach>
			<br>
			<input type="button" id="deleteOutOfStock" value="품절 상품 삭제" onClick="deleteOutOfStock(${account_user})"/>
		</div>
	</div><br>
	
	<%-- ================================== cartList column ==================================== --%>
	<div class="container">
	<table class="table">
		<tr height="50" class="tableHead">
			<%-- 삭제, 수량조정 버튼--%>
			<td align= "center" width="50">삭제</td>
			<td align= "center" width="50">수량+</td>
			<td align= "center" width="50">수량-</td>
			
			<%-- cart 상품 list --%>
			<td align= "center" width="50">일시</td>
			<td align= "center" width="50">상품명</td>
			<td align= "center" width="50">담은 수량</td>
			<td align= "center" width="50">재고 수량</td>
			<td align= "center" width="50">가격</td>
			<td align= "center" width="50">사진</td>
		</tr>
	</table>
	
	<%-- ================================== cartList value ==================================== --%>
	
		<%-- cartList에 있는거 추출 --%>
		<c:forEach items="${cartList}" var="cart" varStatus="status">
			<input type="text" hidden="true" id="product_id" name="product_id" value="${cart.product_id}">
			<input type="text" hidden="true" id="account_user" name="account_user" value="${cart.account_user}">
			<input type="text" hidden="true" id="cart_date" name="cart_date" value="${cart.cart_date}">
			<input type="text" hidden="true" id="product_name" name="product_name" value="${cart.product_name}">
			<input type="text" hidden="true" id="cart_count" name="cart_count" value="${cart.cart_count}">
			<input type="text" hidden="true" id="product_count" name="product_count" value="${cart.product_count}">
			<input type="text" hidden="true" id="product_price" name="product_price" value="${cart.product_price}">
			<input type="text" hidden="true" id="product_image" name="product_image" value="${cart.product_image}">
			<br>
		</c:forEach>
		
		<table id = "cartList" class="table">
		</table>
	</div>
	<hr>
	<br><br>
	<%--  ====================================== 총 상품 금액 계산 ==================================== --%>	
	<%-- 장바구니에 담겨있는 상품들의 총 금액 --%>
	<div class="row" id="valign">
		<div class="col-sm-offset-1 col-md-2" id="price" align="center">
			<label><br><h4><b>상품금액</b></h4></label>
			<p id="selectedPrice">
			
			</p>
			<br>
		</div>
		<div class="col-sm-1" align="center">
			<br><br><br><span class="glyphicon glyphicon-minus"></span>
		</div>
		
		
		<%-- 할인금액 --%>
		<div class="col-md-2" id="price" align="center">
			<label><h4><br><b>할인금액</b></h4></label>
			<p id="discountPrice">
			</p>
		</div>
		<div class="col-sm-1" align="center">
			<br><br><br><span class="glyphicon glyphicon-plus"></span>
		</div>
		
		
		<%-- 배송금액 --%>
		<div class="col-md-2" id="price" align="center">
			<label><br><br><h4><b>배송비</b></h4></label>
			<p id="shippingPrice">
				<h4>2,500 원</h4><br>
			</p>
		</div>
		<div class="col-sm-1" align="center">
			<br><br><br><span class="glyphicon glyphicon-chevron-right"></span>
		</div>
		
		
		<%-- 총 결제 금액 --%>
		<div class="col-md-2" id="price" align="center">
			<label><br><br><h4><b>총 결제 금액</b></h4></label>
			<p id="totalPrice">
			
			</p>
		</div>
	</div>
	<br><br><br>
	
	<%--=================================== 결제/ 취소 버튼 ========================================== --%>
	<div align="center">
		<%-- <a href="${path}/cart/pay.do?account_user=${account_user}&totalPrice="><input type="button" class="btn btn-primary" onClick="cartToBuy(${account_user})" value="구매구매"></a> --%>
		<a id="toMainBtn" href="${path}/"><input type="button" class="toMainBtn" value="메인으로" style="font-weight:bold"></a>
		<a id="payBtn"><input type="button" class="payBtn" onClick="cartToBuy(${account_user})" value="결제하기" style="font-weight:bold"></a>
	</div>
	<br><br>
	
	
	<%--======================================= 부가설명 ========================================== --%>
	<div align="center">
		<label id="buyInfo">
			<h6 align="center">
				주문 취소는 샛별지역:배송일 전날 19시까지/택배지역:배송일 전날 18시까지<br><br>
				고객센터(1644-1107) 1:1문의 게시판/카카오톡으로 취소 요청 바랍니다.
			</h6>
		</label>
	</div>
	
	<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<footer>
		<jsp:include page="../module/Bottom.jsp" flush="false"/>
	</footer>
</body>
</html>