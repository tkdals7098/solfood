<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
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
<script>
$(document).ready(function(){
	$("#table").tablesorter();
});
</script>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
	<h1 class="title">판매관리</h1>
	<hr>

		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark" id="table">
			<thead>
				<tr>
					<th class="is-dark">no.</th>
					<th class="is-dark">DATE</th>
					<th class="is-dark">DELIV.STAT</th>
					
					<th class="is-dark"><abbr title="Ordered Product Count">CNT</abbr></th>
					<th class="is-dark"><abbr title="Ordered User">USER</abbr></th>
					<th class="is-dark"><abbr title="Orederd Product">PRODUCT</abbr></th>
					
					<th class="is-dark">NAME</th>
					<th class="is-dark">SHIP.ADDRESS</th>
					<th class="is-dark">TEL</th>
					<th class="is-dark">E-MAIL</th>
					
					<th class="is-dark">DETAIL</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${buyList}" var="buy">
					<tr class="is-size-7">
						<td align="center">${buy.buy_id}</td>
						<td align="center">${buy.buy_date}</td>
						<c:choose>
							<c:when test="${buy.buy_delivery eq '배송중'}"><b style="color: red;">
								<td align="center"><input type="hidden" name="status" value="${buy.buy_delivery}"><b style="color: Gold;">${buy.buy_delivery}</b></td>
							</c:when>
							<c:when test="${buy.buy_delivery eq '배송준비중'}"><b style="color: red;">
								<td align="center"><input type="hidden" name="status" value="${buy.buy_delivery}"><b style="color: Red;">${buy.buy_delivery}</b></td>
							</c:when>
							<c:when test="${buy.buy_delivery eq '배송완료'}"><b style="color: red;">
								<td align="center"><input type="hidden" name="status" value="${buy.buy_delivery}"><b style="color: LimeGreen;">${buy.buy_delivery}</b></td>
							</c:when>
						</c:choose>
						
						<td align="center">${buy.buy_count}</td>
						<td align="center">${buy.account_user}</td>
						<td align="center">${buy.product_id}</td>
						
						<td align="center">${buy.account_name}</td>
						<td align="center">${buy.account_address}</td>
						<td align="center">${buy.account_tel}</td>
						<td align="center">${buy.account_email}</td>
						
						<td align="center">
							<a href="buy_detail.do?buy_id=${buy.buy_id}">
								<button type="button" class="button is-info is-small">상세정보</button>
							</a>
							<%-- <a href="productDelete.do?product_id=${buy.buy_id}">
								<button type="button" class="button is-danger is-small">삭제</button>
							</a> --%>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	
"
	
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>