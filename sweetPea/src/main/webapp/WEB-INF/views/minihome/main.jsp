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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:if test="${device eq 'PC'}">
<style>
	body{
		background-image: url("<%=request.getContextPath()%>/item/imageView.do?originFileName=${myMini.background }");
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
	* {
		margin: 0;
		padding: 0;
	}
	#mainBox{
		background-color: gainsboro;
/* 		background-color: #52C3BD; */
		border-radius: 10px;
		width: 75vw;
		height: 92vh;
		position: relative;
		margin: 4vh 1vw;
		z-index: 1050;
	}
	#leftBox{
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
		background-color: brown;
/* 		background-color: #a0df93; */
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
	    height: 50vh;
	    border-radius: 15px;
	    margin: 3vh auto;
	    background-color: white;
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
	.addFr{
		width: 4vh;
	    bottom: 0;
	    right: 0;
	    position: absolute;
	    float: right;
	    margin-right: 0.3vw;
	    cursor: pointer;
	}
	.leftBtn{
		float: right;
	    font-size: 2vh;
    	margin: 3vh 0;
	}
	
	#left-board-content{
		height: 43vh;
		position: relative;
	}
	#left-boardBox>textarea{
		background-color: inherit;
		width: 92%;
		min-height: 35vh;
		margin: 0 auto;
		display: block;
		border: 0;
		resize: none;
		padding-top: 1vh;
    	padding-left: 1vh;
    	font-size: 2vh;
	}
	.swal2-input{
		width:15em;
	}
	.swal2-input::placeholder{
		font-size: 0.6em;
	}
	
	#chat{
		bottom: 1vh;
		right: 1vw;
		width: 8vh;
		position: absolute;
	}
	
/* 챗 이모티콘 디자인 */







@keyframes spin {
  from {
    transform: rotateY(15deg) rotateX(360deg) rotateZ(0deg);
  }
  to {
    transform: rotateY(15deg) rotateX(0deg) rotateZ(0deg);
  }
}

.box-container {
  position: absolute;
  width: 120px;
  height: 200px;
  top: 60%;
  left: 85%;
  transform: rotateZ(90deg);
  /*background-color: red;*/
}
.icon-commentary {
  width: 100%;
  height: 100%;
  position: absolute;
  transform-style: preserve-3d;
  animation: spin 5s infinite linear;
  
}
.face {
  position: absolute;
  top: 0;
  left: 0;
  transform-origin: 0 0;
  opacity: 1;
}

.face:before,
.face span:before {
  position: absolute;
  top: -43%;
  left: 0;
  right: 40%;
}

.arrow {
  width: 25px;
  height: 200px;
  background: #D2D2D2;
  transform: translate3d(0px, 0px, 25px) rotateY(90deg);
}

.below {
  width: 25px;
  height: 175px;
  background: #8B8B8B;
  transform: translate3d(120px, 25px, 25px) rotateY(90deg);
}

.long {
  width: 120px;
  height: 200px;
  background: #FFFFFF;
}

.high {
  width: 120px;
  height: 25px;
  background: #B3B3B3;
}

.high-top {
  width: 160px;
  height: 25px;
  transform: translate3d(0px, 0px, 0px) rotateX(90deg);
  background: #B3B3B3;
}

.short-down
{
  width: 51px;
  height: 25px;
  transform: translate3d(116px, 27px, 0px) rotateX(90deg) rotateY(-31deg);
  background: #8B8B8B;
}

.front:before,
.back:before
 {
  content: "...";
  color: #1D1D1D;
  transform: rotate(90deg) translate(72px, -68px);
  font-weight: bold;
  font-size: 10em;
}

.front:after,
.back:after {
  color: #1D1D1D;
  transform: rotate(90deg) translate(73px, -44px);
  font-weight: bold;
  font-size: 0.5em;
}

.icon-commentary .front {
  transform: rotateY(0deg) translateZ(25px);
}
.icon-commentary .back {
  transform: rotateY(180deg) translateX(-120px);
}
.icon-commentary .right {
  transform: rotateY(90deg) translateZ(120px) translateX(-66px);
}
.icon-commentary .left {
  transform: rotateY(-90deg) translateZ(0);
}
.icon-commentary .top {
  transform: rotateX(-270deg) translateZ(0);
}
.icon-commentary .bottom {
  transform: rotateX(90deg) translateZ(-200px);
}

