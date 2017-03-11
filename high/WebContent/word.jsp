<%@page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<%@page import="com.hive.Word"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Word w = new Word();
%>


<!DOCTYPE>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style></style>
</head>
<body>
<h1>Wordcloud test</h1>
<img src="data:image/jpeg;base64,<%=Base64.encode(w.getGraph())%>">
</body>
</html>