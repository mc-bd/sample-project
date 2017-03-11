<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
<style>
.wp{
    float:left;           <!-- 좌정렬하라 -->
}
#cw{
    width:300px;
    height:300px;
    border:1px solid black;
}
#fw{
    width:300px;
    height:300px;
    border:1px solid black;
}
#map{
    width:300px;
    height:300px;
    border:1px solid black;
}
</style>
<script>
$(document).ready(function(){ //페이지 업로드되면 함수 실행
    function cw(data){
        var city = 
        $(data).find('yweather\\:location,location').attr('city');
        var country = 
        $(data).find('yweather\\:location,location').attr('country');
        var date = 
        $(data).find('yweather\\:condition,condition').attr('date');
        var temp = 
        $(data).find('yweather\\:condition,condition').attr('temp');
        var text = 
        $(data).find('yweather\\:condition,condition').attr('text');
        var code = 
        $(data).find('yweather\\:condition,condition').attr('code');
            
        var output = '';
        output += '<h2>'+country+'</h2>';
        output += '<h3>'+city+'</h3>';
        output += '<h3>'+date+'</h3>';
        output += '<h3>'+temp+'</h3>';
        output += '<h3>'+text+'</h3>';
        output += 
        '<img src="http://l.yimg.com/a/i/us/we/52/'+code+'.gif"/>';
        $('#cw').html(output);
    };
    function fw(data){
        var output = '';
        var fw = $(data).find('yweather\\:forecast,forecast')
        $(fw).each(function(){
            var code = $(this).attr('code');
            var date = $(this).attr('date');
            var day = $(this).attr('day');
            var low = $(this).attr('low');
            var high = $(this).attr('high');
            var text = $(this).attr('text');
            output += '<p>';
            output += date+' '+day+' '+low+' '+high+' '+text;
            output += '</p>';
        });
        $('#fw').html(output);
    };
    function map(data){
        var lat = $(data).find('geo\\:lat,lat').text();
        var long = $(data).find('geo\\:long,long').text();
        var center = 
            new google.maps.LatLng(lat,long);
        var map = 
            new google.maps.Map(
                document.querySelector("#map"),
                {
                    zoom:12,
                    center:center
                }
            );
    };
    
    function requestWeather(){
        url='weather';					//요청한다
        $.ajax({						
            url:url,
            dataType:'xml',
            success:function(data){		//아래처럼 뿌린다
                cw(data);
                fw(data);
                map(data);
            }
        });    
    };
    requestWeather();
    
});
</script>


<div>
<h1>Weather Page</h1>
<div id="cw" class="wp"></div>
<div id="fw" class="wp"></div>
<div id="map" class="wp"></div>
</div>