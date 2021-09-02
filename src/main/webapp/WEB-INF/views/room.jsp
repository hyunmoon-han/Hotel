<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>객실관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	


<style>
header {
	background-color: #6DD66D;
	height: 100px;
	;
}

section {
	background-color: #FFFA82;
	height: 650px;
}

footer {
	background-color: #A814E7;
	height: 100px;
}

.main {
	display: grid;
	gap: 5px;
	grid-template-columns: 2fr 2fr 1fr;
	grid-template-rows: 400px 240px;
	background-color: #FFFA82;
}

.a {
	grid-row-start: 1;
	grid-row-end: 3;
	background-color: #FFFA82;
	margin-left: 15px;
	margin-right: 15px;
	margin-top: 25px;
}
span{
	font-size: 30px; 
	margin-left: 20px;
	cursor: pointer;
}
</style>
</head>

<body>
	
	<header>
	<p>안녕하세요!! ${loginid }님 환영합니다.</p>
		<span id="check">예약관리</span>
		<span id="room" style="text-decoration: underline;text-underline-position:under;" >객실관리</span> 
		<input id="back" type="button" value="로그아웃" style="float: right;margin-top: 30px;margin-right: 40px;">
	</header>
	<section>
		<div class="main">
			<div class="a" >
				<br>
				<h1 style="text-align: center;">객실</h1>
				<table class="table table-dark table-striped" id="tbl1">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">이름</th>
							<th scope="col">Room</th>
							<th scope="col">최대 인원</th>
							<th scope="col">가격(원)</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="room">
						<tr> 
							<td><input type="hidden" value="${room.roomcode}">
							<input type=hidden value="${room.type}">
							</td> 
							<td>${room.roomname}</td>
							<td>${room.typename}</td>
							<td>${room.howmany}</td>
							<td>${room.howmuch}</td>
						<tr>
					</c:forEach>
						
						
						
					</tbody>
				</table>
					<select id="test" size=10 style="width:350px">
						<%-- <c:forEach items="${list}" var="room">
							<option value="${room.roomcode},${room.roomname},${room.type},${room.typename},${room.howmany},${room.howmuch}"> 
							${room.roomname},${room.typename},${room.howmany},${room.howmuch}
							</option>
							
						</c:forEach> --%>
					</select>

			</div>
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
					<button id="btnAdd" type="button" class="btn btn-success">등록</button>
					<button id="btnDelete" type="button" class="btn btn-primary btn-lg"
						style="color: indigo-400;">삭제</button>
					<button id="btnEnpty" type="button" class="btn btn-warning"
						style="background-color: #FF5050;">깔끔</button>
						
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
	.on("click","#check",function(){
		location.href="/Hotel/booking";
	})
	.on("click","#back",function(){
		location.href="/Hotel/logout";
	})
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
	.on("click","#btnEnpty",function(){
		//$("#inputEmail4").val('');
		//$('#roomlist').val('Suite Room').prop('selected',true);
		//$("#validationCustom04").val('1').prop("selected",true);
		//$("#price").val('');
		$("#inputEmail4,#roomlist,#validationCustom04,#price,#roomcode").val('');
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
	})
	.on("click","#btnDelete",function(){
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
		
	})
	.on("click","#btnAdd",function(){   
		let roomname=$("#inputEmail4").val();
		let roomtype=$("#roomtype").val();
		let howmany=$("#validationCustom04").val();
		let howmuch=$("#price").val();
		//console.log(roomname,roomtype,howmany,howmuch);
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
		
		
	})
	
	
	$('#check').hover(function(){
		$(this).css("color","yellow");
	},function(){
		$(this).css("color","black");
	});
	
</script>

</html>