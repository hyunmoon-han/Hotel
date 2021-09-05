<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
body,html{
	margin: auto; /* 화면 축소시 스크롤 방지 */
	background: lightblue; 
	
	background-repeat:no-repeat; 
    background-size:cover;
    height: 100%;
    width:100%;
    background-position: center center; 
}
header {
	 background-color: #6DD66D; 
	height: 10%;
	opacity: 0.9;
}

section {
	 background-color: #FFFA82; 
	 height: 80%;
}

footer {
	 background-color: #A814E7; 
	 height: 10%; 
}

.main {
	display: grid;
	gap: 5px;
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 150px 490px;
	/* background-color: #FFFA82; */
	opacity: 0.8;
}
span{
	cursor:pointer;
	font-size: 30px;
	margin-left: 20px;
}

</style>
</head>

<body>
	<header>
	<%
	String q=(String)session.getAttribute("loginid") ;
		out.println("안녕하세요."+q+"님 환영합니다!!");
	%>
	<br>
		<span id="check" style="text-decoration: underline;text-underline-position:under; ">예약관리</span>
		<span id="room" >객실관리</span>
		<input id="back" type="button" value="로그아웃"
			style="float: right; margin-right: 40px;">
	</header>
	<section>
		<div class="main">
			<div class="a" style="margin-right: 50px; margin-left: 40px;">
				<br>
				<div class="col-md-8 ">
					<label for="inputEmail3" class="form-label">예약자 이름:</label>&nbsp;&nbsp;&nbsp;
					 <input type="text" class="form-control" id="inputEmail3">
				</div>
				객실분류:
				<div class="input-group">
					<select id="roomtype" class="form-select form-select-mg " style="height: 42px;">
						<c:forEach items="${roomtype}" var="type">
							<option value="${type.typecode}">${type.typename}</option>
						</c:forEach>
					</select>
					<button type="button" class="btn btn-info" id="slt">검색</button>
				</div>

			</div>
			<div class="b" style="margin-left: 30px; margin-right: 20px;">
				<br>
				<div class="col-md-8 input-group">
					객실명:&nbsp;&nbsp;<input type="text" class="form-control" id="roomname">
				</div>
				<br>
				<div class="col-md-8 input-group">
					객실종류:&nbsp;&nbsp;<input type="text" class="form-control" id="type" readonly="readonly">
				</div>
				<br>
				<div class="col-sm-7 input-group">
					<label for="fullPersonnel" class="col-form-label">최대
						인원(명):</label> <input type="number" id="fullPersonnel"
						class="form-control" placeholder="2명"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
			</div>
			<div class="c">
				<br>
				<br>
				<br>
				<br> <label style="text-align: center; margin-left: 10px; font-size: 25px;"
					for="ac">현재 예약된 객실 리스트(아래)</label>
			</div>

			<div class="d" style="margin-right: 10px; margin-left: 20px;">
				<br> 예약가능한 객실:
				<table id="tbl1" class="table table-dark" style="border: 1px;">
						<tr>
							<th></th>
							<th scope="col">객실</th>
							<th scope="col">Room</th>
							<th scope="col">인원</th>
							<th scope="col">가격</th>
						</tr>
						<%-- <c:forEach items="${list}" var="list">
							<tr style="cursor: pointer;">
							<td><input type="hidden" value="${list.roomcode}"> </td>
							<td >${list.roomname}</td>
							<td>${list.typename}</td>
							<td>${list.howmany}</td>
							<td>${list.howmuch}</td>
						</tr>
						</c:forEach> --%>
						
				</table>
				<select id="test" size="10">
					<c:forEach items="${list}" var="list">
						<option>${list.roomname},${list.typename},${list.howmany},${list.howmuch}</option>
					</c:forEach>
				</select>
			</div>

			<div class="e" style="margin-left: 30px; margin-right: 20px;">
				<br>
				<br>
				<div class="col-sm-7 input-group">
					<label for="expense" class="col-form-label">1박비용(원):</label> 
					<input type="number" id="expense"class="form-control" placeholder="2000천만원"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
				숙박기간:
				<div class="col-sm-1 input-group">
					<input id="a" type="date" class="form-control"  placeholder="dd">~
					<input id="b" type="date" class="form-control">
					
				</div>
				
				<br>
				<div class="col-sm-7 input-group">
					<label for="personnel" class="col-form-label">
						투숙색(명):</label> <input type="number" id="personnel"
						class="form-control" placeholder="2명"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>
				
				<br>
				<div class="col-sm-7 input-group">
					<label for="price" class="col-form-label">총 비용(원):</label>
					<input id="price" type="number" id="inputPassword6" class="form-control" 
					placeholder="2000천만원"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
				<div class="col-md-8">
					<label for="mobile" class="form-label">예약자 모바일 번호:</label> <input
						type="text" class="form-control" id="mobile"
						placeholder="000-0000-0000"> (-을 뺴고 입력해주세요.) <br>
				</div>

				<br>
				<div style="text-align:center">
					<button id="btnAdd" type="button" class="btn btn-success">등록</button>
					<button id="btnDelete" type="button" class="btn btn-primary btn-lg"
					style="color: indigo-400;">삭제</button>
					<button id="set"type="button" class="btn btn-warning" style="background-color: #FF5050;">깔끔</button>
				</div>
			</div>
			<div class="f" style="margin-left: 10px; margin-right: 15px;">
				<br>
				<p style="font-size: 25px; color: red;">sold out</p>

				<table id="tbl2" class="table table-dark" style="border: 1px;">
					<thead>
						<tr>
							<th scope="col">객실</th>
							<th scope="col">숙박기간</th>
							<th scope="col">숙박인원</th>
							<th scope="col">모바일번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>백두산</td>
							<td>'''</td>
							<td>'''</td>
							<th scope="col">'''</th>
						</tr>
						<tr>
							<td>한라산</td>
							<td>'''</td>
							<td>'''</td>
							<th scope="col">'''</th>
						</tr>
						<tr>
							<td>태조산</td>
							<td>'''</td>
							<td>'''</td>
							<th scope="col">'''</th>
						</tr>
						<tr>
							<td>뒷산</td>
							<td>'''</td>
							<td>'''</td>
							<th scope="col">'''</th>
						</tr>
						<tr>
							<td>앞산</td>
							<td>'''</td>
							<td>'''</td>
							<th scope="col">'''</th>
						</tr>
					</tbody>

				</table>
				<input type="hidden" valus="${userid}" name=userid>
			</div>
		</div>

	</section>
	<footer>
		<h1 style="text-align: center; color: #FF9100;">MOON</h1>
	</footer>

	
</body>
<script>
let bDate;
let aDate;
	$(document)
	.on("click", "#back", function() {
		location.href = "/Hotel/logout";
	})
	.on("click", "#room", function() {
		location.href = "/Hotel/room";
	})
	.on("click","#tbl1 tr",function(){
		$(this).each(function(){
			name=$(this).find("td:eq(1)").text();
			typename=$(this).find("td:eq(2)").text();
			fullpersonnel=$(this).find("td:eq(3)").text();
			expense=$(this).find("td:eq(4)").text();
		})
		console.log(name,typename,fullpersonnel,expense);
		$("#roomname").val(name);
		$("#type").val(typename);
		$("#fullPersonnel").val(fullpersonnel);
		$("#expense").val(expense);
	})
	.on("click","#btnAdd",function(){
		var a=$("#a").val();
		//$("#b").val(a);
		var b=$("#b").val();
		c=a.replace(/-/gi,"");
		d=b.replace(/-/gi,"");
		//d=a.split("-");
		//console.log(d[0])
		console.log(c);
		console.log(d);
		console.log(d-c);
	})
	//input date blur 값전달.
	.on("blur","#a",function(){
		var a=$(this).val();
		$("#b").val(a);
		aDate=a.replace(/-/gi,"");
		//console.log(aDate);
		$("#b").prop("min",a);
	})
	//input date 값 이용해서 총액구하기
	.on("blur","#b",function(){
		b=$(this).val();
		bDate=b.replace(/-/gi,"");
		expense=$("#expense").val();
		$("#price").val(expense*(bDate-aDate));
	})
	//검색
	.on("click","#slt",function(){
		console.log($("#roomtype").val());
		$.post("http://localhost:8080/Hotel/slt",
		{code:$("#roomtype").val()},
		function(result){
			console.log(result);
		},"text"); 
		 
	})
	$('#room').hover(function(){
		$(this).css("color","yellow");
	},function(){
		$(this).css("color","black");
	})
	
</script>
</html>
