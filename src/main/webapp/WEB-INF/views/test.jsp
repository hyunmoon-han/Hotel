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
	background: white; 
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
	display: grid;
	gap: 5px;
	grid-template-columns: 0.7fr 1.3fr;
	grid-template-rows: 10% 90%;
	height: 75%;
}

footer {
	 background-color: #A814E7; 
	 height: 7%; 
}

.main {
	opacity: 0.8;
	 height: 5%; 
}
span{
	cursor:pointer;
	font-size: 30px;
	margin-left: 20px;
}
.decoration{
	text-decoration: line-through;
}
.modal{
	 position:absolute; 
	 width:100%;
	 height:100%; 
	 background: rgba(0,0,0,0.8); 
	 top:0; left:0; 
	 display:none; 
	 }
.modal_content{
  width:500px; height:570px;
  background:#fff; border-radius:10px;
  position:relative; top:25%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:20px 100px;
  line-height:23px; cursor:pointer;
	}
#x{
	position:relative;
	top:15%; 
	left:75%;
	background-color: white;
	}
table {
  border-collapse: separate;
  border-spacing: 0px 2px;
	}
td{
	border-bottom: 1px
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
	
	<div style="text-align: center;">
		<span style="margin-right: 95px">체크인</span><span style="margin-left: 50px;margin-right: 250px;">체크아웃</span>
	</div>
	<div class="main">
			<div class="col-sm-1 input-group"  style="left: 25%;" >
				<input id="a" type="date" class=""  style="width: 170px">&nbsp;&nbsp;
				<input id="pac" type="text" style="width:57px" readonly="readonly">&nbsp;&nbsp;
				<input id="b" type="date" class=""  style="width: 170px">&nbsp;&nbsp;
				<select id="roomtype" class="" style="height: 42px;width: 170px">
					<c:forEach items="${roomtype}" var="type">
						<option value="${type.typecode}">${type.typename}</option>
					</c:forEach>
				</select>
				<button type="button" class="btn btn-info" id="slt">검색</button>
			</div> 
	</div>
	<section>
		<input type="button" value="예약하기" id="mo">
			<div class="modal"> 	
				<button class="btn-close" aria-label="Close" id="x" ></button>
				<div class="modal_content" title="클릭하면 창이 닫힙니다."> 
					<div class="col-md-8 input-group">
						객실명:&nbsp;&nbsp;<input type="text" class="form-control" id="roomname" readonly="readonly">
						
					</div>
					<br>
					<div class="col-md-8 input-group">
						객실종류:&nbsp;&nbsp;
						<select id="type" class="form-select form-select-mg " disabled="disabled" style="height: 40px;">
							<c:forEach items="${roomtype}" var="type">
								<option value="${type.typecode}" value2="${type.typename}">${type.typename}</option>
							</c:forEach>
						</select>
					</div>
					<br>
					<div class="col-sm-7 input-group">
						<label for="fullPersonnel" class="col-form-label">최대인원(명):</label> 
						<input type="number" id="fullPersonnel" class="form-control" placeholder="2명" min="1" readonly="readonly"
							style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
					</div>
					<br>
					<div class="col-sm-7 input-group">
						<label for="expense" class="col-form-label">1박비용(원):</label> 
						<input type="number" id="expense"class="form-control" min="1"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;" readonly="readonly">
					</div>
					<br>
					<div class="col-sm-7 input-group">
						<label for="price" class="col-form-label">총 비용(원):</label>
						<input id="price" type="number" id="inputPassword6" class="form-control" min="1" readonly="readonly"
						style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
					</div>
					<br>
					<div class="col-sm-7 input-group">
						<label for="personnel" class="col-form-label">투숙색(명):</label> <input type="number" id="personnel"
						class="form-control" min="1"style="margin-left: 10px; margin-right: 60px; border-radius: 20px 20px 20px 20px;">
					</div>
					<br>
					<div class="col-md-8 input-group">
						<label for="pname" class="form-label">예약자 이름:</label>&nbsp;&nbsp;&nbsp;
						<input type="text" class="form-control" id="pname">
					</div>
					<br>
					<div class="col-md-8" style="margin-left:40px">
						<label for="mobile" class="form-label">예약자 모바일 번호:</label> 
						<input type="text" class="form-control" id="mobile"placeholder="000-0000-0000"> (-을 뺴고 입력해주세요.) 
					</div>
					<br>
					<br>
					<div style="text-align:center;">
						<button id="btnAdd" type="button" class="btn btn-success">등록</button>
						<button id="set"type="button" class="btn btn-primary" style="">깔끔</button>
						<button id="btnDelete" type="button" class="btn btn-primary btn-rg"
						style="color: indigo-400; background-color:  #FF5050">삭제</button>
					</div>
				</div> 
			</div>
	
		<div>
			<input type="text" id="wowCode">
			<input type="text" id="wowType">
			<input type="text" id="wowBookcode">
		</div>
	
		<div>
				<p style="font-size: 25px; color: red;">예약가능한 객실:</p> 
				<table id="tbl1" class="table table-striped" style="border: 1px;">
						<tr>
							<th></th>
							<th scope="col">객실</th>
							<th scope="col">Room</th>
							<th scope="col">인원</th>
							<th scope="col">가격</th>
						</tr>
				</table>
				<table id="tbl1" class="table table-striped" style="border: 1px;">
						<tr>
							<th></th>
							<th scope="col">객실</th>
							<th scope="col">Room</th>
							<th scope="col">인원</th>
							<th scope="col">가격</th>
						</tr>
				</table>
				
				<%-- <select id="test" size="10">
					 <c:forEach items="${list}" var="list">
						<option>${list.roomname},${list.typename},${list.howmany},${list.howmuch}</option>
					</c:forEach> 
				</select> --%>
		</div>
		<div>
				<p style="font-size: 25px; color: red;">sold out</p>
				  <table id="tbl2" class="table table-striped" style="border: 1px;">
						<tr>
							<th></th>
							<th >객실</th>
							<th >Room</th>
							<th>투숙객</th>
							<th >최대인원</th>
							<th >체크인</th>
							<th >체크아웃</th>
							<th >예약자</th>
							<th >모바일번호</th>
						</tr>
				</table>
				<table id="tbl2" class="table table-striped" style="border: 1px;">
						<tr>
							<th></th>
							<th >객실</th>
							<th >Room</th>
							<th>투숙객</th>
							<th >최대인원</th>
							<th >체크인</th>
							<th >체크아웃</th>
							<th >예약자</th>
							<th >모바일번호</th>
						</tr>
				</table>
				
				 <!-- <select id="test2" size="20" style="width: 510px">
				</select>  -->	
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
	.ready(function(){
		
	})
	.on("click", "#back", function() {
		location.href = "/Hotel/logout";
	})
	.on("click", "#room", function() {
		location.href = "/Hotel/room";
	})
	.on("click","#tbl1 tr",function(){
		$(this).each(function(){
			code=$(this).find("td input").val();
			name=$(this).find("td:eq(1)").text();
			typename=$(this).find("td:eq(2)").text();
			fullpersonnel=$(this).find("td:eq(3)").text();
			expense=$(this).find("td:eq(4)").text();
			type=$(this).find("td input:eq(1)").val();
		})
		//console.log(code,name,typename,fullpersonnel,expense);
		$("#wowCode").val(code);
		$("#roomname").val(name);
		$("#type").val(type).prop("selected",true);
		$("#wowType").val(type);
		$("#fullPersonnel").val(fullpersonnel);
		$("#expense").val(expense);
		//console.log(aDate,bDate);
		expense2=$("#expense").val();
		$("#price").val(expense2*(bDate-aDate));
		//가능객실 예약객실 클릭시 정보 초기화
		$("#wowBookcode,#personnel,#pname,#mobile").val('');
		
	})
	//input date blur 값전달.
	.on("blur","#a",function(){
		var a=$(this).val();
		$("#b").val(a);
		aDate=a.replace(/-/gi,"");
		//console.log(aDate);
		/* dd=a.substr(8,9);
		if(dd<10){
			cc=dd.substr(1);
			console.log(cc)
			$("#b").prop("min",cc+1);
			return false;
		}
		console.log(dd); */
		$("#b").prop("min",a);
	})
	//input date 값 이용해서 총액구하기
	.on("blur","#b",function(){
		b=$(this).val();
		bDate=b.replace(/-/gi,"");
		
	})
	//검색
	.on("click","#slt",function(){
		//console.log($("#roomtype").val());
		$("#tbl1").empty();
		$("#tbl2").empty();
		//공통버전
		//4줄은 메퍼에서 값 비교할떄 사용할려고 값 변환
		a=$("#a").val();
		checkin=a.replace(/-/gi,"");
		b=$("#b").val();
		checkout=b.replace(/-/gi,"");
		if(a==''||b==''){//날짜 공백시 타입만검색
			checkin=0;
			checkout=0;
		}
		$("#pac").val(checkout-checkin+'박');
		type2=$("#roomtype").val();
		//예약가능한 객실리스트
	 	$.post("http://localhost:8080/Hotel/slt",
		{code:$("#roomtype").val(),checkin:checkin,checkout:checkout},
		function(result){
			//console.log(result);
			$.each(result,function(k,v){
				str='<tr><td><input type="hidden" value="'+v.roomcode+'"><input type="hidden" value="'+v.roomtype+'"></td><td>'+v.roomname+'</td>'+'<td>'+v.typename+'</td><td>'+v.howmany+'</td>'+'<td>'+v.howmuch+'</td></tr>';
				 $("#tbl1").append(str);
			})
		},"json");    
		//console.log(checkin,checkout,type2);
		//예약중인 테이블
		$.post("http://localhost:8080/Hotel/tim",
		{checkin:checkin,checkout:checkout,type:type2},
		function(result){
			//console.log(result);
			$.each(result,function(k,v){
				str='<tr><td><input type="hidden" value="'+v.roomcode+'"><input type="hidden" value="'+v.bookcode+'"><input type="hidden" value="'+v.type+'"><input type="hidden" value="'+v.howmuch+'"><input type="hidden" value="'+v.totalprice+'"></td><td>'+v.roomname+'</td><td>'+v.typename+'</td><td>'+v.person+'</td><td>'+v.howmany+'</td><td>'+v.checkin+'</td><td>'+v.checkout+'</td><td>'+v.name+'</td><td>'+v.mobile+'</td></tr>';
				$("#tbl2").append(str);
				})
		},"json");   
		
		
		
		let type=$("#roomtype").val();
		$("#type").val(type).prop("selected",true);
		$("#wowType").val(type);
		    /* $.post(
			"http://localhost:8080/Hotel/RoomType2",
			{},
			function(result){
				//console.log(result);
				//input값으로 생성
				 $.each(result,function(k,v){
					str='<tr><td><input type="text" value="'+v.roomcode+'"><input type="text" value="'+v.type+'"></td><td>'+v.roomname+'</td>'+'<td>'+v.typename+'</td><td>'+v.howmany+'</td>'+'<td>'+v.howmuch+'</td></tr>';
					 $("#tbl1").append(str);
				}) 
			},
			"json");  */    
	})
	//등록버튼 처리
	.on("click","#btnAdd",function(){
		if($("#a").val()==''||$("#b").val()==''){
			alert("숙박기간을 입력하세요.");
			return false;
		}
		if($("#roomname").val()==''){
			alert("객실명을 입력해주세요.");
			return false;
		}
		if($("#fullPersonnel").val()==''||$("#personnel").val()==''){
			alert("숙박인원을 확인해주세요.");
			return false;
		}
		if($("#expense").val()==''||$("#price").val()==''){
			alert("비용을 확인해주세요.");
			return false;
		}
		if($("#pname").val()==''){
			alert("예약자 이름을 입력하세요.");
			return false;
		}
		if($("#mobile").val()==''){
			alert("모바일번호를 입력하세요.");
			return false;
		}
		roomcode=$("#wowCode").val();
		roomname=$("#roomname").val();
		wowType=$("#wowType").val();
		type=$("#type").val();
		person=$("#personnel").val();
		fullPersonnel=$("#fullPersonnel").val();
		checkin=$("#a").val();
		checkout=$("#b").val();
		name=$("#pname").val();
		mobile=$("#mobile").val();
		expense=$("#expense").val();
		price=$("#price").val();
		typename=$("#type option:selected").attr("value2");
		//$("#tbl2").empty();
		//console.log(roomcode,roomname,type,typename,person,fullPersonnel,checkin,checkout,name,mobile,expense,price);
     	if($("#wowBookcode").val()==''){//인서트
     		$.post("http://localhost:8080/Hotel/reservation",
     				{roomcode:roomcode,person:person,checkin:checkin,checkout:checkout,name:name,mobile:mobile,price:price},
     				function(result){
     					if(result=="success"){
     						$("#set").trigger('click');
     						//예약가능한 객실 에 예약한 객실 표시하기
     						$("#tbl1 tr").each(function(){
     							let deco=$(this).find("td input").val();
     							//console.log('deco:'+deco,roomcode);
     							if(deco==roomcode){
     								$(this).css("text-decoration","line-through");
     								//$(this).toggleClass('decoration');
     								//$(this).remove();
     							}
     						})
     					}else{
     						alert("예약이 완료되지 않았습니다.(DB저장오류)");
     						return false;
     					}
     					},"text");
     	}else{//업데이트
     		bookcode=$("#wowBookcode").val();
     		console.log("p:",person,name,mobile,bookcode);
     		$.post("http://localhost:8080/Hotel/update",
     		{person:person,name:name,mobile:mobile,bookcode:bookcode},
     		function(result){
     			console.log('업데이트:'+result);
     		},"text");
     	}
     		$("#tbl2").empty();
 			a=$("#a").val();
 			checkin2=a.replace(/-/gi,"");	
 			b=$("#b").val();
 			checkout2=b.replace(/-/gi,"");
 			console.log("zzz:"+checkin2,checkout2,wowType);
 			$.post("http://localhost:8080/Hotel/tim",
 					{checkin:checkin2,checkout:checkout2,type:wowType},
 					function(result){
 						console.log(result);
 						$.each(result,function(k,v){
 							str='<tr><td><input type="hidden" value="'+v.roomcode+'"><input type="hidden" value="'+v.bookcode+'"><input type="hidden" value="'+v.type+'"><input type="hidden" value="'+v.howmuch+'"><input type="hidden" value="'+v.totalprice+'"></td><td>'+v.roomname+'</td><td>'+v.typename+'</td><td>'+v.person+'</td><td>'+v.howmany+'</td><td>'+v.checkin+'</td><td>'+v.checkout+'</td><td>'+v.name+'</td><td>'+v.mobile+'</td></tr>';
 							$("#tbl2").append(str);
 							})
 					},"json");
 			$("#set").trigger("click");
	})
	//초기화 버튼
	.on("click","#set",function(){
		 $("#type,#roomname,#fullPersonnel,#expense,#personnel,#price,#mobile,#wowCode,#wowType,#wowBookcode,#pname").val('');
		
	})
	//table 값 이동
	.on("click","#tbl2 tr",function(){
		$(this).each(function(){
			roomcode=$(this).find("td input:eq(0)").val();
			bookcode=$(this).find("td input:eq(1)").val();
			roomtype=$(this).find("td input:eq(2)").val();
			howmuch=$(this).find("td input:eq(3)").val();
			totalprice=$(this).find("td input:eq(4)").val();
			
			roomname=$(this).find("td:eq(1)").text();
			typename=$(this).find("td:eq(2)").text();
			personnel=$(this).find("td:eq(3)").text();
			fullPersonnel=$(this).find("td:eq(4)").text();
			//띄어쓰기자르기
			let pstr=$.trim($(this).find("td:eq(5)").text());
			let pstr2=$.trim($(this).find("td:eq(6)").text());
			pname=$(this).find("td:eq(7)").text();
			mobile=$(this).find("td:eq(8)").text();
			$("#wowCode").val(roomcode);
			$("#wowType").val(roomtype);
			$("#wowBookcode").val(bookcode);
			
			$("#roomname").val(roomname);
			$("#type").val(roomtype).prop("selected",true);
			$("#personnel").val(personnel);
			$("#fullPersonnel").val(fullPersonnel);
			$("#a").val(pstr);
			$("#b").val(pstr2);
			$("#pname").val(pname);
			$("#mobile").val(mobile);
			$("#expense").val(howmuch);
			$("#price").val(totalprice);
			//console.log('하:'+roomcode,bookcode,roomtype,roomname,typename,personnel,fullPersonnel,checkin,checkout,pname,mobile);
		})
	})
	//객실 삭제 작업
	.on("click","#btnDelete",function(){
		ch=confirm("정말로 삭제 하시겠니까?");
		if(ch){
			$("#tbl1").empty();
			 bookcode=$("#wowBookcode").val();
			$.post("http://localhost:8080/Hotel/delete",
			{bookcode:bookcode},
			function(result){
					if(result=="success"){
						//예약중인테이블 삭제
						$("#tbl2 tr").each(function(){
							end=$("#wowBookcode").val();
							if($(this).find('input:eq(1)').val()==end){
								console.log($(this).find("input:eq(1)").val());
								$(this).remove();
							}
						}) 
					}
			},"text"); 
			
			//예약가능한 객실리스트
			a=$("#a").val();
			checkin=a.replace(/-/gi,"");
			b=$("#b").val();
			checkout=b.replace(/-/gi,"");
		 	$.post("http://localhost:8080/Hotel/slt",
			{code:$("#wowType").val(),checkin:checkin,checkout:checkout},
			function(result){
				//console.log("d"+result);
				$.each(result,function(k,v){
					str='<tr><td><input type="hidden" value="'+v.roomcode+'"><input type="hidden" value="'+v.roomtype+'"></td><td>'+v.roomname+'</td>'+'<td>'+v.typename+'</td><td>'+v.howmany+'</td>'+'<td>'+v.howmuch+'</td></tr>';
					 $("#tbl1").append(str);
				})
			},"json");
		 	//$("#set").trigger("click");
		}else{
			return false;
		}
	})
	$('#room').hover(function(){
		$(this).css("color","yellow");
	},function(){
		$(this).css("color","black");
	})
	$(function(){ 
		$("#mo").click(function(){ 
			$(".modal").fadeIn(); 
		}); 
		$("#x").click(function(){ 
			$(".modal").fadeOut(); 
		}); 
	});


</script>
</html>

	