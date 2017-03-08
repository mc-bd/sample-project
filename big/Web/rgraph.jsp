<%@page import="com.sun.org.apache.xml.internal.security.utils.Base64"%>
<%@page import="com.hive.Word"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	Word w = new Word();
%>

    
<div>
<h1>R Graph</h1>
<img src="data:image/jpeg;base64,<%=Base64.encode(w.getGraph())%>">
</div>