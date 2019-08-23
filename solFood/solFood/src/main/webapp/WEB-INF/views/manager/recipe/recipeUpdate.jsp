<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	<%@ include file = "../../module/managerTop.jsp" %>
	
	<script>
	var file = document.getElementById("file");
	file.onchange = function(){
	    if(file.files.length > 0)
	    {
	      document.getElementById('filename').innerHTML = file.files[0].name;
	    }
	};
	</script>
	
	<style>
	.select_img img{
		margin: 20px 0px;
	}
	</style>
	<style>
	td {
		vertical-align: middle !important;
	}
	</style>
	
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<jsp:include page="../../module/managerTop.jsp"/>
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">콘텐츠수정</h1>
		<hr>
	</div>
	
	
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data" action="${path}/manager/recipe/recipeUpdatePro.do?recipe_id=${recipeDetail.recipe_id}">
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">콘텐츠no.</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_id" maxlength="20" value="${recipeDetail.recipe_id}" placeholder="Disabled input" disabled>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
			
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">이름</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="recipe_name" maxlength="20" value="${recipeDetail.recipe_name}">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">키워드</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="recipe_keyword" maxlength="50" value="${recipeDetail.recipe_keyword}" >
						</div>
					</div>	
				</div>	
				
				<!-- 현재년도 -->
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">작성일</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_date" maxlength="20" value="${recipeDetail.recipe_date}">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">사진</label></div>
					
					<div class="field-body">
					
						<div class="field is-expanded">
							<input type="file" class="input" id="recipe_image" name="file"/>
							${recipeDetail.recipe_image}
							<div class="select_img">
								<img src="/img/${recipeDetail.recipe_image}" style="width: 100px; height: auto;"/>						
								<input type="hidden" name="recipe_image" value="${recipeDetail.recipe_image}">
							</div>
								
							<script>
								$("#recipe_image").change(function(){
									if(this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src", data.target.result).width(200);								
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
							</script>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">내용</label></div><!-- 에디터 -->
					<div class="field-body">
						<div class="field is-expanded">
							<textarea name="recipe_content" id="summernote">${recipeDetail.recipe_content}</textarea>						
						</div>
					</div>
				</div>
				
				<hr>
				
				
						
				<%-- 등록/취소 버튼 --%>
				<div class="field is-grouped is-pulled-right"">
					<div class="control">
						<button class="button is-link" type="submit">수정완료</button>
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
			<jsp:include page="./relateProduct.jsp"/>
		</div>
		<hr>
	</div>
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
	<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
	
</body>
</html>