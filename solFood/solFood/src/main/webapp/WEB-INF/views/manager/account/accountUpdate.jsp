<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link href="../../../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	<style>
	td {
		vertical-align: middle !important;
	}
	table {
		font-family: 'SpoqaHanSans-kr';
	}
	</style>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">회원정보수정</h1>
		<hr>
	</div>
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post">
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">접근등급</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="account_grade" maxlength="20" value="${accountUpdate.account_grade}" >				
							<p class="help">1:일반회원&emsp;&emsp;9:관리자</p>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">가입일</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="account_date" maxlength="20" value="${accountUpdate.account_date}"  placeholder="Disabled input" disabled>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">아이디</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="" maxlength="20" value="${accountUpdate.account_user}"  placeholder="Disabled input" disabled	>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">비밀번호</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="account_password" maxlength="20" value="${accountUpdate.account_password}">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">이름</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="account_name" maxlength="20" value="${accountUpdate.account_name}">
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">전화번호</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="account_tel" maxlength="20" value="${accountUpdate.account_tel}">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">주소</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="account_address" maxlength="50" value="${accountUpdate.account_address}" >
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">생년월일</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="account_age" maxlength="20" value="${accountUpdate.account_age}"  placeholder="Disabled input" disabled>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<%-- <div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">성별</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="account_gender" maxlength="20" value="${accountUpdate.account_gender}"  placeholder="Disabled input" disabled>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	 --%>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">성별</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="account_gender" maxlength="20" value="${accountUpdate.account_gender}"  placeholder="Disabled input" disabled>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				
				
				<%-- 
				<div class="field is-horizontal">
				  <div class="field-label is-normal"><label class="label">Email2</label></div>
				  <div class="field-body has-addons">
				 	 <input type="text" class="input" name="account_email1" value="${login.account_email}" maxlength="20" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
				  
				      <div class="control">
				        <div class="select is-harf">
				          <select>
				            <option>Business development</option>
				            <option>Marketing</option>
				            <option>Sales</option>
				          </select>
				        </div>
				      </div>
				  </div>
				</div>
				
				<div class="field is-horizontal">
				  <div class="field-label is-normal "><label class="label">Email3</label></div>
				  <div class="field-body has-addons">
				  <p class="control is-expanded">
				 	 <input type="text" class="input" name="account_email1" value="${login.account_email}" maxlength="20" placeholder="Enter E-mail" aria-label="Amount (to the nearest dollar)"  aria-describedby="basic-addon2">
				 	 </p>
			 	 
				 	 <p class="control">
				 	 	<a class="button is-static">
				 	 	@
				 	 	</a>
				 	 </p>
  				  <p class="control is-expanded">
				      <div class="control">
				        <div class="select is-harf">
				          <select>
				            <option>Business development</option>
				            <option>Marketing</option>
				            <option>Sales</option>
				          </select>
				        </div>
				      </div>
					</p>
				  </div>
				</div>
				 --%>
				 
				<div class="field is-horizontal">
				  <div class="field-label is-normal"><label class="label">E-mail</label></div>
				  <div class="field-body">
				    <div class="field is-expanded">
				      <div class="field has-addons">
				      	<p class="control is-expanded">
				      		<input type="text" class="input" name="account_email" value="${accountUpdate.account_email}" maxlength="20" placeholder="Enter E-mail">
				        </p>
				        <p class="control">
				          <a class="button is-static">
				            @
				          </a>
				        </p>
				        <div class="control">
				        <div class="select is-harf">
				          <select class="form-control" name="account_email2" id="email2">
				            <option>gmail.com</option>
				            <option>naver.com</option>
				            <option>hanmail.net</option>
				          </select>
				        </div>
				      </div>
				      </div>
				    </div>
				  </div>
				</div>
				
				<!-------------------------------- 수정완료/취소 버튼 -------------------------------->
				<hr>
				<div class="field is-grouped">
					<div class="control">
						<button class="button is-link" type="submit">수정완료</button>
					</div>
					<div class="control">
						<input class="button is-danger" type="button" value="취소" onclick="history.back();" />
					</div>
				</div>
			</form>
		</div>
	</div>
	
		
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>