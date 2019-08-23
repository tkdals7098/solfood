<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" Content="text/html; charset=UTF-8">
	<title>SolFood doyoon</title>
	<script>
		$(document).ready(function(){
			recentList();
		});

		function recentList(){
			var account_user= document.getElementsByName("account_user")[0].value;
			var json= {"account_user":account_user};
			var html="";
			
			$.ajax({
				type: "post",
				url: "/recentList.do",
				data: json,
				success: function(data){
					for(var i=0; i<data.length; i++){						
						html+= "<a href='${path}/product/productInfo.do?product_id="+ data[i].product_id +"'><img src='/img/" + data[i].product_image + "' style='width:50px; height:auto;'/></a>";
						html+= "<a href='${path}/product/productInfo.do?product_id="+ data[i].product_id +"'><h5>"+ data[i].product_name+ "</h5></a>";
						// <img src="/img/${productList.product_image}" width="350px" height="500px;">

						$("#recent").html(html);
					}
				},
				error: function(){
					alert("recentList ajax fail");
				}
			});
																
		}
	</script>
	
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		.recTit{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>
</head>	
<body>
	<%-- account_user 값 받기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user">
	
		<div id="rightSide">
		<div id="right_zzim">
			<div class="recTit" align="center">최근본상품 <span id=recentCnt></span></div>
				<p id="recent" align="center">
				</p>
			<!-- 본 상품이 뿌려질 부분  -->
			<div id="paging"><a class="btn_prev" style="cursor:pointer" >이전</a><span  id="currentPage"></span><span id="totalPageCount"></span><a class="btn_next" style="cursor:pointer" >다음</a></div>
		</div>
	</div> 
</body>
</html>

