<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
*{margin: 0; padding: 0;}
#leftBox{
		/* background-color: #a0df93; */
		background-color: white;
		width: 22vw;
		height: 92vh;
		display: inline-block;
		margin: 1.8% 0;
		margin-left: 2vw;
		border-radius: 15px;
	}
	#centerBox{
		background-color: white;
		width: 76vw;
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
   		position: relative;
	}
	h3{
	margin: 1vh 0;
	font-size: 3vh;
}
h3>img{
	float: right;
	width: 3.5vw;
	height: 4vh;
	cursor: pointer;
}
#center-centerBox{
	width: 97%;
    height: 100%;
    margin: 0 auto;
}
#changeHeader{
	width: 55vw;
    font-size: 3vh;
    text-indent: 0.5vw;
}
.headerBtn{
    float: right;
    width: 6vw;
    height: 4.2vh;
    margin-left: 1vw;
}

ul{
	width: 15vw;
    margin: 0 auto;
    divst-style: none;
}
.list{
    font-size: 2vh;
    border-bottom: 1px solid black;
    text-indent: 1vw;
    padding-bottom: 0.5vh;
    width: 90%;
    margin: 2vh auto;
}
.list::after{
	background: url(<%=request.getContextPath()%>/resources/images/arrow-down.png) no-repeat 0px 0px;
    content: "";
    display: inline-block;
    height: 2vh;
    width: 2vw;
    background-size: contain;
    cursor: pointer;
	float: right;    
}
.ck::after{
	background: url(<%=request.getContextPath()%>/resources/images/arrow-rigth.png) no-repeat 0px 0px;
    content: "";
    display: inline-block;
    height: 2vh;
    width: 2vw;
    background-size: contain;
    cursor: pointer;
	float: right;    
}
.listBox{
	display: none;
	font-size: 2vh;
    text-indent: 2vw;
    padding-bottom: 0.5vh;
    width: 90%;
    margin: 2vh auto;
}
.listBox>div{
	margin-bottom: 1vh;
}
.ck+.listBox{
	display: block;
}

#miniIframe{
	    width: 97%;
	    height: 100%;
	    margin: 0 auto;
	    display: block;
	    border: 0;
}

.list, .listBox>div{
	cursor: pointer;
}	

.act{
	text-decoration: underline;
	font-weight: bold;
}

body{
font-family: ${myMini.font};
}
</style>
<c:if test="${newFriends eq 'Y'}">
<style>
	#list-icon::after{
		background-image: url('<%=request.getContextPath()%>/resources/images/n_red_alphabet_letters_icon.png');
		background-size: 8px;
	    width: 8px;
	    height: 8px;
	    content: "";
	    background-repeat: no-repeat;
	    position: absolute;
	}
</style>
</c:if>
<script>
	$(function(){
		$(".list").click(function(){
			$(".list").removeClass("ck");
			$(this).addClass("ck");
			$("#leftBox").css("height","10vh");
		});
	})
</script>
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
					"uidx"	: ${login.uidx}
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
	function clickThis(e){
		$(".list-option").removeClass('act');
		$(e).addClass('act');
	}
	
	function optionClick(e){
		$("#miniIframe").attr("src",e);
	}
</script>

<c:if test="${device eq 'MOBILE'}">
<style>
#leftBox{
    border-radius: 15px;
    display: block;
    height: 5vh;
    width: 100%;
    margin: 0;
}
#left-centerBox{
	width: 100%;
    height: 100%;
    border-radius: 0;
    display: flex;
}
.list{
    display: inline-block;
    width: 100%;
    font-size: 4vw;
    height: 5vh;
    line-height: 5vh;
    border: 0;
    margin: 0;
    padding: 0;
    position: relative;
    border-bottom: 1px solid black;
    text-align: center;
}
.list::after {
    display:none;
}
.listBox{
	position: absolute;
    top: 5vh;
    margin: 0;
    font-size: 4vw;
    height: 5vh;
    line-height: 5vh;
    width:100%;
}
.ck+.listBox {
    display: flex;
}
.listBox>div {
    width: 100%;
    margin: 0;
    text-align: center;
}
.ck{
	background-color: #007500;
    color: white;
    font-weight: bold;
}
.act{
	text-decoration:none;
	font-weight: bold;
    background-color: #007500;
    color: white;
}
#centerBox{
    width: 100%;
    position: relative;
    height: 65vh;
}
#list-icon::after {
    width: 2vw;
    height: 2vw;
    background-size: contain;
    top: 2vw;
}
</style>
</c:if>

</head>
<body>

	<div id="leftBox">
		<c:if test="${device eq 'PC'}">
		<div id="left-topBox">
			<p>TODAY <span style="color: red">${today}</span></p>
			<p>TOTAL <span>${total}</span></p>
		</div>
		</c:if>
		<div id="left-centerBox">
		<c:if test="${device eq 'PC'}"><br></c:if>
			<div class="list">내 정보</div><div class="listBox">
				<div class="list-option" onclick="optionClick('<%=request.getContextPath() %>/user/myPage-idx.do?uidx=${login.uidx}&mini=1'),clickThis(this)">회원 정보</div>
				<div class="list-option" onclick="optionClick('<%=request.getContextPath() %>/user/myPage-modify.do?uidx=${login.uidx}&mini=1'),clickThis(this)">회원정보 수정</div>
				<div class="list-option" onclick="optionClick('<%=request.getContextPath() %>/user/myPage-changePwd.do?uidx=${login.uidx}&mini=1'),clickThis(this)">비밀번호 수정</div>
			</div><div class="list">친구</div><div class="listBox">
				<div class="list-option" onclick="optionClick('friendsList.do?uidx=${login.uidx}'),clickThis(this)">친구 목록</div>
				<div id="list-icon" class="list-option" onclick="optionClick('friendsCheckList.do?uidx=${login.uidx}'),clickThis(this)">친구 신청 목록</div>
			</div><div class="list">내 아이템</div><div class="listBox">
				<div class="list-option" onclick="optionClick('<%=request.getContextPath() %>/miniroomboard2/minihomeEffect.do?uidx=${login.uidx}'),clickThis(this)">미니홈피 효과</div>
				<div class="list-option" onclick="gettingReady()">음악 설정</div>
				<div class="list-option" onclick="optionClick('<%=request.getContextPath() %>/miniroomboard2/minihomeFont.do?uidx=${login.uidx}'),clickThis(this)">폰트 설정</div>
			</div>
		</div>
		
	</div>
	<div id="centerBox">
	<div id="center-centerBox">
	<c:if test="${device eq 'PC'}">
	<h3>${mini.h2}<img src="<%=request.getContextPath()%>/resources/images/setting.png" onclick="changeHeader()"></h3>
	<hr>
	</c:if>
	<iframe id="miniIframe" scrolling="yes" src="<%=request.getContextPath() %>/user/myPage-idx.do?uidx=${login.uidx}&mini=1"></iframe>
	</div>
	</div>
	<script type="text/javascript">
	function gettingReady(){
		alert("페이지 준비중입니다.");
	}
	</script>
</body>
</html>