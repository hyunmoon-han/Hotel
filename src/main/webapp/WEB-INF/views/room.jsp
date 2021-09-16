<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>객실관리</title>
<!-- 구글 폰트 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<!-- 제이쿼리 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
body,html{
	margin: auto; /* 화면 축소시 스크롤 방지 */
	background: lightblue; 
	background-repeat:no-repeat; 
    background-size:cover;
    height: 100%;
    width:100%;
    background-position: center center;
    font-family: 'Jua', sans-serif;
	font-family: 'Nanum Pen Script', cursive;
	font-size: 18px; 
}
header {
	background-color: #f2e3c4;
	height: 10%;
	opacity: 0.9;
}

section {
	background-color:white;
	height: 80%;
}

footer {
	background-color: #f2e3c4;
	height: 10%;
}

.main {
	display: grid;
	gap: 5px;
	grid-template-columns: 2fr 2fr 1fr;
	grid-template-rows: 400px 240px;
	background-color: white;
}

.a {
	grid-row-start: 1;
	grid-row-end: 3;
	background-color: white;
	margin-left: 15px;
	margin-right: 15px;
	margin-top: -20px;
	height: 400px;
}
span{
	font-size: 32px;
	margin-left: 20px;
	cursor: pointer;
}
select{
	cursor: pointer;
	font-size: 23px
}
</style>
</head>
<body>
	<header>
	<br>
		<span id="check">예약관리</span>
		<span id="room" style="text-decoration: underline;text-underline-position:under;" >객실관리</span>
		<span style="text-align: center;position: absolute; left: 40%; top: 0px;font-size: 50px">1854<br>
		<span style="font-size: 28px;position: absolute;top: 37px;left: -13px;">Hotel</span></span>
		<div style="float: right; position: relative;right: 70px;">
			<%
			String q=(String)session.getAttribute("loginid") ;
				out.println("안녕하세요."+q+"님 환영합니다!!");
			%>
			<input id="back" type="button" value="로그아웃" style="margin-right: 40px;position: relative;left:30px ;">
		</div> 
	</header>
	<section>
		<div class="main">
		<!-- 등록된 객실 목록 -->
			<div class="a" >
				<br>
				<h1 style="margin-left:100px">객실</h1>
					<select id="test" size="15" style="width:350px ;text-align: center;">
						<option>객실    room   최대인원   가격(원)</option> 
						<option>-----------------------------------------</option>
					</select>
			</div>
			<!-- 입력정보 -->
			<div class="b">
				<br>
				<div class="col-md-8" style="margin-left: 158px;">
					<label for="inputEmail4" class="form-label"
						style="margin-left: 113px;">객실 이름:</label> 
						<input type="text"class="form-control" id="inputEmail4">
				</div>
				<br> <label for="room" style="margin-left: 270px;">객실 분류:</label> 
				<select id="roomlist" class="form-select" size="7" style="margin-left: 90px;">
					<c:forEach items="${type}" var="type">
						<option value="${type.typecode}">${type.typename}</option>
					</c:forEach>>
					
				</select> <br>
				<br>
				<div class="col-md-3 input-group" style="margin-left: 110px;">
					<label for="validationCustom04" class="form-label">숙박 최대
						인원:</label> <select class="form-select" id="validationCustom04"
						style="margin-right: 150px; margin-left: 9px;">
						<option value="1" selected>1명</option>
						<option value="2">2명</option>
						<option value="3">3명</option>
						<option value="4">4명</option>
						<option value="5">5명</option>
						<option value="6">6명</option>
						<option value="7">7명</option>
						<option value="8">8명</option>
						<option value="9">9명</option>
						<option value="10">10명</option>
						
					</select>
				</div>
				<br>
			</div>
			<div class="c"></div>
			<div class="d">
				<br>
				<div class="col-md-5 input-group" style="margin-left: 140px;">
					1박 요금(원):<input id="price" type="text" class="form-control" placeholder="3000천만원"
						aria-label="First name"
						style="margin-right: 180px; margin-left: 7px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
				<div style="padding-left: 190px; margin-top: 30px;">
					<button id="btnAdd" type="button" class="btn btn-success" style="width:65px">등록</button>
					<button id="btnDelete" type="button" class="btn btn-danger"
						style="color: indigo-400;" disabled>삭제</button>
					<button id="btnEnpty" type="button" class="btn btn-warning">초기화</button>
				</div>
			</div>
			<div class="e"></div>
			<input type="hidden" value="" id="roomcode">
			<input type="hidden" value="" id="roomtype">
			<div class="f"></div>
		</div>

	</section>
	<footer>
		<h1 style="text-align: center; color: #FF9100;">MOON</h1>
		
	</footer>

