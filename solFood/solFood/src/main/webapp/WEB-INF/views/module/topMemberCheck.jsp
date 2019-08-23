<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
	    <c:when test="${login.account_user == null}">
			<c:redirect url="${path}/member/login.do" />
	    </c:when>
	</c:choose>
</body>
</html>