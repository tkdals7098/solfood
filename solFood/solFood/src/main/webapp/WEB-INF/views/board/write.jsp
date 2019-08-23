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

<style>
button{
  background:#EAEAEA;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#000000;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #000000;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}


</style>

<body>
<%@ include file="../module/Top.jsp"%>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 글쓰기 창 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<div class="container">
		<h2 align="center">SOLFOOD 게시판 등록</h2>
		<hr color="#A6A6A6" style= width:80%;>
		<br>
		<form class="form-horizontal" method="post">

			<div class="form-group">
				<label class="control-label col-sm-2">분류</label>
				<div class="col-sm-3">
					<select class="form-control" name="board_category">
						<option value="" hidden></option>
						<option value="notice" >공지사항</option>
						<option value="event">이벤트</option>
						<option value="proposal">상품제안</option>
						<option value="question">Q&A</option>
					</select>
				</div>
			</div>
			<hr style= width:80%;>
			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_title"
						maxlength="50" placeholder="Enter Title">
				</div>
			</div>
			<hr style= width:80%;>
			<div class="form-group">
				<label class="control-label col-sm-2">작성자</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="account_user"
						maxlength="50" value="${login.account_user}" readonly="readonly">
				</div>
			</div>
			<hr style= width:80%; > 
			<div class="form-group">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="10" cols="100" name="board_content"></textarea>
				</div>
			</div>
			<div class="form-group" align="center">
				<button type="submit">작성</button>
			</div>&nbsp;&nbsp;&nbsp;&nbsp;
	
		</form>
	</div>
	<%@ include file="../module/Bottom.jsp"%>
</body>
</html>