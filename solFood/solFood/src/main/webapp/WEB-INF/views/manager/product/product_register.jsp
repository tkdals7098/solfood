<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	td {
		vertical-align: middle !important;
	}
	</style>
	
</head>
<body>

	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<br>

<div style="display: none;">
	<c:forEach items="${productList}" var="product">
		<input type="hidden" name="proId" value="${product.product_id}"/>
		<input type="hidden" name="proName" value="${product.product_name}"/>
		<br>
	</c:forEach>
</div>

<script type="text/javascript">
var pro = [];
var length = document.getElementsByName("proId").length;

//var value = [document.getElementsByName("proId")[0].value + ". " +  document.getElementsByName("proName")[0].value];

//pro = document.getElementsByName("product")[1].value;		
for(var i=0; i<document.getElementsByName("proId").length; i++){
	pro.push(document.getElementsByName("proName")[i].value);
}

console.log(pro);
console.log("length:"+length);

$(function() {
    $("#proInput").autocomplete({
        source: pro,
        select: function(event, ui) {
            console.log(ui.item);
        },
        focus: function(event, ui) {
            return false;
        }
    });
});
</script>

	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>	
	<div class="container">
		<h1 class="title">상품등록</h1>
		<hr>
	</div>
	
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>

	<div class="container is-fluid">
		<div class="columns is-centered">
			<form class="column is-half" method="post" autocomplete="off" enctype="multipart/form-data">
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품명</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="ui-widget">
								<input type="text" id="proInput" class="input" name="product_name" maxlength="20">
								<!-- <span class="icon is-small is-right"><i class="fas fa-lock has-text-grey-dark"></i></span> -->
							</div>
						</div>
					</div>	
				</div>	
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="select">
							  <select name="product_category1" onchange="changeCate1(this)">
							  	<option value="" hidden>───── 대분류를 선택하세요 ─────</option>
							    <option value="채소·과일">채소·과일</option>
							    <option value="국·반찬·요리">국·반찬·요리</option>
							    <option value="정육·계란">정육·계란</option>
							    <option value="샐러드·간편식">샐러드·간편식</option>
							  </select>
							</div>
						</div>
					</div>
				</div>
				<script>
					var cate1 = ['채소·과일', '국·반찬·요리','정육·계란','샐러드·간편식'];
					var cate2 = [];
					var length1 = cate1.length;
					
					function changeCate1(e){
						var selectCate1 = document.getElementById("product_category1");						
						console.log(e.value);
						
						//alert(length1);
						//cate21 = ['기본채소', '콩나물·버섯류', '양파·마늘·생강·파'];
						if(e.value == cate1[0]) {var cate2 = ['기본채소', '콩나물·버섯류', '양파·마늘·생강·파'];}
						else if(e.value == cate1[1]){var cate2 = ['국·탕·찌개', '밑반찬', '김치·장아찌·젓갈', '두부·어묵'];}
						else if(e.value == cate1[2]){var cate2 = ['소고기', '돼지고기', '양고기', '닭·오리고기', '계란·돈까스'];}
						else if(e.value == cate1[3]){var cate2 = ['샐러드·도시락', '간편식·냉동식품', '죽·수프', '선식·시리얼·그래놀라'];}
												
						category2.options[0] = null;
						for(i=0; i<cate2.length; i++){
							category2.options[i] = new Option(cate2[i]);
						}
					}
				</script>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">소분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="select">
							  <select name="product_category2" id="category2">
							    <option value="" hidden>───── 대분류를 선택하세요 ─────</option>
							  </select>
							</div>
						</div>
					</div>
				</div>
				<!-- 
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">소분류</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<div class="select">
							  <select name="product_category2">
							    <option value="기본채소">기본채소</option>
							    <option value="콩나물·버섯류">콩나물·버섯류</option>
							    <option value="양파·마늘·생강·파">양파·마늘·생강·파</option>
							  </select>
							  <select name="product_category2">
							    <option value="국·탕·찌개">국·탕·찌개</option>
							    <option value="밑반찬">밑반찬</option>
							    <option value="김치·장아찌·젓갈">김치·장아찌·젓갈</option>
							    <option value="두부·어묵">두부·어묵</option>
							    <option value="메인요리">메인요리</option>
							  </select>
							  <select name="product_category2">
							    <option value="소고기">소고기</option>
							    <option value="돼지고기">돼지고기</option>
							    <option value="양고기">양고기</option>
							    <option value="닭·오리고기">닭·오리고기</option>
							    <option value="계란·돈까스">계란·돈까스</option>
							  </select>
							  <select name="product_category2">
							    <option value="샐러드·도시락">샐러드·도시락</option>
							    <option value="간편식·냉동식품">간편식·냉동식품</option>
							    <option value="죽·수프">죽·수프</option>
							  	<option value="선식·시리얼·그래놀라">죽·선식·시리얼·그래놀라</option>
							  </select>
							</div>
						</div>
					</div>
				</div>
				 -->
				<hr>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">가격</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_price" maxlength="20" value="111">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">할인율</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_discountrate" maxlength="20" value="111">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">재고</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<input type="text" class="input" name="product_count" maxlength="50" value="111">
						</div>
					</div>	
				</div>	
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">대표사진</label></div>
					<div class="field-body">
						<div class="field is-expanded">
							<div class="select_img">
								<input type="file" class="input" id="product_image" name="file">
								<img src="" />
								
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
							</div>
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">보관형태</label></div>
					<div class="field-body">
						<div class="control field is-expanded">
							<div class="control">
								&emsp;&emsp;
								<label class="radio">
									<input type="radio" name="product_package" value="실온">실온
								</label>
								&emsp;
								<label class="radio">
									<input type="radio" name="product_package" value="냉장보관">냉장보관
								</label>
								&emsp;
								<label class="radio">
									<input type="radio" name="product_package" value="냉동보관">냉동보관
								</label>
							</div>
						</div>
					</div>	
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">포장단위</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="text" class="input" name="product_ea" maxlength="20" value="111">
						</div>
					</div>	
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">상품설명</label></div><!-- 에디터 -->
					<div class="field-body">
						<div class="field is-expanded">
							<textarea name="product_content" id="summernote"></textarea>
								
						</div>
					</div>
				</div>
				
				<div class="field is-horizontal">
					<div class="field-label is-normal"><label class="label">유통기한</label></div>
					<div class="field-body">
						<div class="control field is-expanded has-icons-right">
							<input type="date" class="input" name="product_date" maxlength="20" value="2012-12-12">
							<span class="icon is-small is-right"><i class="fas fa-exclamation-triangle has-text-grey-dark"></i></span>
						</div>
					</div>	
				</div>
				<hr>
				<div class="field is-grouped is-pulled-right"">
					<div class="control">
						<button class="button is-link" type="submit">상품등록</button>
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
		
		<hr>
	</div>
	
	<jsp:include page="../../module/managerBottom.jsp" flush="false"/>
	<script src="${pageContext.request.contextPath}/resources/js/editor.js"></script>
</body>
</html>