.icon-commentary .peak > div {
  position: absolute;
  top: 0;
  left: 0;
  width: 40px;
  height: 25px;
  background: #FFF;
  transform-origin: left top 0;
  transform: translate3d(120px, 0px, 25px);
  clip-path: polygon(100% 0%, 0% 100%, 0% 0%);
}

.icon-commentary .peak > div:nth-child(2) {
  transform: translate3d(120px, 0px, 0px);
  clip-path: polygon(100% 0%, 0% 100%, 0% 0%);
  background: #FFF;
}


	
/* 폰트 */
/* @font-face {
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
} */
.body{
font-family: ${myMini.font};
}


.mainFrinedsList{
    width: 200px;
    height: 120px;
    display: block;
    position: absolute;
    top: 0;
    right: 30px;
    border: 0;
    margin: 10px;
}
</style>
</c:if>
<script>


	$(function(){
		$("#addFr").click(async function(){
			const { value: formValues } = await Swal.fire({
				  title: '친구 신청을 하시겠습니까?',
				  html:
					'<p>상대방 일촌명</p>' +
				    '<input id="swal-input1" class="swal2-input" onkeyup="noSpace(this)" placeholder="상대방의 일촌명을 입력해주세요">' +
				    '<p style="margin-top: 1em">상대방에게 나의 일촌명</p>' +
				    '<input id="swal-input2" class="swal2-input" onkeyup="noSpace(this)" placeholder="상대방에게 표시될 나의 일촌명을 입력해주세요">',
				  focusConfirm: false,
				  showCancelButton: true,
				  confirmButtonText: "신청",
				  cancelButtonText: "취소",
				  preConfirm: () => {
				    return [
				      document.getElementById('swal-input1').value,
				      document.getElementById('swal-input2').value
				    ]
				  }
				})
				
				if (formValues) {
					var $fName = formValues[0];
					var $myName = formValues[1];
					var $arrow = '<%=request.getContextPath()%>/resources/images/rocket_filled_icon.png';
					await Swal.fire({
						title: '<span style="color: red">신청</span> 되었습니다.',
						html:
							'<div><ul style="display: inline-block; list-style: none"><li>${mini.name}</li><li>('+$fName+')</li></ul>'+
							'<img style="margin: 0 0.5em" src='+$arrow+'>'+
							'<ul style="display: inline-block; list-style: none"><li>${login.name}</li><li>('+$myName+')</li></ul></div>',
						preConfirm: () => {
							$.ajax({
								url:"addFriends.do",
								type:"get",
								data:{"uname" : $myName
									, "bfname" : $fName
									, "uidx" : ${login.uidx}
									, "bfidx" : ${mini.uidx}
									},
								success: function(data){
									if(data==1){
										window.location.reload();
									}else{
										alert("오류!");
									}
								}
							});
						}
					})
				}
		})
		
		$("#addingFr").click(async function(){
			Swal.fire({
				title:'친구신청 중 입니다',
				icon:'info'
			})
		})
	})
</script>
<c:if test="${device eq 'MOBILE'}">
<style>

</style>
</c:if>
<script>


function clickBtn(link,type){
	if(type == 'profile'){
		<c:if test="${login.uidx != mini.uidx}">
		clickThis("#0");
		return;
		</c:if>
	}
	
	
	$("#miniIframe").attr("src",link);
	$option = 'mini-option.do?uidx=${mini.uidx}';
	if(link == $option){
		$("#miniIframe").attr("scrolling","no");
		$("#miniIframe").css({
			'left': '0',
		    'top': '0',
		    'position': 'fixed',
		    'width': '71vw',
		    'height': '88vh',
		    'margin': '6.5vh 2vw',
			'border-radius': '2vh'
		/* width: 99vw;
		height: 98vh;
		margin: 1vh 1vw;
		z-index: 9999; */
	    });
	}else{
		$("#miniIframe").attr("scrolling","yes");
		$("#miniIframe").css({
			'left': 'inherit',
			'top': 'inherit',
			'position': 'relative',
		    'width': '97%',
		    'height': '100%',
		    'margin': '0 auto',
		    'background-color': 'white',
			'border-radius': '0',
		});
	}
	
	}
function clickThis(e){
	$(".boardBtn").removeClass('act');
	$(e).addClass('act');
}

