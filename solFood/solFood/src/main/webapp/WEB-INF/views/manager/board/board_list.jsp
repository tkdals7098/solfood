<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>board_list</title>
	
	<link href="../../../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="../../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	
	<style>
	td {
		vertical-align: middle !important;
	}
	</style>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br><br><br><br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
	<h1 class="title">판매관리</h1>
	<hr>
		<div class="table">
			<table class="table table-bordered table-striped table-hover">
				<tr height="30" class="info">
					<td align= "center" width="50">NUM</td>
					<td align= "center" width="50">DATE</td>
					<td align= "center" width="50">TITLE</td>
					<td align= "center" width="50">CATEGORY</td>
					<td align= "center" width="50">CONTENT</td>
					<td align= "center" width="50">FILE</td>
					<td align= "center" width="50">READCOUNT</td>
					<td align= "center" width="50">COMMENT</td>
					<td align= "center" width="50">ACCOUNT USER</td>
					<td align= "center" width="50">ACCOUNT GRADE</td>
					<td>수정</td>
					<td>삭제</td>	
				</tr>
				<c:forEach items="${boardList}" var="board">
				<tr>
					<td align="center">${board.board_num}</td>
					<td align="center">${board.board_date}</td>
					<td align="center">${board.board_title}</td>
					<td align="center">${board.board_category}</td>
					<td align="center">${board.board_content}</td>
					<td align="center">${board.board_file}</td>
					<td align="center">${board.board_readcount}</td>
					<td align="center">${board.board_comment}</td>
					<td align="center">${board.account_user}</td>
					<td align="center">${board.account_grade}</td>
					
					<%--==========================수정/ 삭제======================================= --%>
					<td align="center">
						<a href="boardUpdateForm.jsp?product_id=">수정</a>
					</td>
					<td align="center">
						<a href="boardDeleteForm.jsp?product_id=">삭제</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>