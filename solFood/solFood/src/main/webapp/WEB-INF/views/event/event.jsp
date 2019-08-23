<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event specific</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../../resources/css/component.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script>
		// 페이지가 로드되면 hear list 표시하기 
		$(document).ready(function(){
			heartList();
		});

		//----------------------------------------------------------------
		// 	heartState--> 페이지 로드시 heart 상태 표시
		//----------------------------------------------------------------
		function heartList(){
			var account_user = document.getElementsByName("account_user")[0].value;
			var product_id;
			var html;
			
			// heart table 데이터 받아오기
			$.ajax({
				type: "GET",
				datatype: "json",
				url: "/heart/heartList.do",
				
				success: function(data){
					// 로그인한 아이디가 heart table에 있는 거랑 같은 아이디일때만 그 해당 아이디가 heart누른 product_id를 heartList에 집어넣기					
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				},
				error: function(){
					for(var i=0; i<data.length; i++){						
						if(data[i].account_user== account_user){								
							// data[i].product_id= heartList[i];	
							$("[name='heartImage"+ data[i].product_id +"']").attr({
								'class' : 'afterClick'
							});							 
						}
					}
				}
			});
		}
		
		//----------------------------------------------------------------
		// 	changeHeart--> heart 상태 변경 및 테이블에서 insert or delete
		//----------------------------------------------------------------
		function changeHeart(product_id, account_user){	
			var json;	
			var state;

			// beforeClick이면 afterClick으로, 아니면 그 반대로 해주는거
			$("[name='heartImage"+ product_id +"']").toggleClass("beforeClick afterClick");

			// name에 따른 class 이름 구하기
			var class_by_name= $("[name='heartImage"+ product_id +"']").attr('class');

			// toggleClass하고 나서 afterClick이 되면 heart 테이블에 들어가야하는 거니까 json에 state="click" 보내서 insertHeart가 실행되게 하기
			if(class_by_name== "afterClick"){
				state= "click";
				json= {"product_id":product_id, "state":state, "account_user":account_user};
				
				$.ajax({
					type: "post",
					url: "/heart/changeHeart.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});

			// afterClick이었다가 beforeClick으로 바뀌면 state="unclick"으로 보내서 deleteHeart가 실행되게 하기 
			} else if(class_by_name== "beforeClick"){
				state= "unclick";
				json= {"product_id":product_id, "state":state, "account_user":account_user};
				
				$.ajax({
					type: "post",
					url: "/heart/changeHeart.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});
			}
		}

	</script>
	<style>
		.afterClick{
			background-image: url("/resources/image/afterlike.PNG");
			border: none;
			background-size: 28px;
		}
		.beforeClick{
			background-image: url("/resources/image/beforelike.PNG");
			border: none;
			background-size: 28px;
		}
	</style>
	
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		h2{
			font-family: 'Noto Sans KR', sans-serif !important;
			font-weight: bold;
		}
		div{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		.eventTitle{
			font-family: 'Noto Sans KR', sans-serif !important;
			font-weight: bold;
		}
	</style>
</head>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ event ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<div class="container">
		<!-- account_user 받기 -->
		<input type='text' hidden='true' value='${login.account_user}' name='account_user'/>

	       	<%-- product_event에 따라 제목 바꿔주기 --%>
	       	<c:choose>
		       <c:when test="${product_event== 1}">
		           <h2 class="eventTitle">한식 제품 특가</h2><br><br>
		       </c:when>
		       <c:when test="${product_event== 2}">
		           <h2 class="eventTitle">유제품 특가</h2><br><br>
		       </c:when>
		       <c:when test="${product_event== 3}">
		           <h2 class="eventTitle">삼진어묵 특가</h2><br><br>
		       </c:when>
		        <c:when test="${product_event== 4}">
		           <h2 class="eventTitle">따끈따끈 브레드</h2><br><br>
		       </c:when>
		        <c:when test="${product_event== 5}">
		           <h2 class="eventTitle">다이어트의 계절</h2><br><br>
		       </c:when>
		        <c:when test="${product_event== 6}">
		           <h2 class="eventTitle">프리미엄 요거트</h2><br><br>
		       </c:when>
		        <c:when test="${product_event== 7}">
		           <h2 class="eventTitle">신선한 커피</h2><br><br>
		       </c:when>
		        <c:when test="${product_event== 8}">
		           <h2 class="eventTitle">신선한 해물</h2><br><br>
		       </c:when>
		       <c:otherwise>
		       		<h2 class="eventTitle">NO EVENT</h2>
		       </c:otherwise>
		   </c:choose>
	       	
	       	<%-- 상품 뿌리기 --%>
	        <div class="row" id="allVegeC">
				<c:forEach items="${eventList}" var="event">
					<div class="col-xs-4" align="center">
					
						<%-- ============= 상품 id, 사진, 이름, 찜하기, 가격 순 =============--%>
						<input type="text" hidden="true" value= "${event.product_id}" name="product_id"/>
						<a href="${path}/product/productInfo.do?product_id=${event.product_id}"><img src="/img/${event.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
				      	${event.product_name}&nbsp;
				 
						<%-- login 값이 없으면 하트 안보이게 --%>
				 		<c:choose>
						    <c:when test="${login.account_user== null}">
								<br>
						    </c:when>
						    <c:otherwise>
						   		<input type="button" id='heartImage' name='heartImage${event.product_id}' onclick= "changeHeart(${event.product_id},${login.account_user})" class='beforeClick' style="width:29px; height:23px;"><br>
						    </c:otherwise>
						</c:choose>
						
						${event.product_price}원<br><br><br><br>
				    </div>
				</c:forEach>
			</div>
	</div>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>