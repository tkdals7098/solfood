<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.*" %>
<%	NumberFormat nf = NumberFormat.getNumberInstance();%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/carouselMulti.css" rel="stylesheet">
	<link href="../resources/css/animate.css" rel="stylesheet">
	<link href="../resources/css/wickedcss.min.css" rel="stylesheet">
	<script src="../resources/css/multi.js"></script>
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<script>
	// 숫자에 콤마 넣는 함수
	function addComma(num){
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		return num.toString().replace(regexp, ',');
	}
	var nData = addComma(nData);

	// 홈에 상품 뿌리는 함수
	function product_category1(product_category1){	
		var json= {"product_category1":product_category1};
		var html= "";
		var account_user= document.getElementsByName("account_user")[0].value;

			$.ajax({
				type: "post",
				url: "/product/products1_2.do",
				data: json,
				success: function(data){
					for(var i=0; i<4; i++){
						html+= "<div class='col-xs-3'>";
						html+= "<a href='product/productInfo.do?product_id="+ data[i].product_id +"'><img src='/img/"+ data[i].product_image +"' width='250px' height='320px'/></a><br><br>";
						html+= "<a href='product/productInfo.do?product_id="+ data[i].product_id +"'><strong>"+ data[i].product_name +"</strong></a>";

						// account_user null이면 하트안보이게, 로그인 했으면 하트보이게
						if(account_user==""){
							html+= "";
						} else{
							html+= "<input type='button' id='heartImage' name='heartImage"+ data[i].product_id +"' onclick= 'changeHeart("+ data[i].product_id +",1809)' class='beforeClick' style='width:29px; height:23px;'><br>";
						}
			
						html+= addComma(data[i].product_price) +"원";
						html+= "</div>";
						$("#mdArea").html(html);
					}
				},
				error: function(){
					alert("product_category1 fail");
				}
			});
		}
	</script>
	
	<%-- 하트 보이게하는 함수 --%>
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
	
	
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		a { text-decoration: none; font-family: 'Noto Sans KR', sans-serif;}
 		a:link { color: black; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif;}
 		a:active { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif;}
		a:visited { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif;}
 		a:hover { color: black !important; text-decoration: none !important; font-family: 'Noto Sans KR', sans-serif;}
	</style>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap');
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		html{cursor: url(../resources/image/carrot.png), auto}
		body {
			width: 100%;
			font-family: 'Noto Sans KR', sans-serif !important;
			font-size: 18px;
			align: center !important;
		}
		h2{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		h3{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		h4{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		p{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		input{
			font-family: 'Noto Sans KR', sans-serif !important;
		}
		#mdArea{
			font-family: 'Noto Sans KR', sans-serif !important; 
		}
		#thumb {
			border: 0;
		}
		#eventArea {
			background-color: #EAEAEA;
		}
		
		.recipeHr {
			border: 0;
    		height: 2px;
    		background: #EAEAEA;
		}
	</style>
	
	<%-- recent style --%>
	<style type="text/css">
		a { text-decoration: none;}
 		a:link { color: black; text-decoration: none !important;}
 		a:active { color: black !important; text-decoration: none !important;}
		a:visited { color: black !important; text-decoration: none !important;}
 		a:hover { color: black !important; text-decoration: none !important;}
 		.intro-text{ color: gray!important; text-decoration: none !important;}
 		.sidebar{	font-size: 20px;  }
 		.sub-menu-li{ margin: 10px;}
	</style>

	<style>
		#rightSide{
			z-index: 99;
			position: absolute;
			top: 547px;
			left: 50%;
			margin: 0px 0px 0px 100px;
		}
		#rightSide #right_zzim {
			z-index: 99;
			position: fixed;
			top: 126px;
			left: 2%;
			border:1px solid #B0B5BD;
			width:130px;
			height: auto;
			background-color: #FFFFF8;
		}
		#rightSide #right_zzim  div {text-align:center;}
		#rightSide #right_zzim  div.recTit{line-height:1.5em; padding:5px; color:white; background-color:#505A69;}
		#right_zzim #recentCnt {color:yellow;}
		#rightSide #right_zzim ul {min-height:495px;}
		#rightSide #right_zzim  li{text-align:center; padding:5px; position:relative;} 
		#rightSide #right_zzim ul li img {border:1px solid #ccc}
		#right_zzim .detail {
			display: none;
			position: absolute;
			top: 3px;
			right: 20px;
			xheight: 40px;
			xpadding: 15px 11px 0;
			xbackground: #404a59;
			color: #fff;
			xtext-align: left;
			white-space: nowrap;
		}
		#right_zzim li:hover .detail {display:block}
		#right_zzim li .btn_delete {
			position: absolute;
			top: 3px;
			right: -1px;
			width: 11px;
			height: 11px;
			background: url(/img/sp.png) no-repeat -193px -111px;
			text-indent: -9000px;
		}
		#right_zzim  #currentPage {color:#505A69;font-weight:bold}
		#right_zzim  #totalPageCount {color:#CBC8D2;font-weight:bold}
		.noData {color:#ccc;text-align:center;margin-top:223px;}
		#paging {display:;position:relative;line-height:1em;}
		#paging .btn_prev {
			position: absolute;
			top: 526px;
			left: 4px;
			width: 13px;
			height: 11px;
			background: url(/images/ico_arrow.png)  no-repeat ;
			text-indent: -9000px;
			border:1px solid #CCC;
			display:inline-block;
		}
		#paging .btn_next {
			position: absolute;
			top: 526px;
			right: 4px;
			width: 13px;
			height: 11px;
			background: url(/images/ico_arrow.png) -11px 0px;
			text-indent: -9000px;
			border:1px solid #CCC;
			display:inline-block;
		}
	</style>
