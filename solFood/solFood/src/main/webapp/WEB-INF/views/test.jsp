<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
		function test01(){			
			$.ajax({
				success: function(){
					var a= "";
					a+= "<h3>hi company test</h3>";

					$("#company").html(a);
				},
				error: function(){
					alert("test fail");
				}
			});
		}
	</script>
</head>
<body>
	<h2>test </h2>
	<input type="button" id="toEnglish" name="toEnglish" onClick="test01()" value="toEnglish">
	
	<div id="company">
		안녕하세요 회사 테스트
	</div>

	
	
	
	
	
	
</body>
</html>