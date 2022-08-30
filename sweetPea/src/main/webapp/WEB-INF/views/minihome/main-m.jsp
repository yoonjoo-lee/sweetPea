<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>SweetPea</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(function(){
	$("#addFr").click(async function(){
		const { value: formValues } = await Swal.fire({
			  title: '친구 신청을 하시겠습니까?',
			  html:
				'<p>상대방 일촌명</p>' +
			    '<input id="swal-input1" class="swal2-input" placeholder="상대방의 일촌명을 입력해주세요">' +
			    '<p style="margin-top: 1em">상대방에게 나의 일촌명</p>' +
			    '<input id="swal-input2" class="swal2-input" placeholder="상대방에게 표시될 나의 일촌명을 입력해주세요">',
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
				var $uidx = '${login.uidx}';
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
								, "uidx" : $uidx
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

<style>
body{
    margin: 0;
    padding: 0;
    position: relative;
}
#mainBox{
	margin: 0;
    margin-bottom: 8vh;
    padding-top: 10vh;
}
/* 프로필  */
#profile{
    position: absolute;
    display: block;
    width: 36vw;
    height: 36vw;
    border-radius: 36vw;
    left: 32vw;
    top: 42vw;
    background-color: #e2e2e2;
}

/* 하단 메뉴바 */
#m-buttonBox { 
	position: fixed; 
	bottom: 0; 
	left: 0; 
	width: 100%; 
	height: 8vh; 
	z-index:100; 
	border-top: 1px solid black; 
	background-color: white; 
}
.m-boardBtn { 
	float: left;
    width: 25%;
    height: 7vh;
    text-align: center;
    border-top: 1vh solid white;
    background-color: white;
}
#m-buttonBox > div > img {
	height: 4vh;
    margin: 1.5vh 0;
    width: 30%;
}

/* 프로필 글귀 변경 아이 */
#left-board-setting{
	width: 70px;
	height: 70px;
}

.act2{
	background-color: gainsboro;
    border-top: 1vh solid black;
}

.backBox{
	background-color: #40adad;
	background-image: url("<%=request.getContextPath()%>/item/imageView.do?originFileName=${myMini.background }");
    background-size: cover;
    background-repeat: no-repeat;
    height: 60vw;
    position: relative;
    margin-bottom: 20vw;
}
#visitBox{
    position: absolute;
    width: 100%;
    top: 60vw;
}
#visitBox>p{
	font-size: 3vw;
    width: 30vw;
    display: inline-block;
    margin: 1vw 2vw;
}
#visitBox>p:last-child{
	float: right;
	text-align: right;
}

#h1Box{
    width: 50%;
    margin: 0 auto;
    border: 1px solid black;
    border-radius: 25px;
    position: relative;
}
#h1-setting{
	position: absolute;
    right: 1vw;
    top: 1vw;
    width: 3vw;
    height: 3vw;
}
#h1-board{
	padding-left: 1vw;
	font-size: 3vw;
}

.goHome{
	width: 16vw;
    height: 8vh;
    margin: 1vh 2vw;
}

.miniRoomBox{
    width: 100%;
    height: 60vw;
    margin: 2vh auto;
    background-color: gray;
}

.loginBox{
    float: right;
    font-size: 4vw;
    line-height: 8vh;
    margin: 1vh 3vw;
    color: white;
}
.upDateBox{
	background-color: white;
	padding-top: 0.5vh;
    padding-bottom: 0.5vh;
}
.upDateBox>p{
    font-size: 5vw;
    margin: 3vw 2vw;
}
.list>ul{
	font-size: 4vw;
	margin-left: 3vw;
}

.list-box>p{
	margin: 0;
}

#addFriendBox{
    position: fixed;
    bottom: 8vh;
    right: 0;
}
.friendImage{
	width: 7vw;
	height: 7vw;
	border-radius:100%;
	background-size: 80%;
    background-repeat: no-repeat;
    background-position: center;
    background-color: white;
    margin: 1vh;
}
#addingFr{
	background-image: url("<%=request.getContextPath()%>/resources/images/person_arrow_left_icon.png");
}
#addFr{
	background-image: url("<%=request.getContextPath()%>/resources/images/addFr.png");
}

.topBox{
	position: fixed;
    z-index: 111;
    background-color: #212529;
    width: 100%;
    height: 10vh;
}
.mainFrinedsList{
	position: absolute;
    border: 0;
    width: 50vw;
    left: 25vw;
    top: 2.5vh;
}

</style>

