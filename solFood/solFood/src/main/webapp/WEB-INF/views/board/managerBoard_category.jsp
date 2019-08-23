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
		<!-- =====================매니저 게시글 테이블======================================================================================== -->
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
				<c:set var="size" value="${fn:length(list)}" /><!-- list길이를 value로 쓰인다,사용할 변수는 size -->
				<c:forEach var="i" begin="1" end="${size}"><!-- for문을 돌리는데 i를 변수로 쓰고 시작은 1로, 끝은 size로 한다  -->
					<tr>
						<td>${size}</td>
						<!-- 시작은 list의 끝인 end로 시작  -->
						<c:set var="size" value="${size-1}"></c:set>
						<!--${fn:length(list)}를 1씩 줄여나간다  -->
						<td>${list[size].board_category}</td>
						<td><a
							href="/board/managerBoard_view${pageMaker.makeSearch(pageMaker.cri.page)}&board_num=${list[size].board_num}">${list[size].board_title}</a>
						</td>
						<td>${list[size].account_user}</td>
						<td><fmt:formatDate value="${list[size].board_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${list[size].board_readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- ------------------------------매니져 게시글 페이징------------------------------------------------------------------------------------------------- -->
		<div align="center">
			<c:if test="${pageMaker.prev}">
				<a href="managerBoard_listPage${pageMaker.makeSearch(pageMaker.startPage - 1) }">
				«
				</a>
			</c:if>
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<c:out value="${pageMaker.cri.page == idx?'':''}" />
					<a href="managerBoard_listPage${pageMaker.makeSearch(idx)}">
					${idx}
					</a>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<a href="managerBoard_listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">
				»
				</a>
			</c:if>
		</div>
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
		
		var urlpath = location.search;
		
		//alert(urlpath);
		
		var total = document.getElementById('total');
		var notice = document.getElementById('notice');
		var event = document.getElementById('event');
		var proposal = document.getElementById('proposal');
		var qna = document.getElementById('qna');
		var admin = document.getElementById('admin');
		
		switch(urlpath) {
		    case "?board_category=event":
		        event.classList.toggle("is-active");
		    	total.classList.remove("is-active");
		        break;
		    case "?board_category=proposal":
		    	proposal.classList.toggle("is-active");
		    	total.classList.remove("is-active");
		        break;
		    case "?board_category=question":
		        qna.classList.toggle("is-active");
		        total.classList.remove("is-active");
		        break;
		    case "?board_category=admin":
		        admin.classList.toggle("is-active");
		        total.classList.remove("is-active");
		        break;
		    case "?board_category=notice":
		    	notice.classList.add("is-active");
		    	total.classList.remove("is-active");
		        break;
		        
		    default:
		   		total.classList.toggle("is-active");
		        break;
		};

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