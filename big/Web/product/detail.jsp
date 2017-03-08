<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div>
<h1>Product Detail Page</h1> 
<img src="img/${detailproduct.img }">
<h2>ID: ${detailproduct.id }</h2>
<h2>NAME: ${detailproduct.name }</h2>
<h2>PRICE: ${detailproduct.price }</h2>
<h2>REGDATE: ${detailproduct.regdate }</h2>
<h3><a href="product.big?db=delete&id=${detailproduct.id }">DELETE</a></h3>
<h3><a href="product.big?db=updateview&id=${detailproduct.id }">UPDATE</a></h3>
</div>