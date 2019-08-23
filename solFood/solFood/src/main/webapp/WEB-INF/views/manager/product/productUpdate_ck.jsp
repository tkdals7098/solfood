<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>productUpdate</title>
	
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	
	<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>

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
		<h1 class="title">상품정보수정</h1>
		<hr>
	</div>
	
	
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data">
			
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품코드</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_id" maxlength="20" value="${productUpdate.product_id}" placeholder="Disabled input" disabled>
							<span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품명</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_name" maxlength="20" value="${productUpdate.product_name}">
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대분류</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_category1" maxlength="20" value="${productUpdate.product_category1}" >
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">소분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_category2" maxlength="20" value="${productUpdate.product_category2}">
						</div>
					</div>	
				</div>	
				
				<hr>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">가격</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_price" maxlength="20" value="${productUpdate.product_price}">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">할인율</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_discountrate" maxlength="20" value="${productUpdate.product_discountrate}">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">재고</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_count" maxlength="50" value="${productUpdate.product_count}" >
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대표사진2</label></div>
					
					<div class="field-body">
					
						<div class="field is-expanded">
							<input type="file" class="input" id="product_image" name="file"/>
							${productUpdate.product_image}
							<div class="select_img">
								<img src="/img/${productUpdate.product_image}" style="width: 100px; height: auto;"/>						
								<input type="hidden" name="product_image" value="${productUpdate.product_image}">
							</div>
								
							<script>
								$("#product_image").change(function(){
									if(this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src", data.target.result).width(200);								
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
							</script>
								
								<%-- <%=request.getRealPath("/") %> --%>
								
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">보관형태</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_package" maxlength="20" value="${productUpdate.product_package}">
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">포장단위</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_ea" maxlength="20" value="${productUpdate.product_ea}">
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">유통기한</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_date" maxlength="20" value="${productUpdate.product_date}">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">에디터</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<textarea class="input" name="product_content" id="editor">${productUpdate.product_content}</textarea>				
						</div>
					</div>
				</div>
				
				
				<hr>
				
				
				<div class="field is-grouped">
					<div class="control">
						<button class="button is-link" type="submit">수정완료</button>
					</div>
					<div class="control">
						<input class="button is-danger" type="button" value="취소" onclick="history.back();" />
					</div>
				</div>
				
				
			</form>
		</div>
	</div>
	
		
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
	
	<script src="../../../resources/js/ckeditor.js"></script>
	
</body>
</html>