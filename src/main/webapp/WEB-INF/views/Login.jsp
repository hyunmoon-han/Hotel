<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<style>
body,html{
	margin: auto; /* 화면 축소시 스크롤 방지 */
	background: lightblue; 
	background-image: url("./resources/img/Hotel.jpg") ;
	background-repeat:no-repeat; 
    background-size:cover;
    height: 100%;
    width:100%;
    background-position: center center; 
}

#content{
	position: absolute; left: 50%; top: 50%; 
  	transform: translate(-50%, -50%); text-align: center;
 	 /* 이하 꾸밈 설정 */
  	background: white; 
    min-width: 350px; border-radius: 50%; 
    padding-top: 40px; padding-bottom: 40px;
    opacity: 0.7;
}

	

</style>
<body>
<div id="content">
<h1>LOGIN</h1>
<form action="/Hotel/check_user" method="post">
	ID:&nbsp;&nbsp; <input id="userid" type="text" name=userid><br><br>
	PW:&nbsp;&nbsp;	<input id="userpw" type="password" name=userpw><br><br>
	
</form>
	<input type="button" value="확인" id="go">
	<input type="button" value="회원가입" id="ss">
	<input type="button" value="취소" id="cc">
	<input type="hidden" id="ac" value="${ac}">
</div>	
</body>
<script>
$(document)
.ready(function(){
	if($("#ac").val()=="0"){
		alert("등록되지 않은 정보입니다.");
		$("#ac").val('');
	}
})
.on("click","#ss",function(){
	location.href="/Hotel/newbie"
})
.on("click","#cc",function(){
	location.href="/Hotel/"
})
.on("click","#go",function(){

	let pstr=$.trim($("input[name=userid]").val());
	$('input[name=userid]').val(pstr);
	pstr=$.trim($("input[name=password]").val());
	$('input[name=password]').val(pstr);
	
	if($('input[name=userid]').val()==''){
		alert("로그인 아이디를 입력하세요. ");
		return false;
	}
	if($('input[name=password]').val()==''){
		alert("비밀번호를 입력하세요. ");
		return false;
	}
	$('form').submit();
})
/* 	/* let userid=$("#userid").val();
	let userpw=$("#userpw").val();
	$.post(
		"http://localhost:8080/Hotel/check",
		{loginid:userid,passcode:userpw},
		function(result){
			/* if(result=='success'){
				$('form').submit();
				alert("로그인에 성공했습니다.");
			} 
				console.log(result);
		},"text"); */


</script>
</html>