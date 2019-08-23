<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 양식</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="../resources/css/animate.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script>
	
		//------------------------------------------------------------------
		//	idCheck()--> 아이디 중복체크 
		//------------------------------------------------------------------
		function idCheck(){
			var account_user = document.getElementsByName("account_user")[0].value;
			var json={"account_user":account_user};
			var html= "";
			
			$.ajax({
				type: "post",
				url: "/member/check_id.do",
				data: json,
				success: function(data){
					if(data== "null"){
						html= "아이디를 입력해주세요";
					} else if(data== "success"){
						html= "사용가능한 아이디입니다";
					} else{
						html= "중복된 아이디입니다. 다시 설정해주세요";
					}
					$("#check1").html(html);
				},
				error: function(){
				}
			});

		}

		//------------------------------------------------------------------
		//	finalCheck()--> 나머지 체크
		//------------------------------------------------------------------
		function finalCheck(){
			var account_user= document.getElementsByName("account_user")[0];
			var account_password = document.getElementsByName("account_password")[0];
			var account_repassword= document.getElementsByName("account_repassword")[0];
			var account_name= document.getElementsByName("account_name")[0];
			var account_tel= document.getElementsByName("account_tel")[0];
			var account_address= document.getElementsByName("account_address")[0];
			var account_age= document.getElementsByName("account_age")[0];
			var account_email= document.getElementsByName("account_email")[0];
			
			var temp = document.getElementsByName('account_gender');
			var account_gender;
			for(var i=0; i<temp.length; i++) {
			    if(temp[i].checked) {
			        account_gender = temp[i].value;
			    } else{
					account_gender= '';
				}
			}

			var result= "";
			
			
			// 비밀번호 4자리 미만 체크
			if(account_password.value.length< 4){
				alert("비밀번호를 4자리 이상 입력해주세요");
				result= "fail";
			} else{
				result= "success";
			}
			
			// 비밀번호, 재비밀번호 일치 체크
			if(account_password.value!= account_repassword.value){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
				result= "fail";
			} else{
				result= "success";
			}

			// 전화번호 11자리 표기 체크
			if(account_tel.value.length!= 11){
				alert("전화번호를 11자리로 표기해주세요");
				result= "fail";
			} else{
				result= "success";
			}
			
			// 생년월일 8자리 표기 체크
			if(account_age.value.length!= 8){
				alert("생년월일을 8자리로 표기해주세요");
				result= "fail";
			} else{
				result= "success";
			}

			// null 체크
			if(account_user.value== '' || account_password.value== '' || account_repassword.value== '' || account_name.value== '' || account_tel.value== '' || account_address.value== '' || account_age.value== '' || account_gender== '' || account_email.value== ''){
				result= "fail";
				alert("모두 입력해주세요");
			} else{
				result= "success";
			}

			
			// id 중복 체크가 실행되었는지 체크
	
			

			// 모두 통과하면 submit 실행 
			if(result== "success"){
				var json={"account_user":account_user.value, 
						"account_password":account_password.value, 
						"account_name":account_name.value,  
						"account_tel":account_tel.value, 
						"account_address":account_address.value, 
						"account_age":account_age.value, 
						"account_gender":account_gender,
						"account_email":account_email.value};
				
				$.ajax({
					type: "post",
					url: "/member/joinMemberPro.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});
			} else {
				alert("form submit fail 다시 작성하기");
				return false;
			}
		}
		
	</script>
	
	<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
	#checkBtn {
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
	  font-weight: normal;
	  font-family: 'Noto Sans KR', sans-serif !important;
	}
	#joinBtn {
	  width: 100px;
	  height: auto;
	  background-color: #363636; 
	  border: none;
	  color: #f0f0f0; 
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 17px;
	  margin: 0px 0px;
	  -webkit-transition-duration: 0.4s; /* Safari */
	  transition-duration: 0.4s;
	  cursor: pointer;
	  border-radius: 0;
	  font-weight: bold;
	  font-family: 'Noto Sans KR', sans-serif !important;
	}
	
	
	/*
	.button1 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #4CAF50;
	}
	
	.button1:hover {
	  background-color: #4CAF50;
	  color: white;
	}
	*/

	</style>
	
</head>


<body>
	<%--====================================== top ====================================== --%>
	<%@ include file = "../module/Top.jsp" %>
	
	
	<%--====================================== content ====================================== --%>
	<div class="container">
		<h1>회원가입</h1>
		<hr><br>
	
		<div>
			<form class="form-horizontal" method="post" name="joinMemberForm" action="${path}/member/joinMemberPro.do">
				<div class="form-group">
					<label for="" class="col-md-4 control-label">아이디</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="account_user" name="account_user" maxlength="20" placeholder="Enter ID"><br>
						<button type="button" onclick="idCheck()" class="btn" id="checkBtn"><b>id 중복체크</b></button>
						<p id="check1">
						
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-4 control-label">비밀번호(4자리 이상)</label>
					<div class="col-md-4">
						<input type="password" class="form-control" name="account_password" maxlength="20" placeholder="Enter Password">
					</div>
				</div>
				<div class="form-group">
					<label for="" class="col-md-4 control-label">비밀번호 확인</label>
					<div class="col-md-4">
						<input type="password" class="form-control" name="account_repassword" maxlength="20" placeholder="Enter Password">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">이름</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_name" maxlength="20" placeholder="Enter Name">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">전화번호(ex 01012345678)</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="account_tel" name="account_tel" maxlength="11" placeholder="Enter Tel">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">주소</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_address" maxlength="50" placeholder="Enter Address">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">생년월일(ex 19910101)</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_age" maxlength="8" placeholder="Enter Birth">
						
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">성별</label>
					<div class="col-md-4" style="padding-bottom: 9px;">
						<input type="radio" name="account_gender" value="M"> 남
						<input type="radio" name="account_gender" value="F"> 여
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">E-Mail</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="account_email" maxlength="100" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
					</div>
				</div> 
				<br>
				
				<div class="form-group" align="center">
					<button type="submit" onclick="finalCheck() return false;" class="btn" id="joinBtn"><b>회원가입</b></button>
				</div>		
			</form>
		</div>
	</div>
	<br><br><br>
	
	<%--====================================== bottom ====================================== --%>
	<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>