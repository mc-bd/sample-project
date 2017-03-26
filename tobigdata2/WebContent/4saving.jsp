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
        type: 'pie',
        options3d: {
            enabled: true,
            alpha: 45
        }
    },
    title: {
        text: 'SPEND'
    },
    subtitle: {
        text: 'Monthly Spend Categories in Detail'
    },
    plotOptions: {
        pie: {
            innerSize: 100,
            depth: 45
        }
    },
    series: [{
        name: 'Delivered amount',
        data: [
            ['주거/수도/광열', 5],
            ['교통/차량', 2],
            ['통신', 2],
            
            ['생활용품/가사서비스', 1],
            ['외식', 3],
            ['식료품', 1],
            ['카페', 1],
            ['술/담배/유흥', 1],
            
            ['금융/보험', 3],
            ['의료/건강', 1],
           
            ['의류/신발', 1],
            ['뷰티/미용', 1],
            ['학습/교육', 3],
            ['문화/예술', 2],
            ['스포츠/레져', 1],
            ['여행/숙박', 1]
        ]
    }]
});
		
		//End HighCharts ...
		
	};
	$.ajax({
		url:'mission',
		dataType:'json',
		success:function(data){
			display (data);
		}
	});
});
</script>
</head>
<body>
<h1>HighCharts Sample</h1>
<div id="container"></div>

</body>
</html>