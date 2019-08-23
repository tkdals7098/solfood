<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
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

.button-2{
  width:60px;
  height:35px;
  border:1px solid #34495e;
  float:right;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 20px 25px;
}
.button-2 a{
  font-family:arial;
  font-size:16px;
  color:#34495e;
  text-decoration:none;
  line-height:30px;
  transition:all .5s ease;
  z-index:1;
  position:relative;
}
.eff-2{
  width:140px;
  height:50px;
  top:-50px;
  background:#34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
}
.button-2:hover .eff-2{
  top:0;
}
.button-2:hover a{
  color:#fff;
}


</style>
<body>
<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<jsp:include page="../module/managerTop.jsp" />
	
	<br>
	<br>
<div class="container">
	<!--  -->
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
        <td>${view.board_title}</td>
    </tr>
    <tr>
        <th scope="row">작성자</th>
        <td>${view.account_user}</td>
    </tr>
    <tr>
        <th scope="row">작성날짜</th>
        <td><fmt:formatDate value="${view.board_date}" pattern="yyyy-MM-dd" /></td></td>
    </tr>
      <tr>
        <th scope="row">게시글 내용</th>
        <td>${view.board_content}<br><br><br><br><br><br><br><br><br></td>
    </tr>
    
</table>
		
			<div align="right" id="container">

  <div class="button-2">
    <div class="eff-2"></div>
    <a href="/board/managerBoard_update?board_num=${view.board_num}">수정</a> 
      </div>
      
<div class="button-2">	
    <div class="eff-2"></div>
    <a href="/board/managerBoard_delete?board_num=${view.board_num}">삭제</a> 
  	</div>
  	
<div class="button-2">	
    <div class="eff-2"></div>    
    <a href="/board/managerBoard_listPage"> 리스트</a>
	</div>
</div>
		</form>

</div>


	<%-- <div class="container">
		<h1 align="center">${view.board_title}의게시글 뷰</h1>
		<br>
		<form class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="board_title"
						value="${view.board_title}" readonly="readonly" />
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
					<input type="text" name="board_date"
						value="<fmt:formatDate value="${view.board_date}" pattern="yyyy-MM-dd" />"
						readonly="readonly" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">내용</label>
				<div class="col-sm-3">
					<textarea rows="5" cols="50" name="board_content"
						readonly="readonly">${view.board_content} </textarea>
				</div>
			</div>
			<div class="control-label col-sm-3">
				<a href="/board/managerBoard_update?board_num=${view.board_num}"
					class="btn btn-primary">수정</a> <a
					href="/board/managerBoard_delete?board_num=${view.board_num}"
					class="btn btn-primary">삭제</a> <a
					href="/board/managerBoard_listPage" class="btn btn-primary">
					리스트</a>
			</div>
		</form>
	</div>
 --%>
	<jsp:include page="comment.jsp" />
	<!-- 댓글 include -->

</body>
</html>