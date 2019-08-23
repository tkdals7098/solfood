<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">

<style>
body {
	margin-top: 100px;
	line-height: 1.6
}

.container {
	width: 1000px;
	margin: 0 auto;
}


ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px; 
	cursor: pointer;
}

ul.tabs li.current {
	background: #ededed;
	color: #222;
}

.tab-content {
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>



<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/bootstrap/js/bootstrap.js"></script>



<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/cylinder.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>


<%-- 2019최다 판매 그래프 --%>
<script type="text/javascript">
	$(function() {
		var processed_json = new Array();
		$.getJSON('/chart/chart_mostSelllingProducts_201907', function(data) {
			// Populate series
			for (i = 0; i < data.length; i++) {
				processed_json
						.push([ data[i].product_name, data[i].buy_count ]);
			}

			// draw chart
			$('#container1').highcharts({
				chart : {
					type : "column"
				},
				title : {
					text : ""
				},
				xAxis : {
					type : 'category',
					allowDecimals : false,
					title : {
						text : ""
					}
				},
				yAxis : {
					title : {
						text : "총 판매개수"
					}
				},
				series : [ {
					name : '판매 수량',
					data : processed_json
				} ]
			});
		});
	});
</script>

<%-- 2019카테고리별 판매 수량 --%>
<script type="text/javascript">
	$(function() {
		var processed_json = new Array();
		$.getJSON('/chart/chart_sellingProductsByCategory_201907', function(
				data) {
			for (i = 0; i < data.length; i++) {
				processed_json.push([ data[i].product_category1,
						data[i].buy_count ]);
			}

			$('#container2').highcharts({
				chart : {
					type : 'pie',
					options3d : {
						enabled : true,
						alpha : 45
					}
				},
				title : {
					text : ""
				},
				plotOptions : {
					pie : {
						innerSize : 100,
						depth : 45
					}
				},
				xAxis : {
					type : 'category',
					allowDecimals : false,
					title : {
						text : ""
					}
				},
				yAxis : {
					title : {
						text : "총 판매개수"
					}
				},
				series : [ {
					name : '판매개수',
					data : processed_json
				} ]
			});
		});
	});
</script>


<%-- 찜 많이한 상품 --%>
<script type="text/javascript">
	$(function() {
		var processed_json = new Array();
		$.getJSON('/chart/chart_mostLikedProducts', function(data) {
			for (i = 0; i < data.length; i++) {
				processed_json.push([ data[i].product_name,
						data[i].product_count ]);
			}

			$('#container3').highcharts({
				chart : {
					type : 'pie',
					options3d : {
						enabled : true,
						alpha : 45
					}
				},
				title : {
					text : ""

				},
				plotOptions : {
					pie : {
						innerSize : 100,
						depth : 45
					}
				},
				xAxis : {
					type : 'category',
					allowDecimals : false,
					title : {
						text : ""
					}
				},
				yAxis : {
					title : {
						text : "총 판매개수"
					}
				},
				series : [ {
					name : '♥ :',
					data : processed_json
				} ]
			});
		});
	});
</script>


<%-- 인기 키워드 --%>

<script type="text/javascript">
	$(function() {
		var processed_json = new Array();
		$.getJSON('/chart/chart_searchKeyword', function(data) {
			// Populate series
			for (i = 0; i < data.length; i++) {
				processed_json.push([ data[i].search_keyword,
						data[i].keyword_count ]);
			}

			// draw chart
			$('#container4').highcharts({
				chart : {
					type : "column"
				},
				title : {
					text : ""
				},
				xAxis : {
					type : 'category',
					allowDecimals : false,

				},
				yAxis : {
					title : {
						text : "검색 횟수"
					}
				},
				series : [ {
					name : '검색 횟수',
					data : processed_json
				} ]
			});
		});
	});
</script>
</head>
<body>
	<%--■■■■■■■■■■■■■■■■■■■■■■ top & menu ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<jsp:include page="../module/managerTop.jsp" />
	<br>
	<%--■■■■■■■■■■■■■■■■■■■■■■ contents ■■■■■■■■■■■■■■■■■■■■■■■■--%>
	<div class="container">
		<h1 class="title">통계자료</h1>
		<hr>
		<div class="tabs is-boxed is-centered">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">최다 판매 상품</li>
				<li class="tab-link" data-tab="tab-2">카테고리별</li>
				<li class="tab-link" data-tab="tab-3">찜찜찜</li>
				<li class="tab-link" data-tab="tab-4">핫키워드!!</li>
			</ul>
		</div>


		<!--  ■■■■■■■■■ 1번탭 메뉴 ■■■■■■■■■ -->
		<div id="tab-1" class="tab-content current">
			<%-- 2019최다 판매 제품 --%>
			<div id="chart_title" align="center">
				<article class="message is-dark">
					<div class="message-body" style="font-size: 18px;">
					2019년 최다 판매 제품 top 5
					</div>
				</article>
				<br>
			</div>
			<div id="container1" style="height: 400px"></div>

		</div>

		<!--  ■■■■■■■■■ 2번탭 메뉴 ■■■■■■■■■ -->
		<div id="tab-2" class="tab-content" align="center">
			<%-- 2019카테고리별 판매 수량 --%>
			<div id="chart_title" align="center">
				<article class="message is-dark">
					<div class="message-body" style="font-size: 18px;">
					2019카테고리별 판매 수량
					</div>
				</article>
				<br>
			</div>
			<div id="container2" style="height: 400px"></div>
		</div>

		<!--  ■■■■■■■■■ 3번탭 메뉴 ■■■■■■■■■ -->
		<div id="tab-3" class="tab-content">
			<%-- 가장 많이 찜한 상품 --%>
			<div id="chart_title" align="center">
				<article class="message is-dark">
					<div class="message-body" style="font-size: 18px;">
					가장 많이 찜한 상품
					</div>
				</article>
				<br>
			</div>
			<div id="container3" style="height: 400px"></div>
		</div>

		<!--  ■■■■■■■■■ 4번탭 메뉴 ■■■■■■■■■ -->
		<div id="tab-4" class="tab-content">
			<%-- 핫키워드 --%>
			<div id="chart_title" align="center">
				<article class="message is-dark">
					<div class="message-body" style="font-size: 18px;">
					인기 검색어
					</div>
				</article>
				<br>
			</div>
			<div id="container4" style="height: 400px"></div>
		</div>

	</div>

	<%-- 텝 메뉴 --%>
	<script>
		$(document).ready(function() {

			$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

		})
	</script>
	<br>

	<jsp:include page="../module/managerBottom.jsp" flush="false" />
</body>
</html>