<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood소개</title>


	<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/default.css" rel="stylesheet" type="text/css">
	<link href="resources/css/subpage.css" rel="stylesheet" type="text/css">
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be4510b5ceacfed090ef51cbd4b0466f&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be4510b5ceacfed090ef51cbd4b0466f&libraries=services,clusterer,drawing"></script>
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	
	
	<style type="text/css">
		a { text-decoration: none;}
 		a:link { color: black; text-decoration: none !important;}
 		a:active { color: black !important; text-decoration: none !important;}
		a:visited { color: black !important; text-decoration: none !important;}
 		a:hover { color: black !important; text-decoration: none !important;}
 		
 		
 		.sidebar{	font-size: 20px;  }
 		.sub-menu-li{ margin: 10px;}
	</style>
	
	
	<style>
	
	</style>
	
</head>
<body>
<jsp:include page="../module/Top.jsp" flush="false"/>


<body>

	<div class="col-md-2 sidebar">
	<nav id="sub_menu">
			<ul>
				<li class="sub-menu-li"><a href="intro.do">회사소개</a></li>	
				<li class="sub-menu-li"><a href="history.do">회사연혁</a></li>	
				<li class="sub-menu-li"><a href="boss.do">회장님 소개</a></li>	
			</ul>
		</nav>
	</div>
	
		 <div class="col-md-8">
			<h1>History</h1>
			<div class="y2011">
				<h3> 2011 </h3>
				<dl>
					<dt>3월</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<dl>
					<dt>5월</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<dl class="dot_none">
					<dt>7월</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<div class="clear"></div>
			</div>
		
			<div class="y2010">
				<h3> 2010 </h3>
				<dl>
					<dt>4월</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<dl>
					<dt>8월</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<dl class="dot_none">
					<dt>12월 </dt>
					<dd> </dd>
					<dd> </dd>
					<dd></dd>
				</dl>
				<div class="clear"></div>
			</div>
		
			<div class="y2009">
				<h3> 2009 </h3>
				<dl>
					<dt>탄생</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<dl>
					<dt></dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<dl class="dot_none">
					<dt>1243</dt>
					<dd></dd>
					<dd></dd>
					<dd></dd>
				</dl>
				<div class="clear"></div>
			</div>
	
		</div>
		
	
		


	
	


<footer>
<jsp:include page="../module/Bottom.jsp" flush="false"/>
</footer>
</body>
</html>

