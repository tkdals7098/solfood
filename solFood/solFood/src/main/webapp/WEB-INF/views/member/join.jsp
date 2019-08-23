<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Form</title>
	<%@ include file = "../module/Top.jsp" %>
</head>

<body>
	<h1>join</h1>
	<hr>
	
	<div>
		<div>
			<h3>join form</h3>
		</div>
		<div>
			<form id="joinForm" action="./member/joinMember.do" method="post">
				<p>
					<label>ID</label><input class="w3-input" type="text" id="account_user" name="account_user" required><span id="id_check" class="w3-text-red"></span>
				</p>
				<p>
					<label>Password</label><input class="w3-input" type="password" id="account_password" name="account_password" required>
				</p>

				<p>
					<button type="submit" id="joinBtn" class="w3-button">Join</button>
					<button type="button" onlclick="history.go(-1)" class="w3-button">Cancel</button>	 
				</p>
			</form>
		</div>
	</div>

</body>
</html>