</head>
<body style="padding: 0px 0px 0px 0px;">
	<!--■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■222-->
	<jsp:include page="module/Top.jsp" flush="false"/>
	<jsp:include page="recentView/recentList.jsp" flush="false"/>
	
	<%-- account_user 값 받아오기 --%>
	<input type="text" hidden="true" value="${login.account_user}" name="account_user" id="account_user">
	
	<!--■■■■■■■■■■■■■■■■■■■■■■ 상단 배너 ■■■■■■■■■■■■■■■■■■■■■■■■-->
	<div id="myCarousel" class="carousel slide text-center" data-ride ="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active" align="center">
				<a href="${path}/product/event.do?product_event=5"><img src="../resources/image/banner1.jpg"></a>
			</div>
			<div class="item" align="center">
				<a href="${path}/product/event.do?product_event=7"><img src="../resources/image/banner2.jpg"></a>
			</div>
			<div class="item" align="center">
				<a href="${path}/product/event.do?product_event=8"><img src="../resources/image/banner3.jpg"></a>
			</div>
		</div>
		
		<!-- Left and Right Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		</a>
	</div>
<br><br>

<!--■■■■■■■■■■■■■■■■■■■■■■ 카테고리별 품목들 ■■■■■■■■■■■■■■■■■■■■■■■■-->

