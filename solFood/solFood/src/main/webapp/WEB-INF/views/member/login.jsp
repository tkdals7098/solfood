<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "../module/Top.jsp" %>

	<script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var account_user = $("#account_user").val();
            var account_user = $("#account_password").val();
            if(account_user == ""){
                alert("아이디를 입력하세요.");
                $("#account_user").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(account_password == ""){
                alert("비밀번호를 입력하세요.");
                $("#account_password").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.loginForm.action="${path}/member/loginPro.do"
            // 제출
            document.loginForm.submit();
        });
    });
	</script>
	<style>
		@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		#btnJoin, #btnLogin {
		  width: 100px;
		  height: auto;
		  background-color: #f0f0f0; 
		  border: none;
		  color: #363636; 
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 14px;
		  margin: 0px 0px;
		  -webkit-transition-duration: 0.4s; /* Safari */
		  transition-duration: 0.4s;
		  cursor: pointer;
		  border-radius: 0;
		  font-weight: bold;
		  font-family: 'Noto Sans KR', sans-serif !important;
		}
	</style>

</head>
<body>

<div class="container">
	<h1>login</h1>
	<div align="center">
		<hr>
		<br><br>
		<form name="loginForm" class="form-horizontal" autocomplete="off" method="post">
			<div class="form-group">
				<label for="joinformID" class="col-md-4 control-label">아이디</label>
				<div class="col-md-4">
					<input id="account_user" type="text" class="form-control" name="account_user" maxlength="20" placeholder="Enter ID" style="border-radius: 0px;">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">비밀번호</label>
				<div class="col-md-4">
					<input id="account_password" type="password" class="form-control" name="account_password" maxlength="20" placeholder="Enter Password" style="border-radius: 0px;">
				</div>
			</div>
			<br>
			
			<button type="button" id="btnLogin" class="btn" style="border-radius: 0px;">로그인</button>
			<a href="${path}/member/joinMember.do"><button type="button" id="btnJoin" class="btn" style="border-radius: 0px;">회원가입</button></a>
		</form>
	</div>
	<br><br><br>
</div>

<br><br><br>
<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>