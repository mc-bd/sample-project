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
	<c:when test="${loginuser == null }"> <!-- 로그인안했으면 아래 뿌리고 -->
	<div id="top">	
		<a href="main.big?view=login">LOGIN</a>				<!-- ?은 명령어의 시발점. DispatcherServlet.java에서 봐봐 -->
		<a href="main.big?view=register">REGISTER</a>
	</div>
	<div id="bottom">
		<a href="main.big?view=cust">CUST</a>
		<a href="main.big?view=product">PRODUCT</a>
	</div>
	</c:when>
	<c:otherwise>							<!-- 로그인했으면 아래 뿌리고 -->
		<div id="top">	
		<a href="">${loginuser.id }님</a>				<!-- ?은 명령어의 시발점. DispatcherServlet.java에서 봐봐 -->
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
</header> <!-- HTML5에서 div와 동일 -->
<!-- Nav -->
<nav>
<c:choose>
	<c:when test="${nav == null }">
		<a href="main.big">HOME</a>					<!-- 파랑 Navi구간의 HOME에 마우스 올렸을 때, 하단 url에 뜨는 내용 -->
	</c:when>
	<c:otherwise>
		${nav }										<!-- nav는 서블릿에서 만들었지? 저런 형태로 가져오는 el기능 -->
	</c:otherwise>
</c:choose>
</nav>
<!-- Section -->
<section>
<c:choose>
	<c:when test="${center == null }">				<!-- 자바 안쓴다? $써서 가져오면 되. jspl, el -->
		<jsp:include page="center.jsp"/>			<!-- 센터에 아무것도 없으면 center.jsp를 뿌려준다 -->
	</c:when>
	<c:otherwise>
		<jsp:include page="${center }.jsp"/>		<!-- 센터에 로그인 있음 로그인jsp 뿌려주고, 레지스터 있음 레지스터jsp 뿌려준다 -->
	</c:otherwise>
</c:choose>
</section>
<!-- Footer -->
<footer></footer>
</body>
</html>