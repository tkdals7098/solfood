<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(function () {
    var processed_json = new Array();   
    $.getJSON('/chart/chart_mostLikedProducts', function(data) {
        for (i = 0; i <data.length; i++){
            processed_json.push([data[i].product_id, data[i].COUNT]);
        }
     
        $('#container3').highcharts({
        	chart: {
                type: 'packedbubble',
                height: '100%'
            },
            title: {
                text: '찜이 가장 많은 상품'
            },
            tooltip: {
                useHTML: true,
                pointFormat: '<b>{point.name}:</b> {point.value}m CO<sub>2</sub>'
            },
            plotOptions: {
                packedbubble: {
                    minSize: '20%',
                    maxSize: '100%',
                    zMin: 0,
                    zMax: 1000,
                    layoutAlgorithm: {
                        gravitationalConstant: 0.05,
                        splitSeries: true,
                        seriesInteraction: false,
                        dragBetweenSeries: true,
                        parentNodeLimit: true
                    },
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}',
                        filter: {
                            property: 'y',
                            operator: '>',
                            value: 250
                        },
                        style: {
                            color: 'black',
                            textOutline: 'none',
                            fontWeight: 'normal'
                        }
                    }
                }
            },
            series: [{
            	name: '판매개수',
                data: processed_json
            }]
        }]
    });
</script>

</body>
</html>