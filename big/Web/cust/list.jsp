<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- �ڹ��ڵ�� jsp�� ��������, ��� el, jstl ���� -->
<!-- el�� �׳� �ᵵ ok-->
<!-- �������� jstl ���ž�!!!!! --> <!-- foreach, choosewhen, otherwise -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div>
<h1>Cust Search Page</h1> 

<c:forEach var = "user" items = "${custlist }"> <!-- for�� ������, custlist ����ü�� �ϳ��� �������, �̸��� user�� ������ �´� -->
<h4><a href="cust.big?db=detail&id=${user.id }">${user.id }  ${user.name }</a></h4>                     <!-- �ѷ��ش� -->
</c:forEach>
</div>