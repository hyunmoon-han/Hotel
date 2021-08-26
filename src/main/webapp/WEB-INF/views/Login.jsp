<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<form action="/Hotel/viewinfo" method="get">
	ID:   <input type="text" name=userid><br><br>
	PW:	  <input type="password" name=userpw><br><br>
	<input type="submit" value="확인">
	<input type="button" value="취소" onclick="cancle();">
</form>
</body>
<script >
function cancle(){
	location.href="/Hotel/"
}
</script>
</html>