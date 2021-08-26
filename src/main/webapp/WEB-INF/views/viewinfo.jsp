<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Success/title></title>
</head>
<body>
<h1>안녕하세요!! ${userid}님 환영합니다.</h1>
<input type="button" value="홈" onclick="cancle()">
</body>
<script >
function cancle(){
	location.href="/Hotel/"
}
</script>
</html>