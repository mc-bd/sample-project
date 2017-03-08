<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!-- 자바코드는 jsp에 쓰지말고, 대신 el, jstl 쓰자 -->
<!-- el은 그냥 써도 ok-->
<!-- 이제부터 jstl 쓸거야!!!!! --> <!-- foreach, choosewhen, otherwise -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div>
<h1>Cust Search Page</h1> 

<c:forEach var = "user" items = "${custlist }"> <!-- for문 돌려서, custlist 집합체를 하나씩 끄집어내서, 이름을 user로 가지고 온다 -->
<h4><a href="cust.big?db=detail&id=${user.id }">${user.id }  ${user.name }</a></h4>                     <!-- 뿌려준다 -->
</c:forEach>
</div>