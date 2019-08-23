<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<link href="../../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.js"></script>
	
	<script type="text/javascript"src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	
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
<script>
$(document).ready(function(){
	$("#table").tablesorter();
});
</script>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../module/managerTop.jsp"/>
	<br>	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">게시물관리</h1>
		<hr>
	
		<div class="tabs is-boxed is-centered">
		  <ul>
			<li class="is-active" id="total">
			   <a href="/board/managerBoard_listPage">
			     <span class="icon is-small"><i class="far fa-file-alt" aria-hidden="true"></i></span>
			     <span>전체보기</span>
			   </a>
			</li>
		    <li id="notice">
		      <a href="/board/managerBoard_category?board_category=notice">
		        <span>공지사항</span>
		      </a>
		    </li>
		    <li id="event">
		      <a href="/board/managerBoard_category?board_category=event">
		        <span>이벤트</span>
		      </a>
		    </li>
		    <li id="proposal">
		      <a href="/board/managerBoard_category?board_category=proposal">
		        <span>상품제안</span>
		      </a>
		    </li>
		    <li id="qna">
		      <a href="/board/managerBoard_category?board_category=question">
		        <span>Q&A</span>
		      </a>
		    </li>
		    <li id="admin">
		      <a href="/board/managerBoard_category?board_category=admin">
		        <span>관리자게시판</span>
		      </a>
		    </li>
		  </ul>
		</div>
		
		<div class="column is-one-quarter" style="padding: 0px 0px 22px 0px;" id="search">
			<p class="control is-loading is-small">
	  			<input class="input is-small" type="text" placeholder="Search by Keyword" id="keyword"/>
			</p>
		</div>
		<!-- ==================매니져게시글=========================================================================================== -->
		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark" id="table">
			<thead>
				<tr>
					<th class="is-dark col-md-1">번호</th>
					<th class="is-dark col-md-1">카테고리</th>
					<th class="is-dark col-md-1">제목</th>
					<th class="is-dark col-md-1">작성자</th>
					<th class="is-dark col-md-1">작성일</th>
					<th class="is-dark col-md-1">조회수</th>
				</tr>
			</thead>
			<tbody>
				<!-- ================================================================================================ -->
				<c:forEach items="${managerBoard_list}" var="managerBoard_list">
					<tr>
						<td>${managerBoard_list.board_num}</td>
						<td>${managerBoard_list.board_category}</td>
						<td><a
							href="/board/managerBoard_view${pageMaker.makeSearch(pageMaker.cri.page)}&board_num=${managerBoard_list.board_num}">${managerBoard_list.board_title}</a>
						</td>
						<td>${managerBoard_list.account_user}</td>
						<td><fmt:formatDate value="${managerBoard_list.board_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${managerBoard_list.board_readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
			
		
		<!-- ===================매니져 게시글 검색기능================================================================================================ -->
		<div class="field is-grouped is-grouped-right">
			<div class="select">
				<select name="searchType">
					<option value="n"
						<c:out value="${cri.searchType == null?'selected':''}"/>>전체</option>
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목 + 내용</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용 + 작성자</option>
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목 + 내용 + 작성자</option>
				</select>
			</div>
			<div class="field has-addons">
				<div class="control">
					<input class="input" type="text" name='keyword' id="keywordInput" value='${cri.keyword}'>
				</div>
				<div class="control">
					<button type="button" id='searchBtn2' class="button is-info">검색</button>
				</div>
			</div>
			&ensp;
			<button type="button" class="button is-info" onclick="location.href='managerBoard_write'">글작성</button>
		</div>
	</div>
	

	<!-- --------------------------------------------------------------------------------------------------------------- -->
	<script type="text/javascript">
		$(document).ready(
		function() {
			$('#searchBtn2').on(
					"click",
					function(event) {
						alert("테스트");
						str = "managerBoard_list"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword="
								+ encodeURIComponent($('#keywordInput')
										.val());
						console.log(str);
						self.location = str;

					}); //str에서 어디로 갈지 정해주는 거같음 //self.location
			$('#newBtn').on("click", function(evt) {
				self.location = "regist";
			});
		});
		

        $(document).ready(function(){
	    $("#search :input:text:visible:enabled:first").focus();
		});
		$(document).ready(function() {
	        $("#keyword").keyup(function() {
	            var k = $(this).val();
	            $("#table > tbody > tr").hide();
	            var temp = $("#table > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
	
	            $(temp).parent().show();
	        });
	    });
		
	</script>
	<jsp:include page="../module/managerBottom.jsp" flush="false"/>
</body>
</html>