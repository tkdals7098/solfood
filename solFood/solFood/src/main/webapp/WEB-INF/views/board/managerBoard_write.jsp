<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1 align="center">MANAGER 게시판 등록</h1>
		<br>
		<form class="form-horizontal" method="post">

			<div class="form-group">
				<label class="control-label col-sm-2">분류</label>
				<div class="col-sm-3">
					<select class="form-control" name="board_category">
						<option value="manager_notice">공지사항</option>
						<option value="#">임시</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_title"
						maxlength="50" placeholder="Enter Title">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">작성자</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="account_user"
						maxlength="50" placeholder="Enter Writer">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="10" cols="100" name="board_content"></textarea>
				</div>
			</div>
			<div class="form-group" align="center">
				<button type="submit" class="btn btn-primary btn-sm">작성</button>
			</div>
		</form>
	</div>
</body>
</html>