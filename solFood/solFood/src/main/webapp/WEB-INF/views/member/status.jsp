<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%@ include file = "../module/Top.jsp" %>
</head>
<body>
<h1>회원 관리</h1>

<table>
	<thead>
		<tr>
			<th>account_user</th>
			<th>account_password</th>
			<th>account_name</th>
			<th>account_tel</th>
			<th>account_date</th>
			<th>account_address</th>
			<th>account_grade</th>
			<th>account_age</th>
			<th>account_gender</th>
			<th>account_email</th>    	
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${memberList}" var="member">
			<tr>
				<td>${member.account_user}</td>
				<td>${member.account_password}</td>
				<td>${member.account_name}</td>
				<td>${member.account_tel}</td>
				<td>${member.account_date}</td>
				<td>${member.account_address}</td>
				<td>${member.account_grade}</td>
				<td>${member.account_age}</td>
				<td>${member.account_gender}</td>
				<td>${member.account_email}</td>
			</tr>
		</c:forEach>
	</tbody>
</table> 


</body>
</html>