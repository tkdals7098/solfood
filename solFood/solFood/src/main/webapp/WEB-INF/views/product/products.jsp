<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리별 상품</title>
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
				type: "get",
				datatype: "json",
				url: "/heart/heartListForProductList.do",
				
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
			outline: none;
			background-size: 28px;
		}
		.beforeClick{
			background-image: url("/resources/image/beforelike.PNG");
			border: none;
			outline: none;
			background-size: 28px;
		}
	</style>
</head>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<header>
		<%@ include file = "../module/Top.jsp" %>
	</header>
	<br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 채소·과일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
	<!-- account_user 받기 -->
	<input type='text' hidden='true' value='${login.account_user}' name='account_user'/>
	
	 		
	<!--  상품 -->
	<c:set var="cate" value="${param.product_category1}"/>
	<c:choose>
	<c:when test="${cate eq '채소·과일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
			<div class="row">
				<div class="col-xs-offset-2">
					<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
				</div>
			</div>
			<br><br><br>
			<%-- Category 분류 jQuery 접어두는걸 추천 --%>
			<script>
			$('#allVege').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
			});
			$('#koFruit').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
			});
			$('#foFruit').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
			});
			$('#basicVege').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
			});
			$('#simpleVege').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
			});
			$('#mushroom').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
			});
			$('#onion').click(function(){
				$('#allVegeC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
			});
			</script>
				<div class="container" id="allVegeC">
				<c:forEach items="${products}" var="products">
			
					<div class="col-xs-4" align="center">
				
						<!--===================  상품 id, 사진, 이름, 찜하기, 가격 순 ========================-->
						<input type="text" hidden="true" value= "${products.product_id}" name="product_id"/>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:200px; height:auto;"/></a><br><br>				     
				      	${products.product_name}&nbsp;
				 
				 		<!-- login 값이 없으면 하트 안보이게 -->
				 		<c:choose>
						    <c:when test="${login.account_user== null}">
								<br>
						    </c:when>
						    <c:otherwise>
						   		<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id},${login.account_user})" class='beforeClick' style="width:29px; height:23px;"><br>
						    </c:otherwise>
						</c:choose>

						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
					</div>
				</c:forEach>
				</div>
	</c:when>
	</c:choose>

		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '국산과일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#koFruitC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="koFruitC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '수입과일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#foFruitC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="foFruitC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '기본채소'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#basicVegeC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="basicVegeC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '쌈·간편채소'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#simpleVegeC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="simpleVegeC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '콩나물·버섯류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#mushroomC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="mushroomC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '양파·마늘·생강·파'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allVege">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="koFruit">국산과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="foFruit">수입과일</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="basicVege">기본채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="simpleVege">쌈·간편채소</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mushroom">콩나물·버섯류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="onion">양파·마늘·생강·파</button>
			</div>
		</div>
		<script>
		$('#allVege').click(function(){
			$('#onionC').load('http://localhost:8080/product/products1.do?product_category1=채소·과일 #allVegeC');
		});
		$('#koFruit').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=국산과일 #koFruitC');
		});
		$('#foFruit').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=수입과일 #foFruitC');
		});
		$('#basicVege').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=기본채소 #basicVegeC');
		});
		$('#simpleVege').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=쌈·간편채소 #simpleVegeC');
		});
		$('#mushroom').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=콩나물·버섯류 #mushroomC');
		});
		$('#onion').click(function(){
			$('#onionC').load('http://localhost:8080/product/products2.do?product_category2=양파·마늘·생강·파 #onionC');
		});
		</script>
		<br><br><br>
			<div class="row" id="onionC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 채소·과일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>



