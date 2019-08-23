<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>event main</title>
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<style>
		.eventPic{
			width: auto;
			height: 520px;
			margin-right: 20px;
		}
	
	</style>
</head>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<jsp:include page="../module/Top.jsp" flush="false"/>
	<br><br>

<!--■■■■■■■■■■■■■■■■■■■■■ event content ■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<div class= "container" align="center">
		<!-- event1 -->
		<a href="${path}/product/event.do?product_event=1"><img src="../../resources/image/eventPrice.PNG" class="eventPic"></a>
		
		<!-- event2 -->
		<a href="${path}/product/event.do?product_event=2"><img src="../../resources/image/gourmetFood.PNG" class="eventPic"></a>
		
		<!-- event3 -->
		<a href="${path}/product/event.do?product_event=3"><img src="../../resources/image/platterFood.PNG" class="eventPic"></a>
		
	</div>
	<br><br>

<!--■■■■■■■■■■■■■■■■■■■■■■ Bottom ■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
	<jsp:include page="../module/Bottom.jsp" flush="false"/>
</body>
</html>