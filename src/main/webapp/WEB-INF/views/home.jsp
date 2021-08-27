<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<html>
<head>
	<title>Hotel</title>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
td{
	width:50px;
	height:50px;
}
</style>
<body>
	
<h1>Hotel Moon </h1>
<p>안녕하세요!! ${HK}님 환영합니다.</p>
<P>  The time on the server is ${serverTime}. </P>
<a href="/Hotel/login">로그인 </a><br>
<a href="/Hotel/newbie">회원가입</a>
<table border=1>
<%!int k=1; %>
<%
for(int i=0;i<5;i++){
	out.println("<tr>");
	for(int j=0;j<5;j++){
		out.println("<td>"+k+"</td>");
		k=k+1;
	}
	out.println("</tr>");
}
%>

</table>
</body>

</html>