<div class="container">
<div align="center"><h2><strong>인기 상품</strong></h2></div><br><br><br>
    <div class="row">
		<div class="col-md-12">
                <div id="Carousel" class="carousel slide">
                <!-- Carousel items -->
                <div class="carousel-inner">
                <div class="item active">
                	<div class="row">
                	 <c:forEach items="${homeProduct}" var="homeProduct" begin="0" end="3">
	                	<div class="col-md-3">
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="thumbnail"><img src="/img/${homeProduct.product_image}" style="max-width:100%; height: 315px;"></a><br>
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="noul"><strong>${homeProduct.product_name}</strong><br><fmt:formatNumber value="${homeProduct.product_price}" pattern="#,###.##"/>원</a>
							
							<!-- login 값이 없으면 하트 안보이게 -->
					 		<c:choose>
							    <c:when test="${login.account_user== null}">
									<br>
							    </c:when>
							    <c:otherwise>
							   		<input type="button" id='heartImage' name='heartImage${homeProduct.product_id}' onclick= "changeHeart(${homeProduct.product_id},${login.account_user})" class='beforeClick' style="width:29px; height:23px;"><br>
							    </c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
                	</div><!--.row-->
                </div><!--.item-->
                 
                <div class="item">
                	<div class="row">
                	   <c:forEach items="${homeProduct}" var="homeProduct" begin="4" end="7">
	                	<div class="col-md-3">
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="thumbnail"><img src="/img/${homeProduct.product_image}" style="max-width:100%;"></a><br>
	                		<a href="${path}/product/productInfo.do?product_id=${homeProduct.product_id}" class="noul"><strong>${homeProduct.product_name}</strong><br><fmt:formatNumber value="${homeProduct.product_price}" pattern="#,###.##"/>원</a>
						</div>
					</c:forEach>
                	</div><!--.row-->
                </div><!--.item-->
                </div><!--.carousel-inner-->
                <a data-slide="prev" href="#Carousel" class="left slide-control"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
                <a data-slide="next" href="#Carousel" class="right slide-control"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
                </div><!--.Carousel-->
		</div>
	</div>
</div><!--.container-->

<br><br><br><br>

<div class="container" id="eventArea">
	<div class="col-md-12"><br><br>
		<div align="center"><h2><strong>이벤트</strong></h2></div>
		<br><br><br>
<div class="col-md-12" align="center">
	<div class="row">
		<div class="col-md-4">
  		<figure class="snip1132">
	 		<img src="../resources/image/event1.jpg" alt="sample22" />
		  	<figcaption>
		    	<div class="heading">
		      		<h3><span>한식 제품 특가</span></h3>
		    	</div>
		    	<div class="caption">
		      		<p><strong>불고기·국물요리 최대 15% 할인</strong></p>
		    	</div>
		  	</figcaption>
		  	<a href="${path}/product/event.do?product_event=1"></a>
		</figure>
		</div>
		
		<div class="col-md-4">
	  	<figure class="snip1132">
	 		 <img src="../resources/image/event2.jpg" alt="sample22" />
	  		<figcaption>
	    		<div class="heading">
		      		<h3><span>유제품 특가</span></h3>
		    	</div>
		    	<div class="caption">
		      		<p><strong>서강유업 최대 20% 할인</strong></p>
		    	</div>
	  		</figcaption>
	  		<a href="${path}/product/event.do?product_event=2"></a>
		</figure>
		</div>
		
		<div class="col-md-4">
	  	<figure class="snip1132">
	 		 <img src="../resources/image/event3.jpg" alt="sample22" />
	  		<figcaption>
		    	<div class="heading">
			      	<h3><span>삼진어묵 특가</span></h3>
			    </div>
		    	<div class="caption">
		      		<p><strong>어묵 5% 할인 & GIFT</strong></p>
		    	</div>
		  	</figcaption>
	  		<a href="${path}/product/event.do?product_event=3"></a>
		</figure>
		</div>
	</div><%-- div row --%><br><br><br>
	
	<div class="row">
		<div class="col-md-4">
	  	<figure class="snip1132">
	 		<img src="../resources/image/event4.jpg" alt="sample22" />
		  	<figcaption>
		    	<div class="heading">
		      		<h3><span>따끈따끈 브레드</span></h3>
		    	</div>
		    	<div class="caption">
		      		<p><strong>바게트·식빵 최대 30% 할인</strong></p>
		    	</div>
		  	</figcaption>
	  		<a href="${path}/product/event.do?product_event=4"></a>
		</figure>
		</div>
		
		<div class="col-md-4">
	  	<figure class="snip1132">
	 		 <img src="../resources/image/event5.jpg" alt="sample22" />
		  	<figcaption>
		    	<div class="heading">
		      		<h3><span>다이어트의 계절</span></h3>
		    	</div>
		    	<div class="caption">
		      		<p><strong>샐러드·다이어트 식품 30% 할인</strong></p>
		    	</div>
		  	</figcaption>
	  		<a href="${path}/product/event.do?product_event=5"></a>
		</figure>
		</div>
		
		<div class="col-md-4">
	  	<figure class="snip1132">
	 		<img src="../resources/image/event6.jpg" alt="sample22" />
		  	<figcaption>
		    	<div class="heading">
		      		<h3><span>프리미엄 요거트</span></h3>
		    	</div>
		    	<div class="caption">
		      		<p><strong>요거트·유산균 음료 15% 할인</strong></p>
		    	</div>
		  	</figcaption>
	  		<a href="${path}/product/event.do?product_event=6"></a>
		</figure>
		</div>
	</div><%-- div row --%><br><br><br>
