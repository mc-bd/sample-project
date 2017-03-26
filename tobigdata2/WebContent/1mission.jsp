<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
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
        type: 'area'
    },
    title: {
        text: 'Your Seed Money'
    },
    subtitle: {
        text: '기간별 누적달성률'
    },
    xAxis: {
        categories: ['2016.06', '2016.08', '2016.10',  '2016.12', '2017.01', '2017.02', '2017.03'],
        tickmarkPlacement: 'on',
        title: {
            enabled: false
        }
    },
    yAxis: {
        title: {
            text: 'Percent'
        }
    },
    tooltip: {
        pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.percentage:.1f}%</b> ({point.y:,.0f} millions)<br/>',
        split: true
    },
    plotOptions: {
        area: {
            stacking: 'percent',
            lineColor: '#ffffff',
            lineWidth: 1,
            marker: {
                lineWidth: 1,
                lineColor: '#ffffff'
            }
        }
    },
    series: [{
        name: '잔여율',
        data: [90, 70, 50, 30, 20, 10, 0]
    }, {
        name: '누적률',
        data: [10, 30, 50, 70, 80, 90, 100]
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