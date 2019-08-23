<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지 수정</title>
	<script type="text/javascript">
        function init(){
            setComboValue("MemberVO.getAccount_email2()%>");
        }
 
        function setComboValue(val) 
        {
            var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
            for (i = 0, j = selectMail.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectMail.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectMail.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }

        // 영민
        // submit시 항목 체크 
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

			// 비밀번호, 재입력 비밀번호 일치 체크
			if(account_password.value!= account_repassword.value){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
				result= "fail";
			} else{
				result= "success";
			}

			// 비밀번호 4자리 미만 체크
			if(account_password.value.length< 4){
				alert("비밀번호를 4자리 이상 입력해주세요");
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
					url: "/member/updateMyAccount.do",
					data: json,
					success: function(){
					},
					error: function(){
					}
				});
			} else {
				alert("result fail");
				return false;
			}
        }
       
	</script>
</head>
<body>
	<%-- =================================== TOP =========================================--%>
	<%@ include file = "../module/Top.jsp" %>

	<%-- =================================== CONTENT =======================================--%>
	<div class="container">
		<h1 align="center" style= "font: sans-serif;">MY PAGE</h1><br><br>
		<form class="form-horizontal" method="post" action="${path}/member/updateMyAccount.do">
		
			<%-- INFO --%>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">아이디</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_user" maxlength="20" value="${login.account_user}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">이름</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_name" maxlength="20" value="${login.account_name}">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">비밀번호</label>
				<div class="col-md-4">
					<input type="password" class="form-control" name="account_password" maxlength="20" value="${login.account_password}">
				</div>
			</div>
			<div class="form-group">
				<label for="" class="col-md-4 control-label">변경할 비밀번호</label>
				<div class="col-md-4">
					<input type="password" class="form-control" name="reaccount_password" maxlength="20" value="${login.account_password}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">전화번호</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_tel" maxlength="20" value="${login.account_tel}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">주소</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_address" maxlength="50" value="${login.account_address}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-4 control-label">생년월일</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="account_age" maxlength="20" value="${login.account_age}">
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
					<input type="text" class="form-control" name="account_email" maxlength="100" value="${login.account_email}" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
				</div>
			</div> 
			<br>
			
			<%-- BUTTON --%>		
			<div class="form-group" align="center">
				<button type="submit" onclick="finalCheck() return false;" class="btn btn-success btn-md"><b>수정</b></button>
				<input type="button" id="btnLogin" class="btn btn-danger btn-md" onclick="location.href='dismiss.do?account_user=${login.account_user}'" value="탈퇴"/>			
			</div>	
		</form>
	</div>
	
	
	<%-- =============================== BOTTOM =========================================--%>
	<%@ include file = "../module/Bottom.jsp" %>
</body>
</html>