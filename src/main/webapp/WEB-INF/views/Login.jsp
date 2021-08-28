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
<h1>로그인 페이지</h1>
<form action="/Hotel/check_user" method="post">
	ID:&nbsp;&nbsp; <input type="text" name=userid><br><br>
	PW:&nbsp;&nbsp;	<input type="password" name=userpw><br><br>
	<input type="submit" value="확인">
	<input type="button" value="취소" id="cc">
	<input type="button" value="회원가입" id="ss">
</form>
</body>
<script>
$(document)
.on("click","#ss",function(){
	location.href="/Hotel/newbie"
})
.on("click","#cc",function(){
	location.href="/Hotel"
})
</script>
</html>