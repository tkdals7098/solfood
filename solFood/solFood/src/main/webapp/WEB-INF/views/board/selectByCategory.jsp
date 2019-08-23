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
<title>게시판 카테고리 목록</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<style>
#center {
	text-align: center;
}
</style>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap');
		body {
		font-family: 'Noto Sans KR', sans-serif !important;
	}
		table{
		font-family: 'Noto Sans KR', sans-serif !important;
	}
		#searchBtn{
		background: #F0F0F0;
		font-family: 'Noto Sans KR', sans-serif !important;
		font-weight: bold;
		border-radius: 0;
	}
		#write_btn{
		background: #F0F0F0;
		font-family: 'Noto Sans KR', sans-serif !important;
		font-weight: bold;
		border-radius: 0;
		}
			
		
</style>
<body>
	<%-- top --%>



	<%@ include file="../module/Top.jsp"%>
	<br>
	<br>
	<br>

	<div class="row">
		<!-- left category -->
		<div class="col-md-2 sidebar">
			<br>
			<br>
			<br>
			<!-- 화면 왼쪽 카테고리 메뉴 -->
			<ul class="nav nav-sidebar" align="center">
				<li class="active"><a href="/board/listPage">BOARD
						CATEGORY<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="/board/selectByCategory?board_category=notice"><span
						class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;&nbsp;공지사항</a></li>
				<li><a href="/board/selectByCategory?board_category=event"><span
						class="glyphicon glyphicon-gift"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이벤트</a></li>
				<li><a href="/board/selectByCategory?board_category=proposal"><span
						class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;상품제안</a></li>
				<li><a href="/board/selectByCategory?board_category=question"><span
						class="glyphicon glyphicon-question-sign"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&A</a></li>
			</ul>
		</div>
		<!-- ===================검색기능========================================================================================== -->
		<div class="col-md-8">
			<div class="container">

				<div align="right">
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
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목+
							내용</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>내용
							+ 작성자</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>제목
							+ 내용 + 작성자</option>
					</select> <input type="text" name='keyword' id="keywordInput"
						value='${cri.keyword }'>
					<button type="button" id='searchBtn' class="btn">검색</button>
				</div>
				<!-- ============================================================================================================= -->
				<!-- <table class="table table-bordered table-striped nanum table-hover"> -->
				<table class="table table-hover" style="margin-bottom: 10px;">
					<thead>
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<%-- 원래꺼 
					<!-- 리스트 순서 테스트 -->
						<c:forEach items="${list}" var="list"> 	<%--var=사용할 변수, item =Collection 객체(List, ArrayList) --%>
						<%-- <h2>${fn:length(list)}</h2> 
							
							<% int a= 1; %>
							<tr>
								<td>${list.board_num}</td>
								<td><%=a %></td>
								<td>${list.board_category}</td>
								<td>
									<a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&board_num=${list.board_num}">${list.board_title}</a>
								</td>
								<td>${list.account_user}</td>
								<td>
									 <fmt:formatDate value="${list.board_date}" pattern="yyyy-MM-dd" />
								</td>
								<td>${list.board_readcount}</td>
								<% a+= 1; %>
							</tr>
						</c:forEach>
					--%>


						<%-- 영민 --%>
						<%-- 위에 list를 ${fn:length(list)}로 대신해서 사용해서 리스트수를 알아낸다 --%>
						<c:set var="size" value="${fn:length(list)}" />
						
						<!-- list길이를 value로 쓰인다,사용할 변수는 size -->
						
						<c:choose>
							<c:when test="${size > 0}">
								<c:forEach var="i" begin="1" end="${size}">
									<!-- for문을 돌리는데 i를 변수로 쓰고 시작은 1로, 끝은 size로 한다  -->
									<%-- <p><c:out value="${list[size-i]}" /></p> --%>
		
									<tr>
										<td>${size}</td>
										<!-- 시작은 list의 끝인 end로 시작  -->
										<c:set var="size" value="${size-1}"></c:set>
										<!--${fn:length(list)}를 1씩 줄여나간다  -->
										<td>${list[size].board_category}</td>
										<td><a href="/board/view${pageMaker.makeSearch(pageMaker.cri.page)}&board_num=${list[size].board_num}">${list[size].board_title}</a>
										</td>
										<td>${list[size].account_user}</td>
										<td><fmt:formatDate value="${list[size].board_date}"
												pattern="yyyy-MM-dd" /></td>
										<td>${list[size].board_readcount}</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
				
							</c:when>
							<c:when test="${size <= 0}">
								</tbody>
							</table>
								<div class="container" id="center">
									
									<br>
									<h3>게시물이 없습니다</h3>
									<br>
									<hr>
								</div>
							</c:when>
						</c:choose>
						

				<%--카테고리 페이징
 				 		<div align="center">
						<c:if test="${pageMaker.prev}">
							<a href="selectByCategory${pageMaker.makeSearch(pageMaker.startPage - 1) }">«</a>
						</c:if>
							<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										
							<c:out value="${pageMaker.cri.page == idx?'':''}" />
								<a href="selectByCategory${pageMaker.makeSearch(idx)}">${idx}</a>
							</c:forEach>
	
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<a href="selectByCategory${pageMaker.makeQuery(pageMaker.endPage +1) }"> » </a>
						</c:if>
					</div>  --%>
				<br> <a href="write" class="btn" aria-pressed="true">
					<span class="glyphicon glyphicon-pencil"></span> 작성
				</a>
				<!-- --------------------------------------------------------------------------------------------------------------- -->
				<script type="text/javascript"
					src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#searchBtn')
												.on(
														"click",
														function(event) {
															str = "list"
																	+ '${pageMaker.makeQuery(1)}'
																	+ "&searchType="
																	+ $(
																			"select option:selected")
																			.val()
																	+ "&keyword="
																	+ encodeURIComponent($(
																			'#keywordInput')
																			.val());

															/* + "&board_category="+  */

															console.log(str);
															self.location = str;
														});
										$('#newBtn').on("click", function(evt) {
											self.location = "regist";
										});
									});
				</script>
				<!-- ==================================================================================================================== -->
			</div>
		</div>
	</div>
	<%@ include file="../module/Bottom.jsp"%>
</body>
</html>