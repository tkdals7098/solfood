<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/animate.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
	.button {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 12px 22px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 14px;
	  margin: 0px 0px;
	  -webkit-transition-duration: 0.4s; /* Safari */
	  transition-duration: 0.4s;
	  cursor: pointer;
	}
	
	.button1 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #4CAF50;
	}
	
	.button1:hover {
	  background-color: #4CAF50;
	  color: white;
	}

	</style>
	
</head>


<body>
	<%@ include file = "../module/Top.jsp" %>
<div class="container">
	<h1>회원가입</h1>
	<hr>
	<br>
	
	<div>
		<form class="form-horizontal" method="post">
		
			<!-- <div class="form-group">
			  	<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
			 	 <div class="col-sm-10">
			    	<input type="email" class="form-control" id="inputEmail3" placeholder="Email">
			  	</div>
			</div> -->
		
		
		<!-- 
			<div class="form-group">
				<label class=" control-label">아이디</label>
				<div class="input-group">
					
					<input type="text" class="form-control" name="account_user" maxlength="20" placeholder="Enter Title" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
					<span class="input-group-addon" id="basic-addon2">@example.com</span>
				</div>
			</div>
 -->
			<div class="form-group">
				<label for="" class="col-md-4 control-label">아이디</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_user" maxlength="20" placeholder="Enter ID">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">비밀번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_password" maxlength="20" placeholder="Enter Password">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">이름</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_name" maxlength="20" placeholder="Enter Name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">전화번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_tel" maxlength="20" placeholder="Enter Tel">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">주소</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_address" maxlength="50" placeholder="Enter Address">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">생년월일</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_age" maxlength="20" placeholder="Enter Birth">
					
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">성별</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_gender" maxlength="20" placeholder="Enter Sex">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-4 control-label">E-Mail</label>
				
				<div class="col-md-4">
					<div class="input-group">
						<input type="text" class="form-control" name="account_email1" value="${login.account_email}" maxlength="20" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
						<span class="input-group-addon" id="basic-addon2">@</span>
						
						<select class="form-control" name="account_email2">
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
						</select>
					</div>
				</div>
			</div> 
			
			<hr>
			
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-success"> <b>회원가입</b></button>
			</div>		
		</form>
	</div>
</div>
	
	
	<br><br><br>
	
	<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>