<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 국·반찬·요리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
		<c:set var="cate" value="${param.product_category1}"/>
		<c:choose>
		<c:when test="${cate eq '국·반찬·요리'}">
	
	<div class="col-xs-offset-1">
	<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
	</div>
	<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<br><br><br>
		
		<%-- Category 분류 jQuery 접어두는걸 추천 --%>
		<script>
		$('#allFood').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#allFoodC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
	

			<div class="row" id="allFoodC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '국·탕·찌개'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#stewC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#stewC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		
		</script>
		<br><br><br>
			<div class="row" id="stewC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '밑반찬'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#sideDishC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="sideDishC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '김치·장아찌·젓갈'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#kimchiC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="kimchiC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '두부·어묵'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#tofuC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="tofuC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '메인요리'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFood">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="stew">국·탕·찌개</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="sideDish">밑반찬</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="kimchi">김치·장아찌·젓갈</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="tofu">두부·어묵</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="mainDish">메인요리</button>
			</div>
		</div>
		<script>
		$('#allFood').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products1.do?product_category1=국·반찬·요리 #allFoodC');
		});
		$('#stew').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=국·탕·찌개 #stewC');
		});
		$('#sideDish').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=밑반찬 #sideDishC');
		});
		$('#kimchi').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=김치·장아찌·젓갈 #kimchiC');
		});
		$('#tofu').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=두부·어묵 #tofuC');
		});
		$('#mainDish').click(function(){
			$('#mainDishC').load('http://localhost:8080/product/products2.do?product_category2=메인요리 #mainDishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="mainDishC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 국·반찬·요리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>

	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 면·양념·오일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<div class="container">
	<c:set var="cate" value="${param.product_category1}"/>
	<c:choose>
	<c:when test="${cate eq '면·양념·오일'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/noodle.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
			<div class="row">
				<div class="col-xs-offset-2">
					<button class="bttn-stretch bttn-md bttn-primary" id="allNoodle">전체보기</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="pasta">파스타·면류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="flour">밀가루·가루·믹스</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="source">향신료·소스·드레싱</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="seasoning">양념·액젓·장류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="salt">소금·설탕·식초</button>
				</div>
			</div>
			<br><br><br>
			<%-- Category 분류 jQuery 접어두는걸 추천 --%>
			<script>
			$('#allNoodle').click(function(){
				$('#allNoodleC').load('http://localhost:8080/product/products1.do?product_category1=면·양념·오일 #allNoodleC');
			});
			$('#pasta').click(function(){
				$('#allNoodleC').load('http://localhost:8080/product/products2.do?product_category2=파스타·면류 #pastaC');
			});
			$('#flour').click(function(){
				$('#allNoodleC').load('http://localhost:8080/product/products2.do?product_category2=밀가루·가루·믹스 #flourC');
			});
			$('#source').click(function(){
				$('#allNoodleC').load('http://localhost:8080/product/products2.do?product_category2=향신료·소스·드레싱 #sourceC');
			});
			$('#seasoning').click(function(){
				$('#allNoodleC').load('http://localhost:8080/product/products2.do?product_category2=양념·액젓·장류 #seasoningC');
			});
			$('#salt').click(function(){
				$('#allNoodleC').load('http://localhost:8080/product/products2.do?product_category2=소금·설탕·식초 #saltC');
			});
			</script>
	
				<div class="row" id="allNoodleC">
				<c:forEach items="${products}" var="products">
					<div class="col-xs-4" align="center">
					
						<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
				    </div>
				</c:forEach>
			  	</div>
		</c:when>
	</c:choose>

		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '파스타·면류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/noodle.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allNoodle">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pasta">파스타·면류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="flour">밀가루·가루·믹스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="source">향신료·소스·드레싱</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seasoning">양념·액젓·장류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salt">소금·설탕·식초</button>
			</div>
		</div>
		<script>
		$('#allNoodle').click(function(){
			$('#pastaC').load('http://localhost:8080/product/products1.do?product_category1=면·양념·오일 #allNoodleC');
		});
		$('#pasta').click(function(){
			$('#pastaC').load('http://localhost:8080/product/products2.do?product_category2=파스타·면류 #pastaC');
		});
		$('#flour').click(function(){
			$('#pastaC').load('http://localhost:8080/product/products2.do?product_category2=밀가루·가루·믹스 #flourC');
		});
		$('#source').click(function(){
			$('#pastaC').load('http://localhost:8080/product/products2.do?product_category2=향신료·소스·드레싱 #sourceC');
		});
		$('#seasoning').click(function(){
			$('#pastaC').load('http://localhost:8080/product/products2.do?product_category2=양념·액젓·장류 #seasoningC');
		});
		$('#salt').click(function(){
			$('#pastaC').load('http://localhost:8080/product/products2.do?product_category2=소금·설탕·식초 #saltC');
		});
		</script>
		<br><br><br>
			<div class="row" id="pastaC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '밀가루·가루·믹스'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/noodle.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allNoodle">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pasta">파스타·면류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="flour">밀가루·가루·믹스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="source">향신료·소스·드레싱</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seasoning">양념·액젓·장류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salt">소금·설탕·식초</button>
			</div>
		</div>
		<script>
		$('#allNoodle').click(function(){
			$('#flourC').load('http://localhost:8080/product/products1.do?product_category1=면·양념·오일 #allNoodleC');
		});
		$('#pasta').click(function(){
			$('#flourC').load('http://localhost:8080/product/products2.do?product_category2=파스타·면류 #pastaC');
		});
		$('#flour').click(function(){
			$('#flourC').load('http://localhost:8080/product/products2.do?product_category2=밀가루·가루·믹스 #flourC');
		});
		$('#source').click(function(){
			$('#flourC').load('http://localhost:8080/product/products2.do?product_category2=향신료·소스·드레싱 #sourceC');
		});
		$('#seasoning').click(function(){
			$('#flourC').load('http://localhost:8080/product/products2.do?product_category2=양념·액젓·장류 #seasoningC');
		});
		$('#salt').click(function(){
			$('#flourC').load('http://localhost:8080/product/products2.do?product_category2=소금·설탕·식초 #saltC');
		});
		</script>
		<br><br><br>
			<div class="row" id="flourC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '향신료·소스·드레싱'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/noodle.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allNoodle">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pasta">파스타·면류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="flour">밀가루·가루·믹스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="source">향신료·소스·드레싱</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seasoning">양념·액젓·장류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salt">소금·설탕·식초</button>
			</div>
		</div>
		<script>
		$('#allNoodle').click(function(){
			$('#sourceC').load('http://localhost:8080/product/products1.do?product_category1=면·양념·오일 #allNoodleC');
		});
		$('#pasta').click(function(){
			$('#sourceC').load('http://localhost:8080/product/products2.do?product_category2=파스타·면류 #pastaC');
		});
		$('#flour').click(function(){
			$('#sourceC').load('http://localhost:8080/product/products2.do?product_category2=밀가루·가루·믹스 #flourC');
		});
		$('#source').click(function(){
			$('#sourceC').load('http://localhost:8080/product/products2.do?product_category2=향신료·소스·드레싱 #sourceC');
		});
		$('#seasoning').click(function(){
			$('#sourceC').load('http://localhost:8080/product/products2.do?product_category2=양념·액젓·장류 #seasoningC');
		});
		$('#salt').click(function(){
			$('#sourceC').load('http://localhost:8080/product/products2.do?product_category2=소금·설탕·식초 #saltC');
		});
		</script>
		<br><br><br>
			<div class="row" id="sourceC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '양념·액젓·장류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/noodle.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allNoodle">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pasta">파스타·면류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="flour">밀가루·가루·믹스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="source">향신료·소스·드레싱</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seasoning">양념·액젓·장류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salt">소금·설탕·식초</button>
			</div>
		</div>
		<script>
		$('#allNoodle').click(function(){
			$('#seasoningC').load('http://localhost:8080/product/products1.do?product_category1=면·양념·오일 #allNoodleC');
		});
		$('#pasta').click(function(){
			$('#seasoningC').load('http://localhost:8080/product/products2.do?product_category2=파스타·면류 #pastaC');
		});
		$('#flour').click(function(){
			$('#seasoningC').load('http://localhost:8080/product/products2.do?product_category2=밀가루·가루·믹스 #flourC');
		});
		$('#source').click(function(){
			$('#seasoningC').load('http://localhost:8080/product/products2.do?product_category2=향신료·소스·드레싱 #sourceC');
		});
		$('#seasoning').click(function(){
			$('#seasoningC').load('http://localhost:8080/product/products2.do?product_category2=양념·액젓·장류 #seasoningC');
		});
		$('#salt').click(function(){
			$('#seasoningC').load('http://localhost:8080/product/products2.do?product_category2=소금·설탕·식초 #saltC');
		});
		</script>
		<br><br><br>
			<div class="row" id="seasoningC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '소금·설탕·식초'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/noodle.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allNoodle">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pasta">파스타·면류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="flour">밀가루·가루·믹스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="source">향신료·소스·드레싱</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seasoning">양념·액젓·장류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salt">소금·설탕·식초</button>
			</div>
		</div>
		<script>
		$('#allNoodle').click(function(){
			$('#saltC').load('http://localhost:8080/product/products1.do?product_category1=면·양념·오일 #allNoodleC');
		});
		$('#pasta').click(function(){
			$('#saltC').load('http://localhost:8080/product/products2.do?product_category2=파스타·면류 #pastaC');
		});
		$('#flour').click(function(){
			$('#saltC').load('http://localhost:8080/product/products2.do?product_category2=밀가루·가루·믹스 #flourC');
		});
		$('#source').click(function(){
			$('#saltC').load('http://localhost:8080/product/products2.do?product_category2=향신료·소스·드레싱 #sourceC');
		});
		$('#seasoning').click(function(){
			$('#saltC').load('http://localhost:8080/product/products2.do?product_category2=양념·액젓·장류 #seasoningC');
		});
		$('#salt').click(function(){
			$('#saltC').load('http://localhost:8080/product/products2.do?product_category2=소금·설탕·식초 #saltC');
		});
		</script>
		<br><br><br>
			<div class="row" id="saltC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 면·양념·오일 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>

<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 정육·계란 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
		<c:set var="cate" value="${param.product_category1}"/>
		<c:choose>
		<c:when test="${cate eq '정육·계란'}">
	
	<div class="col-xs-offset-1">
	<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
	</div>
	<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div><br><br><br>
		<%-- Category 분류 jQuery 접어두는걸 추천 --%>
		<script>
		$('#allMeat').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#allMeatC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>

			<div class="row" id="allMeatC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '소고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#beafC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#beafC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="beafC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '돼지고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#porkC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#porkC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="porkC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '양고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#lambC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#lambC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="lambC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '닭·오리고기'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#chickenC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="chickenC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '계란·돈까스'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allMeat">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="beaf">소고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="pork">돼지고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="lamb">양고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="chicken">닭·오리고기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="egg">계란·돈까스</button>
			</div>
		</div>
		<script>
		$('#allMeat').click(function(){
			$('#eggC').load('http://localhost:8080/product/products1.do?product_category1=정육·계란 #allMeatC');
		});
		$('#beaf').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=소고기 #beafC');
		});
		$('#pork').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=돼지고기 #porkC');
		});
		$('#lamb').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=양고기 #lambC');
		});
		$('#chicken').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=닭·오리고기 #chickenC');
		});
		$('#egg').click(function(){
			$('#eggC').load('http://localhost:8080/product/products2.do?product_category2=계란·돈까스 #eggC');
		});
		</script>
		<br><br><br>
			<div class="row" id="eggC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 정육·계란 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>

	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 수산·해산 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<div class="container">
	<c:set var="cate" value="${param.product_category1}"/>
	<c:choose>
	<c:when test="${cate eq '수산·해산'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/fishery.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
			<div class="row">
				<div class="col-xs-offset-2">
					<button class="bttn-stretch bttn-md bttn-primary" id="allFish">전체보기</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="fishes">생선류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="squid">오징어·낙지·문어</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="clam">해산물·조개류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="seaweed">김·미역</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="driedFish">건어물·다시팩</button>
				</div>
			</div>
			<br><br><br>
			<%-- Category 분류 jQuery 접어두는걸 추천 --%>
			<script>
			$('#allFish').click(function(){
				$('#allFishC').load('http://localhost:8080/product/products1.do?product_category1=수산·해산 #allFishC');
			});
			$('#fishes').click(function(){
				$('#allFishC').load('http://localhost:8080/product/products2.do?product_category2=생선류 #fishesC');
			});
			$('#squid').click(function(){
				$('#allFishC').load('http://localhost:8080/product/products2.do?product_category2=오징어·낙지·문어 #squidC');
			});
			$('#clam').click(function(){
				$('#allFishC').load('http://localhost:8080/product/products2.do?product_category2=해산물·조개류 #clamC');
			});
			$('#seaweed').click(function(){
				$('#allFishC').load('http://localhost:8080/product/products2.do?product_category2=김·미역 #seaweedC');
			});
			$('#driedFish').click(function(){
				$('#allFishC').load('http://localhost:8080/product/products2.do?product_category2=건어물·다시팩 #driedFishC');
			});
			</script>
	
				<div class="row" id="allFishC">
				<c:forEach items="${products}" var="products">
					<div class="col-xs-4" align="center">
					
						<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
				    </div>
				</c:forEach>
			  	</div>
		</c:when>
	</c:choose>

		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '생선류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/fishery.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFish">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="fishes">생선류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="squid">오징어·낙지·문어</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="clam">해산물·조개류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seaweed">김·미역</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="driedFish">건어물·다시팩</button>
			</div>
		</div>
		<script>
		$('#allFish').click(function(){
			$('#fishesC').load('http://localhost:8080/product/products1.do?product_category1=수산·해산 #allFishC');
		});
		$('#fishes').click(function(){
			$('#fishesC').load('http://localhost:8080/product/products2.do?product_category2=생선류 #fishesC');
		});
		$('#squid').click(function(){
			$('#fishesC').load('http://localhost:8080/product/products2.do?product_category2=오징어·낙지·문어 #squidC');
		});
		$('#clam').click(function(){
			$('#fishesC').load('http://localhost:8080/product/products2.do?product_category2=해산물·조개류 #clamC');
		});
		$('#seaweed').click(function(){
			$('#fishesC').load('http://localhost:8080/product/products2.do?product_category2=김·미역 #seaweedC');
		});
		$('#driedFish').click(function(){
			$('#fishesC').load('http://localhost:8080/product/products2.do?product_category2=건어물·다시팩 #driedFishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="fishesC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			    	<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '오징어·낙지·문어'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/fishery.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFish">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="fishes">생선류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="squid">오징어·낙지·문어</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="clam">해산물·조개류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seaweed">김·미역</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="driedFish">건어물·다시팩</button>
			</div>
		</div>
		<script>
		$('#allFish').click(function(){
			$('#squidC').load('http://localhost:8080/product/products1.do?product_category1=수산·해산 #allFishC');
		});
		$('#fishes').click(function(){
			$('#squidC').load('http://localhost:8080/product/products2.do?product_category2=생선류 #fishesC');
		});
		$('#squid').click(function(){
			$('#squidC').load('http://localhost:8080/product/products2.do?product_category2=오징어·낙지·문어 #squidC');
		});
		$('#clam').click(function(){
			$('#squidC').load('http://localhost:8080/product/products2.do?product_category2=해산물·조개류 #clamC');
		});
		$('#seaweed').click(function(){
			$('#squidC').load('http://localhost:8080/product/products2.do?product_category2=김·미역 #seaweedC');
		});
		$('#driedFish').click(function(){
			$('#squidC').load('http://localhost:8080/product/products2.do?product_category2=건어물·다시팩 #driedFishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="squidC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '해산물·조개류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/fishery.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFish">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="fishes">생선류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="squid">오징어·낙지·문어</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="clam">해산물·조개류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seaweed">김·미역</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="driedFish">건어물·다시팩</button>
			</div>
		</div>
		<script>
		$('#allFish').click(function(){
			$('#clamC').load('http://localhost:8080/product/products1.do?product_category1=수산·해산 #allFishC');
		});
		$('#fishes').click(function(){
			$('#clamC').load('http://localhost:8080/product/products2.do?product_category2=생선류 #fishesC');
		});
		$('#squid').click(function(){
			$('#clamC').load('http://localhost:8080/product/products2.do?product_category2=오징어·낙지·문어 #squidC');
		});
		$('#clam').click(function(){
			$('#clamC').load('http://localhost:8080/product/products2.do?product_category2=해산물·조개류 #clamC');
		});
		$('#seaweed').click(function(){
			$('#clamC').load('http://localhost:8080/product/products2.do?product_category2=김·미역 #seaweedC');
		});
		$('#driedFish').click(function(){
			$('#clamC').load('http://localhost:8080/product/products2.do?product_category2=건어물·다시팩 #driedFishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="clamC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			     <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '김·미역'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/fishery.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFish">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="fishes">생선류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="squid">오징어·낙지·문어</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="clam">해산물·조개류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seaweed">김·미역</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="driedFish">건어물·다시팩</button>
			</div>
		</div>
		<script>
		$('#allFish').click(function(){
			$('#seaweedC').load('http://localhost:8080/product/products1.do?product_category1=수산·해산 #allFishC');
		});
		$('#fishes').click(function(){
			$('#seaweedC').load('http://localhost:8080/product/products2.do?product_category2=생선류 #fishesC');
		});
		$('#squid').click(function(){
			$('#seaweedC').load('http://localhost:8080/product/products2.do?product_category2=오징어·낙지·문어 #squidC');
		});
		$('#clam').click(function(){
			$('#seaweedC').load('http://localhost:8080/product/products2.do?product_category2=해산물·조개류 #clamC');
		});
		$('#seaweed').click(function(){
			$('#seaweedC').load('http://localhost:8080/product/products2.do?product_category2=김·미역 #seaweedC');
		});
		$('#driedFish').click(function(){
			$('#seaweedC').load('http://localhost:8080/product/products2.do?product_category2=건어물·다시팩 #driedFishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="seaweedC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			     <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '건어물·다시팩'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/fishery.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFish">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="fishes">생선류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="squid">오징어·낙지·문어</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="clam">해산물·조개류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="seaweed">김·미역</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="driedFish">건어물·다시팩</button>
			</div>
		</div>
		<script>
		$('#allFish').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products1.do?product_category1=수산·해산 #allFishC');
		});
		$('#fishes').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=생선류 #fishesC');
		});
		$('#squid').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=오징어·낙지·문어 #squidC');
		});
		$('#clam').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=해산물·조개류 #clamC');
		});
		$('#seaweed').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=김·미역 #seaweedC');
		});
		$('#driedFish').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=건어물·다시팩 #driedFishC');
		});
		</script>
		<br><br><br>
			<div class="row" id="driedFishC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			  <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 수산·해산 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>


