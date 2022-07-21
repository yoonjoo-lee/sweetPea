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
    background-color: gray;
    width: 35vw;
    height: 25vh;
    margin-right: 1vw;
}
.boardListBox{
	display: inline-block;
    background-color: gray;
    width: 53vw;
    height: 25vh;
    border-radius: 15px;
}
.miniRoomBox{
	width: 90vw;
    height: 45vh;
    margin: 2vh auto;
    background-color: gray;
}
</style>
<script>
	function changeHeader(){
		$("h3").html("<input type='text' id='changeHeader' value='${mini.h2}'>"
				+"<input type='button' class='headerBtn' value='취소' onclick='location.reload()'>"
				+"<input type='button' class='headerBtn' value='변경' onclick='inputHeader()'>");
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
<body>
	<h3>${mini.h2}
	<c:if test="${login.uidx == mini.uidx}"><img src="<%=request.getContextPath()%>/resources/images/setting.png" onclick="changeHeader()"></c:if>
	</h3>
	<hr>
	<div class="center-topBox">
	<div class="upDateBox"></div>
	<div class="boardListBox"></div>
	</div>
	<hr>
	<div class="miniRoomBox"></div>
	<hr>
	<h4>일촌평</h4>
</body>
</html>