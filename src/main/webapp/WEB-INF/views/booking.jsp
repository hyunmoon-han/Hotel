<%@page import="javax.tools.DocumentationTool.Location"%>
<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>객실관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
header {
	background-color: #6DD66D;
	height: 100px;
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
	grid-template-columns: 1fr 1fr 1fr;
	grid-template-rows: 150px 490px;
	background-color: #FFFA82;
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
		<span id="room" style="font-size: 30px; margin-left: 20px;">객실관리</span>
		<span id="check" style="font-size: 30px; margin-left: 20px;">예약관리</span>
		<input id="back" type="button" value="로그아웃"
			style="float: right; margin-top: 30px; margin-right: 40px;">
	</header>
	<section>
		<div class="main">
			<div class="a" style="margin-right: 50px; margin-left: 40px;">
				<br>
				<div class="col-md-8">
					<label for="inputEmail3" class="form-label">객실 이름:</label> <input
						type="text" class="form-control" id="inputEmail3">
				</div>
				객실분류:
				<div style="float: left;" class="input-group">
					<select class="form-select form-select-mg " style="height: 42px;">
						<option selected>Suite Room</option>
						<option>Family Room</option>
						<option>Double Room</option>
						<option>Single Room</option>
						<option>Domitory</option>

					</select>
					<button type="button" class="btn btn-info">검색</button>
				</div>

			</div>
			<div class="b" style="margin-left: 30px; margin-right: 20px;">
				<br>
				<div class="col-md-8">
					<label for="inputEmail4" class="form-label">예약자 성명:</label> <input
						type="text" class="form-control" id="inputEmail4">
				</div>
				숙박기간:
				<div class="col-sm-1 input-group">
					<input type="date" class="form-control">~<input type="date"
						class="form-control">
				</div>
				<br>
			</div>


			<div class="c">
				<br>
				<br>
				<br>
				<br> <label
					style="text-align: center; margin-left: 10px; font-size: 25px;"
					for="ac">현재 예약된 객실 리스트(아래)</label>
			</div>

			<div class="d" style="margin-right: 10px; margin-left: 20px;">
				<br> 예약가능:
				<table class="table table-dark" style="border: 1px;">
					<thead>
						<tr>
							<th scope="col">객실</th>
							<th scope="col">Room</th>
							<th scope="col">인원</th>
							<th scope="col">가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>백두산</td>
							<td>Suite Room</td>
							<td>2명</td>
							<th scope="col">가격</th>
						</tr>
						<tr>
							<td>한라산</td>
							<td>Family Room</td>
							<td>4명</td>
							<th scope="col">가격</th>
						</tr>
						<tr>
							<td>태조산</td>
							<td>Double Room</td>
							<td>3명</td>
							<th scope="col">가격</th>
						</tr>
						<tr>
							<td>뒷산</td>
							<td>Single Room</td>
							<td>2명</td>
							<th scope="col">가격</th>
						</tr>
						<tr>
							<td>앞산</td>
							<td>Domitory</td>
							<td>2명</td>
							<th scope="col">가격</th>
						</tr>
					</tbody>

				</table>
			</div>

			<div class="e" style="margin-left: 30px; margin-right: 20px;">
				<br>
				<br>
				<div class="col-sm-7 input-group">
					<label for="inputPassword6" class="col-form-label">숙박
						인원(명):</label> <input type="number" id="inputPassword6"
						class="form-control" placeholder="2명"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
				<div class="col-sm-7 input-group">
					<label for="inputPassword6" class="col-form-label">1박
						비용(원):</label> <input type="number" id="inputPassword6"
						class="form-control" placeholder="2000천만원"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>
				<br>
				<div class="col-sm-7 ">
					<label for="inputPassword6" class="col-form-label">총 비용(원):</label>
					<input type="number" id="inputPassword6" class="form-control"
						placeholder="2000천만원"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
				</div>

				<div class="col-md-8">
					<label for="inputEmail42" class="form-label">예약자 모바일 번호:</label> <input
						type="text" class="form-control" id="inputEmail42"
						placeholder="000-0000-0000"> (-을 뺴고 입력해주세요.) <br>
				</div>

				<br>
				<div style="padding-left: 99px;">
					<button type="button" class="btn btn-success">등록</button>
					<button type="button" class="btn btn-primary btn-lg"
						style="color: indigo-400;">삭제</button>
					<button type="button" class="btn btn-warning"
						style="background-color: #FF5050;">깔끔</button>
				</div>
			</div>
			<div class="f" style="margin-left: 10px; margin-right: 15px;">
				<br>
				<p style="font-size: 25px; color: red;">sold out</p>

				<table class="table table-dark" style="border: 1px;">
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
	$(document).on("click", "#back", function() {
		location.href = "/Hotel/logout";
	}).on("click", "#room", function() {
		location.href = "/Hotel/booking";
	}).on("click", "#check", function() {
		location.href = "/Hotel/room";
	})
</script>
</html>