<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 샐러드·간편식 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
<div class="container">
		<c:set var="cate" value="${param.product_category1}"/>
		<c:choose>
		<c:when test="${cate eq '샐러드·간편식'}">
	
	<div class="col-xs-offset-1">
	<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
	</div>
	<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<br><br><br>
		<%-- Category 분류 jQuery 접어두는걸 추천 --%>
		<script>
		$('#allFresh').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#allFreshC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>

			<div class="row" id="allFreshC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '샐러드·도시락'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#saladC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#saladC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="saladC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '간편식·냉동식품'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#frozenFoodC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="frozenFoodC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '죽·수프'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#soupC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#soupC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="soupC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '선식·시리얼·그래놀라'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/vegetables.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allFresh">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="salad">샐러드·도시락</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="frozenFood">간편식·냉동식품</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="soup">죽·수프</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cereal">선식·시리얼·그래놀라</button>
			</div>
		</div>
		<script>
		$('#allFresh').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products1.do?product_category1=샐러드·간편식 #allFreshC');
		});
		$('#salad').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=샐러드·도시락 #saladC');
		});
		$('#frozenFood').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=간편식·냉동식품 #frozenFoodC');
		});
		$('#soup').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=죽·수프 #soupC');
		});
		$('#cereal').click(function(){
			$('#cerealC').load('http://localhost:8080/product/products2.do?product_category2=선식·시리얼·그래놀라 #cerealC');
		});
		</script>
		<br><br><br>
			<div class="row" id="cerealC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 샐러드·간편식 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>

	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 음료·우유·간식 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<div class="container">
	<c:set var="cate" value="${param.product_category1}"/>
	<c:choose>
	<c:when test="${cate eq '음료·우유·간식'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/coffee-cup.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
			<div class="row">
				<div class="col-xs-offset-2">
					<button class="bttn-stretch bttn-md bttn-primary" id="allDrink">전체보기</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="drinks">생수·음료·주스</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="coffee">커피·차</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="milk">우유·두유</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="candy">초콜릿·젤리·캔디</button>
				</div>
			</div>
			<br><br><br>
			<%-- Category 분류 jQuery 접어두는걸 추천 --%>
			<script>
			$('#allDrink').click(function(){
				$('#allDrinkC').load('http://localhost:8080/product/products1.do?product_category1=음료·우유·간식 #allDrinkC');
			});
			$('#drinks').click(function(){
				$('#allDrinkC').load('http://localhost:8080/product/products2.do?product_category2=생수·음료·주스 #drinksC');
			});
			$('#coffee').click(function(){
				$('#allDrinkC').load('http://localhost:8080/product/products2.do?product_category2=커피·차 #coffeeC');
			});
			$('#milk').click(function(){
				$('#allDrinkC').load('http://localhost:8080/product/products2.do?product_category2=우유·두유 #milkC');
			});
			$('#candy').click(function(){
				$('#allDrinkC').load('http://localhost:8080/product/products2.do?product_category2=초콜릿·젤리·캔디 #candyC');
			});
			</script>
	
				<div class="row" id="allDrinkC">
				<c:forEach items="${products}" var="products">
					<div class="col-xs-4" align="center">
					
						<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
				    </div>
				</c:forEach>
			  	</div>
		</c:when>
	</c:choose>

		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '생수·음료·주스'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/coffee-cup.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allDrink">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="drinks">생수·음료·주스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="coffee">커피·차</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="milk">우유·두유</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="candy">초콜릿·젤리·캔디</button>
			</div>
		</div>
		<script>
		$('#allDrink').click(function(){
			$('#drinksC').load('http://localhost:8080/product/products1.do?product_category1=음료·우유·간식 #allDrinkC');
		});
		$('#drinks').click(function(){
			$('#drinksC').load('http://localhost:8080/product/products2.do?product_category2=생수·음료·주스 #drinksC');
		});
		$('#coffee').click(function(){
			$('#drinksC').load('http://localhost:8080/product/products2.do?product_category2=커피·차 #coffeeC');
		});
		$('#milk').click(function(){
			$('#drinksC').load('http://localhost:8080/product/products2.do?product_category2=우유·두유 #milkC');
		});
		$('#candy').click(function(){
			$('#drinksC').load('http://localhost:8080/product/products2.do?product_category2=초콜릿·젤리·캔디 #candyC');
		});
		</script>
		<br><br><br>
			<div class="row" id="drinksC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			    	<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '커피·차'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/coffee-cup.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allDrink">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="drinks">생수·음료·주스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="coffee">커피·차</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="milk">우유·두유</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="candy">초콜릿·젤리·캔디</button>
			</div>
		</div>
		<script>
		$('#allDrink').click(function(){
			$('#coffeeC').load('http://localhost:8080/product/products1.do?product_category1=음료·우유·간식 #allDrinkC');
		});
		$('#drinks').click(function(){
			$('#coffeeC').load('http://localhost:8080/product/products2.do?product_category2=생수·음료·주스 #drinksC');
		});
		$('#coffee').click(function(){
			$('#coffeeC').load('http://localhost:8080/product/products2.do?product_category2=커피·차 #coffeeC');
		});
		$('#milk').click(function(){
			$('#coffeeC').load('http://localhost:8080/product/products2.do?product_category2=우유·두유 #milkC');
		});
		$('#candy').click(function(){
			$('#coffeeC').load('http://localhost:8080/product/products2.do?product_category2=초콜릿·젤리·캔디 #candyC');
		});
		</script>
		<br><br><br>
			<div class="row" id="coffeeC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '우유·두유'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/coffee-cup.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allDrink">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="drinks">생수·음료·주스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="coffee">커피·차</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="milk">우유·두유</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="candy">초콜릿·젤리·캔디</button>
			</div>
		</div>
		<script>
		$('#allDrink').click(function(){
			$('#milkC').load('http://localhost:8080/product/products1.do?product_category1=음료·우유·간식 #allDrinkC');
		});
		$('#drinks').click(function(){
			$('#milkC').load('http://localhost:8080/product/products2.do?product_category2=생수·음료·주스 #drinksC');
		});
		$('#coffee').click(function(){
			$('#milkC').load('http://localhost:8080/product/products2.do?product_category2=커피·차 #coffeeC');
		});
		$('#milk').click(function(){
			$('#milkC').load('http://localhost:8080/product/products2.do?product_category2=우유·두유 #milkC');
		});
		$('#candy').click(function(){
			$('#milkC').load('http://localhost:8080/product/products2.do?product_category2=초콜릿·젤리·캔디 #candyC');
		});
		</script>
		<br><br><br>
			<div class="row" id="milkC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			     <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '초콜릿·젤리·캔디'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/coffee-cup.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allDrink">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="drinks">생수·음료·주스</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="coffee">커피·차</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="milk">우유·두유</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="candy">초콜릿·젤리·캔디</button>
			</div>
		</div>
		<script>
		$('#allDrink').click(function(){
			$('#candyC').load('http://localhost:8080/product/products1.do?product_category1=음료·우유·간식 #allDrinkC');
		});
		$('#drinks').click(function(){
			$('#candyC').load('http://localhost:8080/product/products2.do?product_category2=생수·음료·주스 #drinksC');
		});
		$('#coffee').click(function(){
			$('#candyC').load('http://localhost:8080/product/products2.do?product_category2=커피·차 #coffeeC');
		});
		$('#milk').click(function(){
			$('#candyC').load('http://localhost:8080/product/products2.do?product_category2=우유·두유 #milkC');
		});
		$('#candy').click(function(){
			$('#candyC').load('http://localhost:8080/product/products2.do?product_category2=초콜릿·젤리·캔디 #candyC');
		});
		</script>
		<br><br><br>
			<div class="row" id="candyC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			     <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 음료·우유·간식 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>

	<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 베이커리·델리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>
	<div class="container">
	<c:set var="cate" value="${param.product_category1}"/>
	<c:choose>
	<c:when test="${cate eq '베이커리·델리'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/bread.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
			<div class="row">
				<div class="col-xs-offset-2">
					<button class="bttn-stretch bttn-md bttn-primary" id="allBakery">전체보기</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="breads">식빵·빵류</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="jam">잼·버터·스프레드</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="cake">케이크·파이·디저트</button>
					<button class="bttn-stretch bttn-md bttn-primary" id="olive">올리브·피클·델리</button>
				</div>
			</div>
			<br><br><br>
			<%-- Category 분류 jQuery 접어두는걸 추천 --%>
			<script>
			$('#allBakery').click(function(){
				$('#allBakeryC').load('http://localhost:8080/product/products1.do?product_category1=베이커리·델리 #allBakeryC');
			});
			$('#breads').click(function(){
				$('#allBakeryC').load('http://localhost:8080/product/products2.do?product_category2=식빵·빵류 #breadsC');
			});
			$('#jam').click(function(){
				$('#allBakeryC').load('http://localhost:8080/product/products2.do?product_category2=잼·버터·스프레드 #jamC');
			});
			$('#cake').click(function(){
				$('#allBakeryC').load('http://localhost:8080/product/products2.do?product_category2=케이크·파이·디저트 #cakeC');
			});
			$('#olive').click(function(){
				$('#allBakeryC').load('http://localhost:8080/product/products2.do?product_category2=올리브·피클·델리 #oliveC');
			});
			</script>
	
				<div class="row" id="allBakeryC">
				<c:forEach items="${products}" var="products">
					<div class="col-xs-4" align="center">
					
						<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
				    </div>
				</c:forEach>
			  	</div>
		</c:when>
	</c:choose>

		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '식빵·빵류'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/bread.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allBakery">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="breads">식빵·빵류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="jam">잼·버터·스프레드</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cake">케이크·파이·디저트</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="olive">올리브·피클·델리</button>
			</div>
		</div>
		<script>
		$('#allBakery').click(function(){
			$('#breadsC').load('http://localhost:8080/product/products1.do?product_category1=베이커리·델리 #allBakeryC');
		});
		$('#breads').click(function(){
			$('#breadsC').load('http://localhost:8080/product/products2.do?product_category2=식빵·빵류 #breadsC');
		});
		$('#jam').click(function(){
			$('#breadsC').load('http://localhost:8080/product/products2.do?product_category2=잼·버터·스프레드 #jamC');
		});
		$('#cake').click(function(){
			$('#breadsC').load('http://localhost:8080/product/products2.do?product_category2=케이크·파이·디저트 #cakeC');
		});
		$('#olive').click(function(){
			$('#breadsC').load('http://localhost:8080/product/products2.do?product_category2=올리브·피클·델리 #oliveC');
		});
		</script>
		<br><br><br>
			<div class="row" id="breadsC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			    	<!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '잼·버터·스프레드'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/bread.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allBakery">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="breads">식빵·빵류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="jam">잼·버터·스프레드</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cake">케이크·파이·디저트</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="olive">올리브·피클·델리</button>
			</div>
		</div>
		<script>
		$('#allBakery').click(function(){
			$('#jamC').load('http://localhost:8080/product/products1.do?product_category1=베이커리·델리 #allBakeryC');
		});
		$('#breads').click(function(){
			$('#jamC').load('http://localhost:8080/product/products2.do?product_category2=식빵·빵류 #breadsC');
		});
		$('#jam').click(function(){
			$('#jamC').load('http://localhost:8080/product/products2.do?product_category2=잼·버터·스프레드 #jamC');
		});
		$('#cake').click(function(){
			$('#jamC').load('http://localhost:8080/product/products2.do?product_category2=케이크·파이·디저트 #cakeC');
		});
		$('#olive').click(function(){
			$('#jamC').load('http://localhost:8080/product/products2.do?product_category2=올리브·피클·델리 #oliveC');
		});
		</script>
		<br><br><br>
			<div class="row" id="jamC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			      <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '케이크·파이·디저트'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/bread.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allBakery">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="breads">식빵·빵류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="jam">잼·버터·스프레드</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cake">케이크·파이·디저트</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="olive">올리브·피클·델리</button>
			</div>
		</div>
		<script>
		$('#allBakery').click(function(){
			$('#cakeC').load('http://localhost:8080/product/products1.do?product_category1=베이커리·델리 #allBakeryC');
		});
		$('#breads').click(function(){
			$('#cakeC').load('http://localhost:8080/product/products2.do?product_category2=식빵·빵류 #breadsC');
		});
		$('#jam').click(function(){
			$('#cakeC').load('http://localhost:8080/product/products2.do?product_category2=잼·버터·스프레드 #jamC');
		});
		$('#cake').click(function(){
			$('#cakeC').load('http://localhost:8080/product/products2.do?product_category2=케이크·파이·디저트 #cakeC');
		});
		$('#olive').click(function(){
			$('#cakeC').load('http://localhost:8080/product/products2.do?product_category2=올리브·피클·델리 #oliveC');
		});
		</script>
		<br><br><br>
			<div class="row" id="cakeC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			     <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '올리브·피클·델리'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/bread.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allBakery">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="breads">식빵·빵류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="jam">잼·버터·스프레드</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cake">케이크·파이·디저트</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="olive">올리브·피클·델리</button>
			</div>
		</div>
		<script>
		$('#allBakery').click(function(){
			$('#oliveC').load('http://localhost:8080/product/products1.do?product_category1=베이커리·델리 #allBakeryC');
		});
		$('#breads').click(function(){
			$('#oliveC').load('http://localhost:8080/product/products2.do?product_category2=식빵·빵류 #breadsC');
		});
		$('#jam').click(function(){
			$('#oliveC').load('http://localhost:8080/product/products2.do?product_category2=잼·버터·스프레드 #jamC');
		});
		$('#cake').click(function(){
			$('#oliveC').load('http://localhost:8080/product/products2.do?product_category2=케이크·파이·디저트 #cakeC');
		});
		$('#olive').click(function(){
			$('#oliveC').load('http://localhost:8080/product/products2.do?product_category2=올리브·피클·델리 #oliveC');
		});
		</script>
		<br><br><br>
			<div class="row" id="oliveC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			     <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
		
		<c:set var="cate" value="${param.product_category2}"/>
		<c:choose>
		<c:when test="${cate eq '건어물·다시팩'}">
		<div class="col-xs-offset-1">
		<div style="font-size: 20px; font-weight: bold;"><img src="../../../resources/image/bread.png">&nbsp;&nbsp;${param.product_category1}</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-offset-2">
				<button class="bttn-stretch bttn-md bttn-primary" id="allBakery">전체보기</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="breads">식빵·빵류</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="jam">잼·버터·스프레드</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="cake">케이크·파이·디저트</button>
				<button class="bttn-stretch bttn-md bttn-primary" id="olive">올리브·피클·델리</button>
			</div>
		</div>
		<script>
		$('#allBakery').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products1.do?product_category1=베이커리·델리 #allBakeryC');
		});
		$('#breads').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=식빵·빵류 #breadsC');
		});
		$('#jam').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=잼·버터·스프레드 #jamC');
		});
		$('#cake').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=케이크·파이·디저트 #cakeC');
		});
		$('#olive').click(function(){
			$('#driedFishC').load('http://localhost:8080/product/products2.do?product_category2=올리브·피클·델리 #oliveC');
		});
		</script>
		<br><br><br>
			<div class="row" id="driedFishC">
			<c:forEach items="${products}" var="products">
			    <div class="col-xs-4" align="center">
			  <!-- 상품 사진, 이름, 찜하기, 가격 순 -->
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><img src="/img/${products.product_image}" style="width:220px; height:280px;"/></a><br><br>				     
				      	<a href="${path}/product/productInfo.do?product_id=${products.product_id}">${products.product_name}</a>
				      	<input type="button" id='heartImage' name='heartImage${products.product_id}' onclick= "changeHeart(${products.product_id})" class='beforeClick' style="width:29px; height:23px;"><br>
						<a href="${path}/product/productInfo.do?product_id=${products.product_id}"><fmt:formatNumber value="${products.product_price}" pattern="#,###.##"/>원</a><br><br><br><br>
			    </div>
			</c:forEach>
		  	</div>
		</c:when>
		</c:choose>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 베이커리·델리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ --%>


<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<footer>
	<%@ include file = "../module/Bottom.jsp" %>
	</footer>
</body>
</html>