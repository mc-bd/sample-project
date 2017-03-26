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
            ['�ְ�/����/����', 5],
            ['����/����', 2],
            ['���', 2],
            
            ['��Ȱ��ǰ/���缭��', 1],
            ['�ܽ�', 3],
            ['�ķ�ǰ', 1],
            ['ī��', 1],
            ['��/���/����', 1],
            
            ['����/����', 3],
            ['�Ƿ�/�ǰ�', 1],
           
            ['�Ƿ�/�Ź�', 1],
            ['��Ƽ/�̿�', 1],
            ['�н�/����', 3],
            ['��ȭ/����', 2],
            ['������/����', 1],
            ['����/����', 1]
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