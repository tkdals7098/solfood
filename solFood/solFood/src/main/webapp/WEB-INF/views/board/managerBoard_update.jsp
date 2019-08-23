<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
</head>
<style>

	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
	body{
	font-family: 'Noto Sans KR', sans-serif !important;
	}
	hr{
	 border-top-color: #A6A6A6 !important; 
	}
table.type05 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
    
    width:1150px;
}
table.type05 th {
    width: 95px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
}
table.type05 td {
    width: 400px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}

button{
  background:#FFFFFF;
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



<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 게시물 수정화면 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<jsp:include page="../module/managerTop.jsp" />
	
	<br>
	<br>
		<div class="container">

	<div class="page_aticle">
		<div class="page_section">
			<div class="head_aticle">
			<br>
				<h4 align="left">&nbsp;&nbsp;&nbsp;${view.account_user}님의 게시글입니다</h4>
				<br>	
					
			</div>
		</div>
	</div>
	
		<form align="center" class="form-horizontal" method="post">
			<table align="center" class="type05">
    <tr>
        <th scope="row">제목</th>
        <td><input type="text" class="form-control" name="board_title"
						value="${view.board_title}" /></td>
    </tr>
    <tr>
        <th scope="row">작성자</th>
        <td>${view.account_user}</td>
    </tr>
    <tr>
        <th scope="row">작성날짜</th>
        <td><fmt:formatDate value="${view.board_date}" pattern="yyyy-MM-dd" /></td>
    </tr>
      <tr>
        <th scope="row">게시글 내용</th>
        <td><textarea rows="5" cols="50" name="board_content">${view.board_content}</textarea>
    </tr>
    
</table>
		<div>
			<div class=" control-label col-sm-5" align="center">
				<button type="submit"><span style="color:black">수정</span></button>
				<button class="default" id="cancel"><span style="color:black">취소</span></button>
			</div>
		</div>
<script>
$("#cancel").click(function(){
    history.go(-1)();
});
</script>
				
				
			

		</form>
	</div>
	<%-- 
	<div class="container">
		<h1 align="center">${view.board_title}의게시글 수정</h1>
		<br>
		<form class="form-horizontal" method="post">
			<input type="hidden" name="board_num" value="${view.board_num}" />
			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_title"
						value="${view.board_title}" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">작성자</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="account_user"
						value="${view.account_user}" readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">작성날짜</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_date"
						value="<fmt:formatDate value="${view.board_date}" pattern="yyyy-MM-dd" />"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="5" cols="50" name="board_content">${view.board_content}</textarea>
				</div>
			</div>
			<div>
				<div class=" control-label col-sm-3">
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</div>
		</form>
	</div> --%>
</body>
</html>