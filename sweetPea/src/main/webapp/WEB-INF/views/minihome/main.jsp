<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>

<c:if test="${device eq 'PC'}">
<style>
	body{
		background-image: url("<%=request.getContextPath()%>/resources/images/back3.jpg");
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
	*{
		margin: 0;
		padding: 0;
	}
	#mainBox{
		background-color: #52C3BD;
		border-radius: 30px;
		width: 75vw;
		height: 98vh;
		position: relative;
		margin: 1vh 1vw;
		z-index: 9999;
	}
	#leftBox{
		/* background-color: #a0df93; */
		background-color: white;
		width: 15vw;
		height: 95%;
		display: inline-block;
		margin: 1.8% 0;
		margin-left: 2vw;
		border-radius: 15px;
	}
	#centerBox{
		background-color: white;
		width: 55vw;
		height: 95%;
		margin: 1.8% 0;
		display: inline-block;
		border-radius: 15px;
		position: absolute;
	}
	#buttonBox{
		width: 7vw;
		height: 95%;
		margin: 1.8% 0;
		display: inline-block;
		position: absolute;
		z-index: -1;
		left: 71vw;
	}
	.boardBtn{
		width: 100%;
		height: 7vh;
		/* background-color: aqua; */
		background-color: #a0df93;
		margin-top: 3vh;
		border-radius: 10px;
		border: 1px solid black;
		cursor: pointer;
		color: white;
	}
	.boardBtn>p{
		color: inherit;
		text-align: center;
		font-size: 1.1vw;
		padding: 1.8vh 0;
	}
	.act{
		background-color: white;
		color: red;
	}
	#miniIframe{
	    width: 97%;
	    height: 100%;
	    margin: 0 auto;
	    display: block;
	    border: 0;
	}
	#left-topBox{
		width: 92%;
		height: 5vh;
		margin: 0 auto;
	}
	#left-topBox>p{
		display: inline-block;
		font-size: 1vw;
		float: left;
    	margin: 1vh;
	}
	#left-topBox>p:last-child {
		float: right;
	}
	#left-centerBox{
		width: 92%;
	    height: 93%;
	    background-color: #f0f2e9;
	    margin: 0 auto;
   		border-radius: 15px;
	}
	#profile{
		width: 11vw;
	    height: 11vw;
	    border-radius: 20px;
	    margin: 0 auto;
	    display: block;
	}
	#left-boardBox{
		border: 1px solid;
	    width: 11vw;
	    height: 55vh;
	    border-radius: 15px;
	    margin: 3vh auto;
	    background-color: aliceblue;
	    position: relative;
	}
	#left-board-setting{
		width: 3vh;
	    display: block;
	    margin-top: 1vh;
	    float: right;
	    margin-right: 0.5vw;
	}
	#left-board{
		font-size: 2vh;
	    margin: 3vh auto;
	    width: 92%;
	}
	#addFr{
		width: 4.5vh;
	    bottom: 0;
	    right: 0;
	    position: absolute;
	    float: right;
	    margin-right: 0.3vw;
	}
</style>
</c:if>
<c:if test="${device eq 'MOBILE'}">
<style>
	body{
	background-color: black;
	}
</style>
</c:if>
<script>
function clickBtn(link){ $("#miniIframe").attr("src",link);$("#section").load("resources/article/section.jsp"); }
function clickThis(e){
	$(".boardBtn").removeClass('act');
	$(e).addClass('act');
}
</script>
</head>
<body>
<c:if test="${device eq 'PC'}">
<div id="mainBox">
	<div id="leftBox">
		<div id="left-topBox">
			<p>TODAY <span style="color: red">${mini.today}</span></p>
			<p>TOTAL <span>${mini.total}</span></p>
		</div>
		<div id="left-centerBox">
			<br><img src="<%=request.getContextPath()%>/resources/upload/1.png" id="profile">
			<div id="left-boardBox">
				<img id="left-board-setting" src="<%=request.getContextPath()%>/resources/images/setting.png"><br>
				<p id="left-board">${mini.h1}</p>
				<img src="<%=request.getContextPath()%>/resources/images/addFr.png" id="addFr">
			</div>
			
		</div>
		
	</div>
	<div id="centerBox">
		<iframe id="miniIframe" scrolling="no" src="mini-home.do?uidx=${mini.uidx}"></iframe>
	</div>
	<div id="buttonBox">
		<div class="boardBtn act"  onclick='clickBtn("mini-home.do"),clickThis(this)'><p>홈</p></div>
		<div class="boardBtn" onclick="clickBtn('mini-diary.do'),clickThis(this)"><p>다이어리</p></div>
		<div class="boardBtn" onclick="clickBtn(),clickThis(this)"><p>사진첩</p></div>
		<div class="boardBtn" onclick="clickBtn(),clickThis(this)"><p>방명록</p></div>
		<div class="boardBtn" onclick="clickBtn(),clickThis(this)"><p>관리</p></div>
	</div>
</div>

</c:if>

<c:if test="${device eq 'MOBILE'}">

모바일입니다

</c:if>
</body>
</html>