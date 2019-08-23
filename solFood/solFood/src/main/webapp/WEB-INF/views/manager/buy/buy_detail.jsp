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
	<form method="post">
	<h1 class="title">판매관리</h1>
	<hr>
		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark" id="table">
			<thead>
				<tr>
					<th class="is-dark">no.</th>
					<th class="is-dark">DATE</th>
					
					<th class="is-dark"><abbr title="Orederd Product">PRODUCT</abbr></th>
					
					<th class="is-dark">NAME</th>
					<th class="is-dark">ORDER DETAIL</th>
					
					<th class="is-dark">DELIV.STAT</th>
					
				</tr>	
			</thead>
					
			<tbody>
				<tr class="is-size-7">
					<td align="center">${buyDetail.buy_id}</td>
					<td align="center">${buyDetail.buy_date}</td>
					
		
					
					<td align="center">${buyDetail.account_user}</td>
					
					<td align="center">
						<br>
						[수령인]　${buyDetail.account_name}<br>
						[배송지]　${buyDetail.account_address}<br>
						[연락처]　${buyDetail.account_tel}<br>
						[이메일]　${buyDetail.account_email}<br>
						<br>
					</td>
					<td align="center">
						[${buyDetail.product_id}]　${buyDetail.product_name}　${buyDetail.buy_count}개<br>
						<hr style="margin: 10px 0px 10px 0px;">
						${buyDetail.product_price}원
					<br>
					</td>
					<c:choose>
						<c:when test="${buyDetail.buy_delivery eq '배송중'}">
							<td align="center" style="padding-top: 14px; padding-bottom: 0px;">
								<input type="hidden" name="status" value="${buyDetail.buy_delivery}"><b style="color: Gold">${buyDetail.buy_delivery}</b>
								<hr style="margin: 8px 0px 8px 0px;">
								<div class="control field is-small" style="width: 100px;">
								  	<div class="select is-small">
									    <select name="buy_delivery">
									    	<option value="${buyDetail.buy_delivery}" hidden>상태변경</option>
									      	<option value="배송준비중" style="color: Red">배송준비중</option>
									      	<option value="배송중" style="color: Gold">배송중</option>
									      	<option value="배송완료" style="color: LimeGreen">배송완료</option>
									    </select>
							  		</div>
								</div>
							</td>
						</c:when>
						<c:when test="${buyDetail.buy_delivery eq '배송준비중'}">
							<td align="center" style="padding-top: 14px; padding-bottom: 0px;">
								<input type="hidden" name="status" value="${buyDetail.buy_delivery}"><b style="color: Red">${buyDetail.buy_delivery}</b>
								<hr style="margin: 8px 0px 8px 0px;">
								<div class="control field is-small" style="width: 100px;">
								  	<div class="select is-small">
									    <select name="buy_delivery">
									    	<option value="${buyDetail.buy_delivery}" hidden>상태변경</option>
									      	<option value="배송준비중" style="color: Red">배송준비중</option>
									      	<option value="배송중" style="color: Gold">배송중</option>
									      	<option value="배송완료" style="color: LimeGreen">배송완료</option>
									    </select>
							  		</div>
								</div>
							</td>
						</c:when>
						<c:when test="${buyDetail.buy_delivery eq '배송완료'}">
							<td align="center" style="padding-top: 14px; padding-bottom: 0px;">
								<input type="hidden" name="status" value="${buyDetail.buy_delivery}"><b style="color: LimeGreen">${buyDetail.buy_delivery}</b>
								<hr style="margin: 8px 0px 8px 0px;">
								<div class="control field is-small" style="width: 100px;">
								  	<div class="select is-small">
									    <select name="buy_delivery">
									    	<option value="${buyDetail.buy_delivery}" hidden>상태변경</option>
									      	<option value="배송준비중" style="color: Red">배송준비중</option>
									      	<option value="배송중" style="color: Gold">배송중</option>
									      	<option value="배송완료" style="color: LimeGreen">배송완료</option>
									      	<option value=123 style="color: LimeGreen">123</option>
									    </select>
							  		</div>
								</div>
							</td>
						</c:when>
					</c:choose>
				</tr>
					
			</tbody>	
		</table>
		
		
		<div class="field is-grouped is-pulled-right">
			<div class="control">
				<button class="button is-link" type="submit">정보수정</button>
			</div>
			<!-- 
			<div class="form-group">
			    <button type="submit" id="register_Btn" name="submit" class="btn btn-primary">등록</button>
			</div>
			 -->
			<div class="control">
				<input class="button is-danger" type="button" value="취소" onclick="history.back();" />
			</div>
		</div>
	</form>
	</div>
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>