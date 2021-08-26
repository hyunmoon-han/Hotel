<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<html>
<head>
	<title>Hotal</title>
</head>
<style>
td{
	width:50px;
	height:50px;
}
</style>
<body>
<h1>Hotal Moon </h1>
<P>  The time on the server is ${serverTime}. </P>
<a href="selected?path=login">로그인 </a><br>

<a href="selected?path=newbie">회원가입</a>
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
