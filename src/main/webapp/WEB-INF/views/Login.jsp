<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<%
	String q=(String)session.getAttribute("HK") ;
		out.println(q);
	%>
<p>안녕하세요!! ${loginid }님 환영합니다.</p>
<p>안녕하세요!! ${HK }님 환영합니다.</p>
<form action="/Hotel/check_user" method="post">
	ID:   <input type="text" name=userid><br><br>
	PW:	  <input type="password" name=userpw><br><br>
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="cancle();">
	<input type="button" value="회원가입" id="ss">
	
</form>
</body>
<script >
function cancle(){
	location.href="/Hotel/"
}
$(document)
.on("click","#ss",function(){
	location.href="/Hotel/newbie"
})
</script>
</html>