function changeLeftBoard(){
	$("#left-boardBox").html("<input type='button' class='leftBtn' value='취소' onclick='location.reload()'>"
			+"<input type='button' class='leftBtn' value='변경' onclick='inputLeftBoard()'>"
			+"<br><textarea id='changeLeftBoard'>${mini.h1}</textarea>");
	var leftBoard = $("#changeLeftBoard").val()
	$("#changeLeftBoard").val(leftBoard.replaceAll("<br>", "\r\n"));
	$("#changeLeftBoard").focus();
}

function inputLeftBoard(){
	var leftBoard = $("#changeLeftBoard").val().replace(/\n/g, "<br>");
	$.ajax({
		url:"changeLeftBoard.do",
		type:"get",
		data:{	"h1"	: leftBoard,
				"uidx"	: ${mini.uidx}
		},
		success: function(data){
			if(data == 1){
			window.location.reload();
			}
			else{
				alert("오류!");
			}
		}
	}); 
}

function noSpace(e){
	$(e).val($(e).val().replace(/ /gi,''));
}



</script>
</head>
<body class="body">
<%-- <c:if test="${device eq 'PC'}"> --%>
<div id="mainBox">
	<div id="leftBox">
		<div id="left-topBox">
			<p>TODAY <span style="color: red">${today}</span></p>
			<p>TOTAL <span>${total}</span></p>
		</div>
		<div id="left-centerBox">
			<br>
			<!-- 프로필 사진 -->
			<c:if test="${mini.miniProfile == null || mini.miniProfile == ''}">
				<img src="<%=request.getContextPath()%>/resources/upload/1.png" id="profile" onclick="clickThis('#0'), clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do','profile')" style="cursor:pointer">
			</c:if>
			<c:if test="${mini.miniProfile != null && mini.miniProfile != ''}">
				<img src="<%=request.getContextPath() %>/miniroomboard2/getProfile.do?originFileName=${mini.miniProfile}" id="profile" onclick="clickThis('#0'), clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do','profile')" style="cursor:pointer">
			</c:if>
			
			<div id="left-boardBox">
				<c:if test="${mini.uidx == login.uidx}">
				<img id="left-board-setting" src="<%=request.getContextPath()%>/resources/images/setting.png" onclick="changeLeftBoard()" style="cursor:pointer">
				</c:if>
				<br>
				<div id="left-board-content">
					<p id="left-board">${mini.h1}</p>
				</div>
				<c:if test="${login != null && mini.uidx != login.uidx}">
					<c:if test="${checkFr eq 'N'}">
						<img src="<%=request.getContextPath()%>/resources/images/person_arrow_left_icon.png" class="addFr" id="addingFr">
					</c:if>
					<c:if test="${checkFr == null}">
						<img src="<%=request.getContextPath()%>/resources/images/addFr.png" class="addFr" id="addFr">
					</c:if>
				</c:if>
				
				
			</div>
			
		</div>
		
	</div>
	<div id="centerBox">
		<iframe id="miniIframe" src="mini-home.do?uidx=${mini.uidx}"></iframe>
	</div>
	<div id="buttonBox">
		<div id="0" class="boardBtn act"  onclick='clickBtn("mini-home.do?uidx=${mini.uidx}"),clickThis(this)'><p>홈</p></div>
		<div id="1" class="boardBtn" onclick="clickBtn('mini-diary.do?uidx=${mini.uidx}'),clickThis(this)"><p>다이어리</p></div>
		<div id="2" class="boardBtn" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=2'),clickThis(this)"><p>사진첩</p></div>
		<div id="3" class="boardBtn" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=3'),clickThis(this)"><p>방명록</p></div>
		<c:if test="${mini.uidx == login.uidx}">
		<div class="boardBtn" onclick='clickBtn("mini-option.do?uidx=${mini.uidx}"),clickThis(this)'><p>관리</p></div>
 		</c:if> 
	</div>
</div>

<c:if test="${login ne null }">
<iframe class="mainFrinedsList" src="mainFriendsList.do?uidx=${login.uidx}"></iframe>
<!-- 내 미니홈피 가기  -->
<button style="top:0;right:0;margin:10px;position:absolute;cursor:pointer;" onclick="myMini(${login.uidx})">
<img style="height:20px;width:20px;"src="<%=request.getContextPath()%>/resources/icon/home.png" ></button>
</c:if>
<script>
//내 미니홈피 가기 
function myMini(writer){
		window.parent.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+writer+"";
}
</script>
</body>
</html>