<script>
function clickBtn(link){
	<c:if test="${mini.uidx == login.uidx}">
	$("#mainBox").load(link);
	</c:if>
}
function clickThis2(e){
	$(".m-boardBtn").removeClass('act2');
	$(e).addClass('act2');
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

$(function(){
	var $uidx = '${login.uidx}';
	if('${login}' != null && $uidx == ${mini.uidx}){
		$(".m-boardBtn").css("width","20%");
	}
	
	<%-- $.ajax({
		url: "<%=request.getContextPath()%>/miniroomboard2/miniRoomBox.do",
		type: "GET",
		success: function(html){
			$(".miniRoomBox").html(html);
		},
		error: function(){
		}
	}); --%>
	
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
})
</script>

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

</head>
<body class="body">
<div class="topBox">
	<img class="goHome" src="<%=request.getContextPath()%>/resources/images/pea-move-unscreen.gif" onclick="location.href='<%=request.getContextPath()%>/home.do'">
	<c:if test="${login == null}">
	<span class="loginBox" onclick="location.href='<%=request.getContextPath()%>/user/login.do'">로그인</span>
	</c:if>
	<c:if test="${login != null}">
	<iframe class="mainFrinedsList" src="mainFriendsList.do?uidx=${login.uidx}"></iframe>
	</c:if>
	<c:if test="${login != null && login.uidx != mini.uidx}">
	<span class="loginBox" onclick="location.href='<%=request.getContextPath()%>/mini/main.do?uidx=${login.uidx}'">MyHome</span>
	</c:if>
	<c:if test="${login != null && login.uidx == mini.uidx}">
	<span class="loginBox" onclick="location.href='<%=request.getContextPath()%>/user/logoutMini.do?uidx=${mini.uidx}'">로그아웃</span>
	</c:if>
</div>
<div id="mainBox">
	<div class="backBox">
		<!-- 프로필 사진 -->
		<c:if test="${mini.miniProfile == null}">
			<img src="<%=request.getContextPath()%>/resources/upload/1.png" id="profile" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do?uidx=${login.uidx}')">
		</c:if>
		<c:if test="${mini.miniProfile != null}">
			<img src="<%=request.getContextPath() %>/miniroomboard2/getProfile.do?originFileName=${mini.miniProfile}" id="profile" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do?uidx=${login.uidx}')">
		</c:if>
		<div id="visitBox">
			<p>TODAY <span style="color: red">${today}</span></p>
			<p>TOTAL <span>${total}</span></p>
		</div>
	</div><br>
	<div class="miniRoomBox"></div><br>
	<div class="upDateBox">
		<p>Update</p>
		<hr>
		<div id="homeList"></div>
	</div>
	<%-- <div id="h1Box">
		<c:if test="${mini.uidx == login.uidx}">
		<img id="h1-setting" src="<%=request.getContextPath()%>/resources/images/setting.png" onclick="changeLeftBoard()">
		</c:if>
		<div id="left-board-content">
			<p id="h1-board">${mini.h1}</p>
		</div>
		<c:if test="${login != null && mini.uidx != login.uidx}">
			<c:if test="${checkFr eq 'N'}">
				<img src="<%=request.getContextPath()%>/resources/images/person_arrow_left_icon.png" class="addFr" id="addingFr">
			</c:if>
			<c:if test="${checkFr == null}">
				<img src="<%=request.getContextPath()%>/resources/images/addFr.png" class="addFr" id="addFr">
			</c:if>
		</c:if>
	</div> --%>		
			
<%-- 			<div id="left-boardBox">
				<c:if test="${mini.uidx == login.uidx}">
				<img id="left-board-setting" src="<%=request.getContextPath()%>/resources/images/setting.png" onclick="changeLeftBoard()">
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
	<div>
		<h3>${mini.h2}</h3>
	</div>
	<div id="leftBox">
			
	</div>
	<div id="centerBox">
		<iframe id="miniIframe" src="mini-home.do?uidx=${mini.uidx}"></iframe>
		
	</div>
--%>

</div> 
<div id="addFriendBox">
	<c:if test="${login != null && mini.uidx != login.uidx}">
		<c:if test="${checkFr eq 'N'}">
			<%-- <img src="<%=request.getContextPath()%>/resources/images/person_arrow_left_icon.png" class="addFr" id="addingFr"> --%>
			<div class="friendImage" id="addingFr"></div>
		</c:if>
		<c:if test="${checkFr == null}">
			<div class="friendImage" id="addFr"></div>
			<%-- <img src="<%=request.getContextPath()%>/resources/images/addFr.png" class="addFr" id="addFr"> --%>
		</c:if>
	</c:if>
</div>

	<div id="m-buttonBox">
		<div class="m-boardBtn act2" onclick="location.href='<%=request.getContextPath()%>/mini/main.do?uidx=${mini.uidx}'"><img src="<%=request.getContextPath()%>/resources/icon/home.png"></div>
		<div class="m-boardBtn" onclick="clickBtn('mini-diary.do?uidx=${mini.uidx}'),clickThis2(this)"><img src="<%=request.getContextPath()%>/resources/icon/diary.png"></div>
		<div class="m-boardBtn" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=2'),clickThis2(this)"><img src="<%=request.getContextPath()%>/resources/icon/photo.png"></div>
		<div class="m-boardBtn" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=3'),clickThis2(this)"><img src="<%=request.getContextPath()%>/resources/icon/guestbook.png"></div>
		<c:if test="${mini.uidx == login.uidx}">
		<div class="m-boardBtn" onclick='clickBtn("mini-option.do?uidx=${mini.uidx}"),clickThis2(this)'><img src="<%=request.getContextPath()%>/resources/icon/setting.png"></div>
 		</c:if> 
	</div>

</body>
</html>