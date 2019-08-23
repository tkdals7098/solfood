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
	<%int a=1;%>
	<%--■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
	<h1 class="title">회원관리</h1>
	<hr>
	<div class="column is-one-quarter" style="padding: 0px 0px 22px 0px;" id="search">
		<p class="control is-loading is-small">
  			<input class="input is-small" type="text" placeholder="Search by Keyword" id="keyword"/>
		</p>
	</div>
		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark" id="table">
			<thead>
				<tr>
					<th class="is-dark col-md-1">No.</th>
					<th class="is-dark col-md-1">ACCOUNT</th>
					<th class="is-dark col-md-1">PASSWORD</th>
					<th class="is-dark col-md-1">NAME</th>
					<th class="is-dark col-md-2" align="center">TEL</th>
					<th class="is-dark col-md-2" align="center"><abbr title="Registered Date">Reg.DATE</abbr></th>
					<th class="is-dark col-md-4" align="center">ADDRESS</th>
					<th class="is-dark col-md-1" align="center"><abbr title="Access Grade">GRADE</abbr></th>
					<th class="is-dark col-md-1" align="center">AGE</th>
					<th class="is-dark col-md-1" align="center">GENDER</th>
					<th class="is-dark col-md-2" align="center">E-MAIL</th>
					<th class="is-dark col-md-2" >CONFIG</th>						
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${memberList}" var="member">
					<tr class="is-size-7">
						<td align="center"><%=a%></td>
						<td align="center">${member.account_user}</td>
						<td align="center">${member.account_password}</td>
						<td align="center">${member.account_name}</td>
						<td align="center">${member.account_tel}</td>
						<td align="center">${member.account_date}</td>
						<td align="center">${member.account_address}</td>
						<td align="center">${member.account_grade}</td>
						<td align="center">${member.account_age}</td>
						<td align="center">${member.account_gender}</td>
						<td align="center">${member.account_email}</td>
						
						<td align="center">
							<a href="accountUpdate.do?account_user=${member.account_user}">
								<button type="button" class="button is-info is-small">수정</button>
							</a>
							<a href="accountDelete.do?account_user=${member.account_user}">
								<button type="button" class="button is-danger is-small">삭제</button>
							</a>
						</td>
						<% a += 1; %>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	
	<script>
	$(document).ready(function(){
	    $("#search :input:text:visible:enabled:first").focus();
	});
	$(document).ready(function() {
        $("#keyword").keyup(function() {
            var k = $(this).val();
            $("#table > tbody > tr").hide();
            var temp = $("#table > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");

            $(temp).parent().show();
        });
    });
	</script>
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>