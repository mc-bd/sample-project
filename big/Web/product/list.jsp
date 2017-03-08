<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- �ڹ��ڵ�� jsp�� ��������, ��� el, jstl ���� -->
<!-- el�� �׳� �ᵵ ok-->
<!-- �������� jstl ���ž�!!!!! --> <!-- foreach, choosewhen, otherwise -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ����ũ�� ���̱� ���� CSS ����-->
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