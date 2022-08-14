<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<style>
*{margin: 0; padding: 0;}
hr:not(:first-of-type){
	width: 90vw;
    margin: 0 auto;
}
h3{
	margin: 1vh 0;
	font-size: 3vh;
}
h3>img{
	float: right;
	width: 4vw;
	height: 4vh;
	cursor: pointer;
}
#changeHeader{
	width: 80vw;
    font-size: 3vh;
    text-indent: 0.5vw;
}
.headerBtn{
    float: right;
    width: 8vw;
    height: 4.2vh;
    margin-left: 1vw;
}
.center-topBox{
	margin: 2vh 5vw;
}
.upDateBox{
	display: inline-block;
    width: 35vw;
    height: 25vh;
    margin-right: 1vw;
    float: left;
}
.upDateBox>p{
	font-size: 2.5vh;
	margin-bottom: 1vh;
    font-weight: bold;
    padding-left: 1vw;
}
.boardListBox{
	display: inline-block;
    background-color: #f0f2e9;
    width: 51vw;
    height: 25vh;
    border-radius: 15px;
}
.miniRoomBox{
	width: 90vw;
    height: 45vh;
    margin: 2vh auto;
    background-color: gray;
}

@font-face {
    font-family: 'EF_hyunydororong';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/EF_hyunydororong.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'MabinogiClassicR';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/MabinogiClassicR.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'HBIOS-SYS';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/HBIOS-SYS.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
.body{
font-family: ${myMini.font};
}
</style>
<script>
	function changeHeader(){
		$("h3").html("<input type='text' id='changeHeader' value='${mini.h2}'>"
				+"<input type='button' class='headerBtn' value='취소' onclick='location.reload()'>"
				+"<input type='button' class='headerBtn' value='변경' onclick='inputHeader()'>");
		$("#changeHeader").focus();
	}
	function inputHeader(){
		$.ajax({
			url:"changeHeader.do",
			type:"get",
			data:{	"h2"	: $('#changeHeader').val(),
					"uidx"	: ${mini.uidx}
			},
			success: function(data){
				if(data == 1){
				window.parent.location.reload();
				}
				else{
					alert("오류!");
				}
			}
		});
	}
</script>
</head>
<body class="body">
	<h3>${mini.h2}
	<c:if test="${login.uidx == mini.uidx}"><img src="<%=request.getContextPath()%>/resources/images/setting.png" onclick="changeHeader()"></c:if>
	</h3>
	<hr>
	<div class="center-topBox">
	<div class="upDateBox">
		<p>Update</p>
		<hr>
		<div id="homeList"></div>
	</div>
	<div class="boardListBox">
		<table border=1>
			<tr><td onclick="location.href='mini-diary.do?uidx=${mini.uidx}'">다이어리</td></tr>
			<tr><td onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=2'">사진첩</td></tr>
			<tr><td onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=3'">방명록</td></tr>
		</table>
		
		<button onclick="myMini(${login.uidx})">내 미니홈피</button>
	</div>
	</div>
	<hr>
	<div class="miniRoomBox">
	
	</div>
	<hr>
	<h4>일촌평</h4>
	
	<script>
	// 글 전부 불러오기
	$(function (){
		$.ajax({
			url: "<%=request.getContextPath()%>/miniroomboard2/homeList.do",
			type: "GET",
			data: {"category":0},
			success: function(html){
				$("#homeList").html(html);
			},
			error: function(){
			}
		})
	});
	
	//미니룸 불러오기 
	$(function (){
		$.ajax({
			url: "<%=request.getContextPath()%>/miniroomboard2/miniRoomBox.do",
			type: "GET",
			success: function(html){
				$(".miniRoomBox").html(html);
			},
			error: function(){
			}
		})
	});
	
	// 내 미니홈피 가기 
	function myMini(writer){
			window.parent.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+writer+"";
	}
	</script>
</body>
</html>