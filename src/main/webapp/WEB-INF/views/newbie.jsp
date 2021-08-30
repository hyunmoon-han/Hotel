<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>
<form action="/Hotel/login2" method="post">
	성명: <input type="text" name=name><br><br>
	ID:  <input type="text" name=userid><br><br>
	비밀번호: <input type="password" name=pw id=pw1><br><br>
	비밀번호 확인:  <input type="password" id=pw2><br><br>
	모바일번호:    <input type="text" name=mobile><br><br>
	<input type="button" value="등록" id="mit">
	<input type="button" value="취소" id="cancle">
	
	<input type="reset">
</form>
<select size=10 style="width:250px">
	<c:forEach items="${list}" var="room">
		<option> ${room.roomcode},${room.name},${room.type},${room.howmany},${room.howmuch}</option>
	</c:forEach>
</select>
</body>
<script>
$(document)
.on("click","#mit",function(){
	k=$("#pw1").val();
	s=$("#pw2").val();
	if(k==s){
		$("form").submit();
		return false;
	}else{
		alert("비밀번호가 같지 않습니다.");
		return false;
	}
})
.on("click","#cancle",function(){
	location.href="/Hotel/login"
})
</script>
</html>