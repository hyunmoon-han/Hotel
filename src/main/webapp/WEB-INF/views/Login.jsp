<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
</head>
<style>
body,html{
	margin: auto; /* 화면 축소시 스크롤 방지 */
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
#uu{
	position: relative;
}
#uu i{
	position: absolute;
	left: 266px;
	top: 5px;
}
#uu .lo{
	position: absolute;
	left: 267px;
	top: 48px;
}	

</style>
<body>
<div id="content">
<h1>LOGIN</h1>
<form action="/Hotel/check_user" method="post">
	<div id="uu">ID:&nbsp;&nbsp; <input id="userid" type="text" name=userid><i class="fas fa-user-ninja"></i><br><br>
		PW:&nbsp;&nbsp;<input id="userpw" type="password" name=userpw ><i class="fas fa-lock lo"></i>
	</div><br><br>
</form>
	<input type="button" value="확인" id="go">
	<input type="button" value="회원가입" id="ss">
	<input type="button" value="취소" id="cc">
	<%-- <input type="hidden" id="ac" value="${ac}"> --%>
</div>	
</body>
<script>
$(document)
.ready(function(){
	/* if($("#ac").val()=="0"){
		alert("등록되지 않은 정보입니다.");
		$("#ac").val('');
	} */
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
	pstr=$.trim($("input[name=userpw]").val());
	$('input[name=userpw]').val(pstr);
	
	if($('input[name=userid]').val()==''){
		alert("로그인 아이디를 입력하세요. ");
		return false;
	}
	if($('input[name=userpw]').val()==''){
		alert("비밀번호를 입력하세요. ");
		return false;
	}//ajax로 등록된 아이디 검열
	 $.post("http://localhost:8080/Hotel/check_user2",
	{userid:$('input[name=userid]').val(),userpw:$('input[name=userpw]').val()},
	function(result){
		 if(result=="0"){
				alert("등록되지 않은 정보입니다.");
				$('input[name=userid]').val('');
				$('input[name=userpw]').val('');
				return false;
		 }else{
			 //로그인 아이디 있을시 ----ajax는 redirect 사용 못해서 사용
			 alert("회원 인증에 성공하셨습니다.");
			 $('form').submit();
		 }
	},"text"); 
})

</script>
</html>