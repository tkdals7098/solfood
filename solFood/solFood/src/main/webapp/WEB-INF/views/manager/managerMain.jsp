<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SolFood Admin</title>
	<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
	
	<%-- <%@ include file = "../module/managerTop.jsp" %> --%>
	
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../module/managerTop.jsp"/>
	
	<br>
		
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	
	<div class="container">
		<article class="message is-dark">
			<div class="message-body" style="font-size: 18px;">
			<%
			Date now = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			String today = sf.format(now);
			%>
			<%=today%>
			<span id=tick2></span>
		</div>
		</article>
	</div>
	<hr>
	<section class="section has-background-light">
		<div class="container">
			<!-- <h1 class="title"></h1> -->				
			<div class="columns">
				<div class="column">
					<div class="notification is-info">
						<h1 class="title is-size-4"><a href="${path}/board/managerBoard_listPage" style="text-decoration: none;">최근게시물 <b style="font-size: 8px;">(자세히)</b></a></h1>
						<p class="is-size-5">
							<table>
								<c:forEach items="${boardList}" var="boardList" end="9">
									<tr>
										<td>
											[${boardList.board_category}]&ensp;
										</td>
										<td>
											<a href="/board/managerBoard_view?page=1&perPageNum=10&searchType&keyword=&board_num=${boardList.board_num}">${boardList.board_title}</a>&ensp;
										</td>
									</tr>
								</c:forEach>
							</table>
						</p>
					</div>
				</div>
				
				
				<div class="column">
					<div class="notification is-primary">
						<h1 class="title is-size-4"><a href="${path}/manager/buy/buy_list.do" style="text-decoration: none;">최근주문 <b style="font-size: 8px;">(자세히)</b></a></h1>
						<p class="is-size-5">
							<table>
								<c:forEach items="${buyList}" var="buy" end="9">
									<tr>
										<td>
											[${buy.buy_date}]&ensp;
										</td>
										<td>
											${buy.buy_delivery}&ensp;
										</td>
									</tr>
								</c:forEach>
							</table>
						</p>
					</div>
				</div>
				
			</div>
		</div>
	</section>
	
	<script>
	function show2(){
		if (!document.all&&!document.getElementById)
		return
			thelement=document.getElementById? document.getElementById("tick2"): document.all.tick2
	
		var Digital=new Date()
		var hours=Digital.getHours()
		var minutes=Digital.getMinutes()
		var seconds=Digital.getSeconds()
		var dn="PM"
	
		if (hours<12)
			dn="AM"
		if (hours>12)
			hours=hours-12
		if (hours==0)
			hours=12
		if (minutes<=9)
			minutes="0"+minutes
		if (seconds<=9)
			seconds="0"+seconds
		var ctime=hours+":"+minutes+":"+seconds+" "+dn
			thelement.innerHTML="<b>"+ctime+"</b>"
			setTimeout("show2()",1000)
	}
	window.onload=show2
	</script>
	<jsp:include page="../module/managerBottom.jsp" flush="false"/>
</body>
</html>