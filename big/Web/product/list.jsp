<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- 자바코드는 jsp에 쓰지말고, 대신 el, jstl 쓰자 -->
<!-- el은 그냥 써도 ok-->
<!-- 이제부터 jstl 쓸거야!!!!! --> <!-- foreach, choosewhen, otherwise -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 사진크기 줄이기 위한 CSS 삽입-->
<style>
#plist > h5 > img{
	width:80px;
	border:2px solid blue;
}
</style>
<div id="plist"></div>

<div>
<h1>Product Search Page</h1> 
<c:forEach var = "p" items = "${plist}">
<img src="img/${p.img }">

<h5>
<a href="product.big?db=detail&id=${p.id}">${p.id } ${p.name } ${p.price }</a>
</h5>
</c:forEach>
</div>