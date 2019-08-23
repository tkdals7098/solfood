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
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<div class="title" style="vertical-align: bottom;">
			콘텐츠현황
			<button class="button is-outlined" onclick="location.href='${path}/manager/recipe/recipe_register.do'" style="vertical-align: middle;">
			<span class="icon">
			  <i class="fas fa-lg fa-pencil-alt"></i>
			</span>
			</button>
		</div>
		<hr>
		<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-dark">
			<thead>
				<tr>
					<th class="is-dark col-md-1">ID.</th>
					<th class="is-dark col-md-1">NAME</th>
					<th class="is-dark col-md-1">DATE</th>
					<th class="is-dark col-md-1">IMG</th>
					<th class="is-dark col-md-1">CONTENT</th>
					<th class="is-dark col-md-1">KEYWORD</th>
					<th class="is-dark col-md-1">CONFIG</th>
				</tr>	
			</thead>
			<tbody>
				<c:forEach items="${recipeList}" var="recipe">
					<tr class="is-size-7">
						<td align="center">${recipe.recipe_id}</td>
						<td align="center">${recipe.recipe_name}</td>
						<td align="center">${recipe.recipe_date}</td>
						<td align="center"><abbr title="${recipe.recipe_image}"><img src="/img/${recipe.recipe_image}" style="width:50px; height:auto;"/></abbr></td>
						<td align="center">${recipe.recipe_content}</td>
						<td align="center">${recipe.recipe_keyword}</td>
						
						<td align="center">
							<a href="${path}/manager/recipe/recipeUpdate.do?recipe_id=${recipe.recipe_id}">
								<button type="button" class="button is-info is-small">수정</button>
							</a>
							<a href="${path}/manager/recipe/recipeDelete.do?recipe_id=${recipe.recipe_id}">
								<button type="button" class="button is-danger is-small">삭제</button>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
</body>
</html>