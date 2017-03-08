<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

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
        type: 'column'
    },
    title: {
        text: 'Browser market shares. January, 2015 to May, 2015'
    },
    subtitle: {
        text: 'Click the columns to view versions. Source: <a href="http://netmarketshare.com">netmarketshare.com</a>.'
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: 'Total percent market share'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.1f}%'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
    },

    series: [{
        name: 'Brands',
        colorByPoint: true,
        data: serverdata
        }]
});
		
		//End HighCharts ...
		
	};
	$.ajax({
		url:'hive',
		dataType:'json',
		success:function(data){
			//alert(data);
			display (data);
			
		}
	});
});
</script>


<div>
<h1>HighCharts Graph</h1>
<div id="container"></div>
</div>