</body>
<script>
	$(document)
	//페이지 로드시 객실목록 리스트 출력
	.ready(function(){
		  $.post(
				"http://localhost:8080/Hotel/RoomType2",
				{},
				function(result){
					console.log(result);
					/* <option value="${room.roomcode},${room.roomname},${room.type},${room.typename},${room.howmany},${room.howmuch}"> 
					${room.roomname},${room.typename},${room.howmany},${room.howmuch}
					</option> */
					 $.each(result,function(k,v){
						 str='<option value="'+v.roomcode+','+v.roomname+','+v.type+','+v.typename+','+v.howmany+','+v.howmuch+'">'
						 +v.roomname+','+v.typename+','+v.howmany+','+v.howmuch+'</option>';
						 $("#test").append(str);
					}) 
					
				},
				"json");  
	})
	//예약관리 페이지 이동
	.on("click","#check",function(){
		location.href="/Hotel/booking";
	})
	//로그아웃 클릭시 로그인 페이지로 이동
	.on("click","#back",function(){
		k=confirm("로그아웃 하시겠습니까?")
		if(k){
			location.href = "/Hotel/logout";
		}else{
			return false;
		}
	})
	//테이플 클릭시 정보값 이동
	.on("click","#tbl1 tr",function(){
		$(this).each(function(){
			name=$(this).find("td:eq(1)").text();
			num=$(this).find("td:eq(3)").text();
			price=$(this).find("td:eq(4)").text();
			//roomcode=$(this).find("td:eq(0)").text();
			//roomcode는 pk 값
			roomcode=$(this).find('input:eq(0)').val();
			type=$(this).find('input:eq(1)').val();
			
		})
		$("#inputEmail4").val(name);
			
		$("#roomlist").val(type).prop("selected",true);
		
		$("#validationCustom04").val(num).prop("selected",true);
		$("#price").val(price);
		$("#roomcode").val(roomcode);//roomcode	//디버깅용
		$("#roomtype").val(type);
	})
	.on("click","#roomlist",function(){
		k=$("#roomlist").val();
		$("#roomtype").val(k);
	})
	// 초기화 버튼 클리깃 정보값 초기화
	.on("click","#btnEnpty",function(){
		//$("#inputEmail4").val('');
		//$('#roomlist').val('Suite Room').prop('selected',true);
		//$("#validationCustom04").val('1').prop("selected",true);
		//$("#price").val('');
		k=confirm("입력을 초기화 하시겠습니까?");
		if(k){
			$("#inputEmail4,#roomlist,#validationCustom04,#price,#roomcode,#roomtype").val('');	
		}else{
			return false;
		}
		
	})
	//select 값이동
	.on("click","#test option",function(){
		k=$(this).val().split(",");
		$("#inputEmail4").val(k[1]);
		$('#roomlist').val(k[2]).prop('selected',true);
		$("#validationCustom04").val(k[4]).prop("selected",true);
		$("#price").val(k[5]);
		$("#roomcode").val(k[0]);
		$("#roomtype").val(k[2]);
		$("#btnDelete").attr("disabled",false);
	})
	//해당 객실 삭제처리버튼
	.on("click","#btnDelete",function(){
		if($("#inputEmail4").val()==''||$("#roomlist").val()==''||
				$("#validationCustom04").val()==''||$("#price").val()==''){
			alert("빈 정보값이 존재합니다.");
			console.log("1="+$("#inputEmail4").val()+"2="+$("#roomlist").val()+"3="+$("#validationCustom04").val()+"4="+$("#price").val());
			return false;
		}else{
			k=confirm('정말로 삭제 하시겠니까?')
			if(k==true){
				$.post("http://localhost:8080/Hotel/deleteRoom",{roomcode:$("#roomcode").val()},
						function(result){
							console.log(result);
							$("#btnEnpty").trigger('click');//입력난 비우기
							$("#test option:selected").remove();//지우기
							$("#tbl1 tr").each(function(){
								c=$(this).find('input:eq(0)').val();
								if(c==$("#roomcode").val()){
									$(this).remove();
								}
							})
							location.reload();
							
						},"text");
			}else{
				return false;
			}
		}
		
		
	})
	//새로운 객실 추가 버튼
	.on("click","#btnAdd",function(){
		if($("#inputEmail4").val()==''||$("#roomlist").val()==''||
				$("#validationCustom04").val()==''||$("#price").val()==''){
			alert("빈 정보값이 존재합니다.");
			console.log("1="+$("#inputEmail4").val()+"2="+$("#roomlist").val()+"3="+$("#validationCustom04").val()+"4="+$("#price").val());
			return false;
		}
		let roomname=$("#inputEmail4").val();
		let roomtype=$("#roomtype").val();
		let howmany=$("#validationCustom04").val();
		let howmuch=$("#price").val();
		console.log(roomname,roomtype,howmany,howmuch);
		let roomcode=$("#roomcode").val();
		//console.log('코드'+roomcode);
		k=confirm("추가 및 변경하시겠니까?");
		if(k==true){//확인코드
			if(roomcode==''){//insert
				$.post("http://localhost:8080/Hotel/addRoom",
						{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
						function(result){
							 if(result=="ok"){
								location.reload();
							} 
							console.log(result);
						},"text");
			}else{//update
				$.post("http://localhost:8080/Hotel/updateRoom",
						{roomcode:roomcode,roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
						function(result){
							if(result=="ok"){
								location.reload();
							}
						},"text");
			}
		}else{
			return false;
		}
		$("#btnEnpty").trigger('click');
		
	})
	$('#check').hover(function(){
		$(this).css("color","yellow");
	},function(){
		$(this).css("color","black");
	});
	
</script>

</html>