</div>
</div>
</div>
<br><br><br><br>
<%--■■■■■■■■■■■■■■■■■■■■■■ MD추천 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<div class="container">
<div align="center"><h2><strong>MD 추천</strong></h2></div>
<br>
<div align="center"><h4>오늘의 MD 추천 상품은 무엇일까요 ?</h4></div>
<hr class="recipeHr">
<br><br>
<div class="container" align="center">
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('채소·과일')" value="채소.과일"/>&nbsp;&nbsp;
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('국·반찬·요리')" value="국·반찬·요리"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('면·양념·오일')" value="면·양념·오일"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('정육·계란')" value="정육·계란"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('수산·해산')" value="수산·해산"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('샐러드·간편식')" value="샐러드·간편식"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('음료·우유·간식')" value="음료·우유·간식"/>&nbsp;&nbsp;	
	<input type="button" class="bttn-fill cate1" onclick= "product_category1('베이커리·델리')" value="베이커리·델리"/>&nbsp;&nbsp;	
</div>
<br><br><br><br>
<div class="container">
<div class="row" align="center">
<div class="cate1Form" id="mdArea" align="center">
	
</div>
</div>
</div>
</div>
<br><br><br>

<%--■■■■■■■■■■■■■■■■■■■■■■ 레시피 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<div class="container">
<div align="center"><h2><strong>SolFood 레시피</strong></h2></div>
<br><hr class="recipeHr">
<div class="row" align="center">
<c:forEach items="${homeRecipe}" var="recipe" begin="0" end="2">
<div class="col-xs-4">
<figure class="snip1436">
  <img src="/img/${recipe.recipe_image}" width="330px" height="220px"/>
  <figcaption>
    <h3>${recipe.recipe_name}</h3>
    <p></p><a href="${path}/recipe.do?recipe_id=${recipe.recipe_id}" class="read-more">자세히 보기</a>
  </figcaption>
</figure>
</div>
</c:forEach>
</div>
</div><br><br><br>


<div class="container" id="recipeInfo">
<div align="center">
	<div class="wiggle">
	<img src="../resources/image/spatula.png" >&nbsp;
	<img src="../resources/image/cleaver.png" >&nbsp;
	<img src="../resources/image/ladle.png" >&nbsp;
	<img src="../resources/image/stew.png" >&nbsp;&nbsp;
	</div>
	<br><br>
	<p style="font-size: 15px; font-weight: bold">SolFood만의 레시피로 건강하고 맛있는 요리를 해보세요 !</p>
</div>
</div>
<%--■■■■■■■■■■■■■■■■■■■■■■ 레시피 ■■■■■■■■■■■■■■■■■■■■■■■■■--%>
<br>
<br>
<br>

<!--■■■■■■■■■■■■■■■■■■■■■■ Bottom ■■■■■■■■■■■■■■■■■■■■■■■■-->
<%@ include file = "module/Bottom.jsp" %>

</body>
</html>