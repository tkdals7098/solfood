<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<link href="../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../../../resources/bootstrap/js/bootstrap.js"></script>
	
	<!-- summer -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
	
	<%@ include file = "../../module/managerTop.jsp" %>
	
	<style>
	.select_img img{
		margin: 20px 0px;
	}
	td {
		vertical-align: middle !important;
	}
	</style>
	
	<script>	//레시피 연관상품 스크립트
	/* 연관상품 배열 */
	var relatePro = new Array();
	</script>

</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<br>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">콘텐츠등록</h1>
		<hr>
	</div>
	
	<!-- 레시피 게시물 번호(최대값+1) 구하기  -->
	<c:forEach items="${recipeList}" var="recipe" varStatus="status">
		<c:if test="${status.last}">
			<%-- ${recipe_Max} --%>
			<c:set var="recipe_Max" value="${recipe.recipe_id + 1}"/>
		</c:if>
	</c:forEach>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data" action="${path}/manager/recipe/recipe_register.do">
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">no</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_id" maxlength="20" value="${recipe_Max}">
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">이름</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_name" maxlength="20">
						</div>
					</div>	
				</div>	

				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">키워드</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="recipe_keyword" maxlength="20">
						</div>
					</div>	
				</div>	
			
				<!-- 현재년도 -->
				<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">작성일</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="date" class="input" name="recipe_date" maxlength="20" value="${sysYear}">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">사진</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<div class="select_img">
								<input type="file" class="input" id="recipe_image" name="file">
								<img src="" />
								
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
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">내용</label></div><!-- 에디터 -->
					<div class="field-body">
						<div class="field is-expanded">
							<textarea name="recipe_content" id="summernote"></textarea>						
						</div>
					</div>
				</div>
				
				<hr>
				
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">연관상품</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right" id="addedFormDiv">
							<div class="select">
								<select id="productSelect" name="selectBox" onchange="selectPro()">
									<option key="default-empty" hidden>───── 연관상품을 선택하세요. ─────</option>
									<c:forEach items="${productList}" var="product">
										<option id="productSelect_op" value="${product.product_id}">${product.product_id}.${product.product_name}</option>
									</c:forEach>
								</select>
							</div>
							<button class="button is-success is-outlined" type="button" onclick="addbtn()">＋</button>
							<div id="productAdded">
							</div>
						</div>
					</div>
					
					<div class="control field is-expanded" id="addedFormDiv">
						
					</div>
					
				</div>
				<script type="text/javascript">
					/* 현재 작성중인 레시피 게시물 번호 */
					var recipe_id = ${recipe_Max};
					/* 셀렉트박스 전체옵션의 length */
					var length = document.getElementById("productSelect").options.length;
					/* 셀렉트박스에서 선택되는 값 */
					var value;
					/* 셀렉트박스에서 선택된 상품목록 */
					var totalValue = [];
					/* DB에 입력가능하도록 변경한 상품번호 */
					var proNo
					
					var input;
					var inputBtn;
					var newDiv;
					
					function selectPro(){
						/* 셀렉트박스에서 선택된 옵션의 index 추출 */
						proNo = document.getElementById("productSelect").selectedIndex;
						
						/* 셀렉트박스 옵션의 내용물 */
						value = document.getElementById("productSelect").options[proNo].text;
						
						console.log("select : " + proNo + " | " + "proNo : " + proNo);
						console.log("value : "+ value);
					}
					
					function addbtn(){
						newDiv = document.createElement("div")
						input = document.createElement("input");
						inputVal = document.createElement("input");
						inputBtn = document.createElement("button");
						
						/* 선택상품목록 배열에 값 추가하기 */
						totalValue.push(proNo);
						console.log("selectedPro : " + totalValue);
						
						//DIV 추가
						newDiv.setAttribute("class", "field-body");
						document.getElementById("productAdded").appendChild(newDiv);
						
						//데이터 입력 후, 행추가
						input.setAttribute("value", value);
						input.setAttribute("class", "input");
						//input.setAttribute("name", "proValue")
						document.getElementById("productAdded").appendChild(input);		
						
						//데이터 입력 후, 행추가 / DB 넘기는 값
						inputVal.setAttribute("value", proNo);
						inputVal.setAttribute("type", "hidden");
						inputVal.setAttribute("class", "input");
						inputVal.setAttribute("name", "proValue")
						document.getElementById("productAdded").appendChild(inputVal);		
						
						//삭제버튼
						inputBtn.setAttribute("type", "button");
						inputBtn.setAttribute("class", "button is-danger is-outlined");
						inputBtn.setAttribute("onclick", "deleteBtn()");
						inputBtn.innerHTML = "×";
						document.getElementById("productAdded").appendChild(inputBtn);
						
						//DIV에 input과 button을 상속
						newDiv.appendChild(input);
						newDiv.appendChild(inputBtn);
					};
					
					function deleteBtn(){
						closest("div").remove();
					};
					
				</script>
				<hr>
				
				<%-- 등록/취소 버튼 --%>
				<div class="field is-grouped is-pulled-right"">
					<div class="control">
						<button class="button is-link" type="submit">등록</button>
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
				
				
				<button class="button is-link" type="button" onclick="send()">aaa</button>
				
			</form>
		</div>
		<hr>
	</div>
	
	
	
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
	<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
	
</body>
</html>

