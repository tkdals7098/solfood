<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<!-- ======================================================================================== -->
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<%-- top --%>
	<%
		int a = 1;
	%>
	<jsp:include page="../module/managerTop.jsp" />
	<br>
	<br>
	<br>
	<!-- ==========================매니저카테고리 버튼================================================= -->
	<div class="row">
		<!-- left category -->
		<div class="col-md-2 sidebar">
			<br>
			<br>
			<br>
			<ul class="nav nav-sidebar" align="center">
				<li class="active"><a href="/board/listPage"
					style="color: #3273dc">BOARD CATEGORY<span class="sr-only">(current)</span></a></li>
				<li><a
					href="/board/managerBoard_category?board_category=notice"
					style="color: #3273dc">공지사항</a></li>
				<li><a href="/board/managerBoard_category?board_category=event"
					style="color: #3273dc">이벤트</a></li>
				<li><a
					href="/board/managerBoard_category?board_category=proposal"
					style="color: #3273dc">상품제안</a></li>
				<li><a
					href="/board/managerBoard_category?board_category=question"
					style="color: #3273dc">Q&A</a></li>
				<li><a href="/board/managerBoard_listPage"
					style="color: #3273dc"><span
						class="glyphicon glyphicon-eye-open"></span>관리자게시판</a></li>
			</ul>
		</div>


		<!-- ====================매니저 게시글 검색기능========================================================================================= -->
		<div class="col-md-10">
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
					<button type="button" id='searchBtn2' class="btn btn-primary">
						<span class="glyphicon glyphicon-search"></span> 검색
					</button>
				</div>

				<!-- ============================매니저 게시글 테이블 ================================================================================= -->
				<table class="table table-hover">
					<!-- <table class="table table-bordered table-striped nanum table-hover"> -->
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

						<c:set var="size" value="${fn:length(managerBoard_list)}" />
						<!-- list길이를 value로 쓰인다,사용할 변수는 size -->
						<c:forEach var="i" begin="1" end="${size}">
							<!-- for문을 돌리는데 i를 변수로 쓰고 시작은 1로, 끝은 size로 한다  -->
							<tr>
								<td>${size}</td>
								<!-- 시작은 list의 끝인 end로 시작  -->
								<c:set var="size" value="${size-1}"></c:set>
								<!--${fn:length(list)}를 1씩 줄여나간다  -->

								<td>${managerBoard_list[size].board_category}</td>
								<td><a
									href="/board/managerBoard_view${pageMaker.makeSearch(pageMaker.cri.page)}&board_num=${managerBoard_list[size].board_num}">${managerBoard_list[size].board_title}</a>
								</td>
								<td>${managerBoard_list[size].account_user}</td>
								<td><fmt:formatDate
										value="${managerBoard_list[size].board_date}"
										pattern="yyyy-MM-dd" /></td>
								<td>${managerBoard_list[size].board_readcount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- ====================매니저 게시글 페이징================================================================= -->
				<div align="center">
					<c:if test="${pageMaker.prev}">
						<a href="managerBoard_list${pageMaker.makeSearch(pageMaker.startPage - 1) }">«</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<c:out value="${pageMaker.cri.page == idx?'':''}" />
						<a href="managerBoard_list${pageMaker.makeSearch(idx)}">${idx}</a>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<a href="managerBoard_list${pageMaker.makeQuery(pageMaker.endPage +1) }">»</a>
					</c:if>
				</div>
				<br>
				<a href="write" class="btn btn-info" aria-pressed="true">
				<span class="glyphicon glyphicon-pencil"></span> 작성
				</a>
				<!-- ================검색function======================================================================================= -->

				<script type="text/javascript"
					src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

				<script type="text/javascript">
					$(document)
							.ready(
									function() {
										$('#searchBtn2')
												.on(
														"click",
														function(event) {
															alert("매니저검색테스트");
															str = "managerBoard_list"
																	+ '${pageMaker.makeQuery(1)}'
																	+ "&searchType="
																	+ $(
																			"select option:selected")
																			.val()
																	+ "&keyword="
																	+ encodeURIComponent($(
																			'#keywordInput')
																			.val());
															console.log(str);
															self.location = str;
														});

										$('#newBtn').on("click", function(evt) {
											self.location = "write";
										});
									});
				</script>
				<!-- ============================================검색펀션============================================================ -->
			</div>
		</div>
	</div>
</body>
</html>