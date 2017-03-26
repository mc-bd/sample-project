<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
/* Global CSS */
*{
	margin:0;
	padding:0;
}
a{
	text-decoration: none;
}
ul,ol{
	list-style: none;
}

/* Header CSS */
header{
	width: 920px;
	height: 150px;
	margin: 0 auto;
	background: red;
}
/* Nav CSS */
nav{
	width: 800px;
	height: 20px;
	margin: 0 auto;
	background: blue;
}
nav > a{
	color: white;
}
/* Section CSS */
section {
	width: 800px;
	min-height: 350px;
	margin: 0 auto;
	background: grey;
}
/* Footer CSS */
footer {
	width: 800px;
	height: 40px;
	margin: 0 auto;
	background: black;
}
</style>
</head>
<body>
<!-- Header -->
<header>
<c:choose>
	<c:when test="${loginuser == null }"> <!-- �α��ξ������� �Ʒ� �Ѹ��� -->
	<div id="top">	
		<a href="main.big?view=login">LOGIN</a>				<!-- ?�� ��ɾ��� �ù���. DispatcherServlet.java���� ���� -->
		<a href="main.big?view=register">REGISTER</a>
	</div>
	<div id="bottom">
		<a href="main.big?view=cust">CUST</a>
		<a href="main.big?view=product">PRODUCT</a>
	</div>
	</c:when>
	<c:otherwise>							<!-- �α��������� �Ʒ� �Ѹ��� -->
		<div id="top">	
		<a href="">${loginuser.id }��</a>				<!-- ?�� ��ɾ��� �ù���. DispatcherServlet.java���� ���� -->
		<a href="login.big">LOGOUT</a>
	</div>
	<div id="bottom">
		<a href="main.big?view=cust">CUST</a>
		<a href="main.big?view=product">PRODUCT</a>
		<a href="main.big?view=rgraph">RGraph</a>
		<a href="main.big?view=highcharts">HighCharts</a>
		<a href="main.big?view=weather">Weather</a>
	</div>
	</c:otherwise>
</c:choose>
</header> <!-- HTML5���� div�� ���� -->
<!-- Nav -->
<nav>
<c:choose>
	<c:when test="${nav == null }">
		<a href="main.big">HOME</a>					<!-- �Ķ� Navi������ HOME�� ���콺 �÷��� ��, �ϴ� url�� �ߴ� ���� -->
	</c:when>
	<c:otherwise>
		${nav }										<!-- nav�� �������� �������? ���� ���·� �������� el��� -->
	</c:otherwise>
</c:choose>
</nav>
<!-- Section -->
<section>
<c:choose>
	<c:when test="${center == null }">				<!-- �ڹ� �Ⱦ���? $�Ἥ �������� ��. jspl, el -->
		<jsp:include page="center.jsp"/>			<!-- ���Ϳ� �ƹ��͵� ������ center.jsp�� �ѷ��ش� -->
	</c:when>
	<c:otherwise>
		<jsp:include page="${center }.jsp"/>		<!-- ���Ϳ� �α��� ���� �α���jsp �ѷ��ְ�, �������� ���� ��������jsp �ѷ��ش� -->
	</c:otherwise>
</c:choose>
</section>
<!-- Footer -->
<footer></footer>
</body>
</html>