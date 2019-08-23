<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="../../../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	
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
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<div class="title">
			상품현황
			<button class="button is-outlined" onclick="location.href='${path}/manager/product/product_register.do'" style="vertical-align: middle;">
			<span class="icon">
			  <i class="fas fa-lg fa-pencil-alt"></i>
			</span>
			</button>
		</div>
		<hr>
		<div class="column is-one-quarter" style="padding: 0px 0px 22px 0px;" id="search">
			<p class="control is-loading is-small">
	  			<input class="input is-small" type="text" placeholder="Search by Keyword" id="keyword"/>
			</p>
		</div>
		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark" id="table">
			<thead>
				<tr>
					<th class="is-dark col-md-1"><abbr title="Product ID">ID.</abbr></th>
					<th class="is-dark col-md-1">NAME</th>
					<th class="is-dark col-md-1">CATEGORY1</th>
					<th class="is-dark col-md-1">CATEGORY2</th>
					<th class="is-dark col-md-1">PRICE</th>
					<th class="is-dark col-md-1"><abbr title="Discount Rate">DIS%</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Total Product Count">CNT</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Thumbnail Image">IMG</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Packaging Type">PACK</abbr></th>
					<th class="is-dark col-md-1"><abbr title="Count per Product">EA</abbr></th>
					<!-- <th class="is-dark col-md-1">CONTENT</th> -->
					<th class="is-dark col-md-1">DATE</th>
					<th class="is-dark col-md-2">CONFIG</th>						
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${page}" var="product">
					<tr class="is-size-7">
						<td align="center">${product.product_id}</td>
						<td align="center">${product.product_name}</td>
						<td align="center">${product.product_category1}</td>
						<td align="center">${product.product_category2}</td>
						<td align="center">${product.product_price}</td>
						<td align="center">${product.product_discountrate}%</td>
						<td align="center">${product.product_count}</td>
						<td align="center"><abbr title="${product.product_image}"><img src="/img/${product.product_image}" style="width:50px; height:auto;"/></abbr></td>
						
						<td align="center">${product.product_package}</td>
						<td align="center">${product.product_ea}</td>
						<%-- <td align="center">${product.product_content}</td> --%>
						<td align="center">${product.product_date}</td>
						
						<td align="center">
							<a href="productUpdate.do?product_id=${product.product_id}">
								<button type="button" class="button is-info is-small">수정</button>
							</a>
							<a href="productDelete.do?product_id=${product.product_id}">
								<button type="button" class="button is-danger is-small">삭제</button>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
		
		<div class="columns is-centered">
			<div class="column is-one-third">
				<nav class="pagination is-small is-centered" role="navigation">
			 		<c:if test="${pageMaker.prev}">
			 			<li>
							<a class="pagination-previous" href="product_page.do?page=${pageMaker.startPage - 1}">PREV</a>
			 			</li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li>
							<a id="page${idx}" class="pagination-link" aria-current="page" href='<c:url value="product_page.do?page=${idx}"/>'>${idx}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li>
							<a class="pagination-next" href="product_page.do?page=${pageMaker.endPage + 1}">NEXT</a>
						</li>
					</c:if>
					<li>
						<a class="pagination-link is-danger" href='<c:url value="${path}/manager/product/product_list.do"/>'>▼</a>
					</li>
				</nav>
			</div>
		</div>
		<script>
			$(function(){
				var thisPage = '${pageMaker.cri.page}';
				$('#page'+thisPage).addClass('is-current');
			})
		</script>
		<%-- 활성페이지 : ${criteria.page}, 활성페이지 : ${pageMaker.cri.page} = 같은 결과 --%>
		<hr>
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