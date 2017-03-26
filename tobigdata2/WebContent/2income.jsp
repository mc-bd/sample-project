<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<div id="container" style="height: 400px"></div>

<style>
#container{
	min-width: 310px;
	height: 400px;
	margin: 0 auto;
}
</style>
<script>
$(document).ready(function(){
	function display(serverdata){
		
		// Start HighCharts ...
		
Highcharts.chart('container', {
    chart: {
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 15,
            beta: 15,
            viewDistance: 25,
            depth: 40
        }
    },

    title: {
        text: 'INCOME'
    },

    xAxis: {
        categories: ['2016.11', '2016.12', '2017.01', '2017.02', '2017.03']
    },

    yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
            text: 'Total Income Monthly'
        }
    },

    tooltip: {
        headerFormat: '<b>{point.key}</b><br>',
        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
    },

    plotOptions: {
        column: {
            stacking: 'normal',
            depth: 40
        }
    },

    series: [{
        name: '근로소득',
        data: [5, 5, 5, 5, 5],
        stack: 'male'
    }, {
        name: '이자소득',
        data: [0.01, 0.01, 0.01, 0.01, 0.01],
        stack: 'female'
    }]
});
		
		//End HighCharts ...
		
	};
	
	display ('');
// 	$.ajax({
// 		url:'mission',
// 		dataType:'json',
// 		success:function(data){
// 			display (data);
// 		}
// 	});
});
</script>
</head>
<body>
<h1>HighCharts Sample</h1>
<div id="container"></div>

</body>
</html>