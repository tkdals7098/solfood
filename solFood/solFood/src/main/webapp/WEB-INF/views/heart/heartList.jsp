<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>heartList</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../resources/css/component.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		// 페이지가 로드되면 hear list 표시하기 
		$(document).ready(function(){
			heartList();
		});
		
		//----------------------------------------------
		//	heartList()
		//----------------------------------------------
		function heartList(){
			var account_user = document.getElementsByName("account_user")[0].value;
			var json= {"account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/heart/heartListForHeartList.do",
				data: json,
				success: function(data){
					var html= "";
					var cnt= data.length;
					
					// table에 heart list 붙이기
					if(cnt> 0){	
						for(i=0; i<cnt; i++){
							html+= "<tr height='50' class='info'>";
							html+= "<td align='center' width='30' height='170'><input type='button' id='subBtn1' value='담기' onclick='insertToCart("+ data[i].product_id +","+ account_user +")' class='btn btn-sm btn-primary'></td>";
							html+= "<td align='center' width='30' height='170'><input type='button' id='subBtn1' value='삭제' onclick='deleteFromHeart("+ data[i].product_id +","+ account_user +")' class='btn btn-sm btn-success'></td>";
							html+= "<td align='center' width='100' height='170'><a href='${path}/product/productInfo.do?product_id="+ data[i].product_id +"'><img src='/img/"+ data[i].product_image +"' style='width:120px; height:auto;'/></a></td>";
							html+= "<td align='center' width='100' height='170'><a href='${path}/product/productInfo.do?product_id="+ data[i].product_id +"'>"+ data[i].product_name+ "</a></td>";
							html+= "<td align='center' width='100' height='170'>"+ data[i].product_price+ "원</td>";
							html+= "</tr>";		
						}
						$("#heartList").html(html);
						html= "";
					} else{
						$("#heartList").html(html);
					}
				},
				error: function(){
					alert("heartList error");
				}
			});
		}
		
		//----------------------------------------------
		//	insertToCart()
		//----------------------------------------------
		function insertToCart(product_id, account_user){		
			var purchase_count= 1;
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
						alert("장바구니 넣기 완료되었습니다.");
						deleteFromHeart(product_id, account_user);
					} else if(data== "replace"){
						var result= confirm("장바구니에 있는 상품입니다. 찜한 상품에서 삭제하시겠습니까?");
						if(result){
							deleteFromHeart(product_id, account_user);
						}
					} 			
					heartList();	
				},
				error: function(){
					alert("insertToCart error");
					heartList();
				}
			});
		}
		
		//----------------------------------------------
		//	deleteFromHeart()
		//----------------------------------------------
		function deleteFromHeart(product_id, account_user){			
			var state= "unclick";
			var json= {"account_user":account_user, "product_id":product_id, "state":state};
			
			$.ajax({
				type: "post",
				url: "/heart/changeHeart.do",
				data: json,
				success: function(){
					heartList();
				},
				error: function(){
					alert("deleteFromHeart error");
					heartList();
				}
			});
		}
	</script>
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		.tableHead {
			background-color: white;
			border-top: 2px solid #363636;
		}
		#subBtn1 {
			border: 1px solid;
			border-color: #f0f0f0;
			width: 70px;
			height: 40px;
			outline: none;
			background-color: #f0f0f0;
			color: #363636;
			text-align: center;
			border-radius: 0;
			font-weight: bold;
			font-size: 14px;
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		#subBtn2 {
			border: 1px solid;
			width: 100px;
			height: 40px;
			outline: none;
			background-color: #f0f0f0;  
			border-color: #f0f0f0;
			font-weight: normal;
			color: #363636;
			text-align: center;
			border-radius: 0;
			font-weight: bold;
			font-size: 15px;
			font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>
</head>
<body>
<%--============================== header =================================--%>
	<header>
		<jsp:include page="../module/Top.jsp" flush="false"/>
	</header>

<%--============================== content =================================--%>
	<%-- account_user 받기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user">

	<%-- 찜한 상품 목록 --%>
	<h2 align="center">찜한 상품</h2>
	
	<div class="container" style="margin-top:30px">
		<table class="table">
			<tr height="50" class="tableHead" align="center">
				<td align= "center" width="30">장바구니 담기</td>
				<td align= "center" width="30">삭제</td>
				<td align= "center" width="50">사진</td>
				<td align= "center" width="50">상품명</td>
				<td align= "center" width="50">가격</td>
			</tr>
		</table>
	</div>
	
	<div class="container">
		<table class="table" id="heartList">
			
		</table>
	</div>
	<br><br><br>
	
	<%-- 버튼--%>
	<div class="container" align="center">
		<a href="${path}/"><input type="button" id="subBtn2" value="메인으로" class="btn btn-md btn-warning"></a>
		<a href="${path}/cart/cartList.do?account_user=${login.account_user}"><input type="button" id="subBtn2" value="장바구니로" class="btn btn-md btn-primary"></a>
	</div>
	<br><br><br><br>

<%--============================== bottom =================================--%>
	<footer>
		<jsp:include page="../module/Bottom.jsp" flush="false"/>
	</footer>
</body>
</html>



