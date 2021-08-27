<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>예약관리</title>
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
</style>
</head>

<body>
	
	<header>
	<p>안녕하세요!! ${loginid }님 환영합니다.</p>
	<p>안녕하세요!! ${HK }님 환영합니다.</p>
		<span id="room" style="font-size: 30px; margin-left: 20px;" >객실관리</span> 
		<span id="check" style="font-size: 30px; margin-left: 20px;">예약관리</span>
		<input id="back" type="button" value="로그아웃" style="float: right;margin-top: 30px;margin-right: 40px;">
	</header>
	<section>
		<div class="main">
			<div class="a" style="margin-top: 45px;">
				<br>
				<h1 style="text-align: center;">객실</h1>
				<table class="table table-dark table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">이름</th>
							<th scope="col">Room</th>
							<th scope="col">인원</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>백두산</td>
							<td>Suite Room</td>
							<td>2명</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>한라산</td>
							<td>Family Room</td>
							<td>4명</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>태조산</td>
							<td>Double Room</td>
							<td>3명</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>뒷산</td>
							<td>Single Room</td>
							<td>2명</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>앞산</td>
							<td>Domitory</td>
							<td>2명</td>
						</tr>
					</tbody>
				</table>


			</div>
			<div class="b">
				<br>
				<div class="col-md-8" style="margin-left: 158px;">
					<label for="inputEmail4" class="form-label"
						style="margin-left: 113px;">객실 이름:</label> <input type="text"
						class="form-control" id="inputEmail4">
				</div>
				<br> <label for="" style="margin-left: 270px;">객실 분류:</label> <select
					class="form-select" size="7" style="margin-left: 90px;">
					<option selected>Suite Room</option>
					<option>Family Room</option>
					<option>Double Room</option>
					<option>Single Room</option>
					<option>Domitory</option>
				</select> <br>
				<br>
				<div class="col-md-3 input-group" style="margin-left: 110px;">
					<label for="validationCustom04" class="form-label">숙박 최대
						인원:</label> <select class="form-select" id="validationCustom04"
						style="margin-right: 150px; margin-left: 9px;">
						<option selected>1명</option>
						<option>2명</option>
						<option>3명</option>
						<option>4명</option>
						<option>5명</option>
					</select>
				</div>
				<br>
			</div>
			<div class="c"></div>
			<div class="d">
				<br>
				<div class="col-md-5 input-group" style="margin-left: 140px;">
					1박 요금:<input type="text" class="form-control" placeholder="3000천만원"
						aria-label="First name"
						style="margin-right: 180px; margin-left: 7px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
				<div style="padding-left: 190px; margin-top: 30px;">
					<button type="button" class="btn btn-success">등록</button>
					<button type="button" class="btn btn-primary btn-lg"
						style="color: indigo-400;">삭제</button>
					<button type="button" class="btn btn-warning"
						style="background-color: #FF5050;">깔끔</button>
				</div>
			</div>
			<div class="e"></div>
			<div class="f"></div>
		</div>

	</section>
	<footer>
		<h1 style="text-align: center; color: #FF9100;">MOON</h1>
		
	</footer>

</body>
<script>
	$(document)
	.on("click","#back",function(){
		location.href="/Hotel/logout";
	}).on("click","#room",function(){
		location.href="/Hotel/booking";
	})
	.on("click","#check",function(){
		location.href="/Hotel/room";
	})
</script>

</html>