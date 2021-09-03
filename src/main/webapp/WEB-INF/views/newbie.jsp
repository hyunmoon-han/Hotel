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
<form action="/Hotel/signin" method="post">
	성명: <input type="text" name=name><br><br>
	ID:  <input type="text" name=userid><br><br>
	비밀번호: <input type="password" name=pw id=pw1><br><br>
	비밀번호 확인:  <input type="password" id=pw2><br><br>
	<input type="button" value="회원가입" id="mit">
	<input type="reset">
	<input type="button" value="홈" id="cancle">
	
</form>
<select size=10 style="width:250px">
</select>
</body>
<script>
$(document)
.on("click","#mit",function(){
	if($("input[name=name]").val()==''){
		alert("이름을 입력하세요");
		return false;
	}
	if($("input[name=userid]").val()==''){
		alert("아이디를 입력하세요.");
		return false;
	}
	if($("input[name=pw]").val()==''){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	k=$("#pw1").val();
	s=$("#pw2").val();
	if(k==s){
		$("form").submit();
		alert("회원가입이 완료되었습니다.");
		return true;
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