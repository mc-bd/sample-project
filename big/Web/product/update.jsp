<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div>
<h1>Product Update Page</h1> 


<!-- 화면의 데이터를 서버로 전송하쟈~ 1)form 2)ajax -->

<form method="POST" 
action="product.big?db=update"
enctype="multipart/form-data">

<h2>ID: ${updateproduct.id }</h2>
<input type="hidden" name="id" value="${updateproduct.id }">

<h2>NAME: <input type="text" name="name" value="${updateproduct.name}"></h2>

<h2>PRICE: <input type="number" name="price" value="${updateproduct.price}"></h2>

<h2>REGDATE: ${updateproduct.regdate }</h2>
<h2><input type="file" name="newimg"></h2>
<input type="hidden" name="img" value="${updateproduct.img }">
<input type="submit" value="수정">


</form>
</div>