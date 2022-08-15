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
	body{
	background-color: #fff;
	}
	
	/* 프로필  */
	#profile{
		width:300px;
		height:300px;
	}
	/* 하단 메뉴바 */
	#buttonBox { 
		position: fixed; 
		bottom: 0px; 
		left: 0px; 
		width: 100%; 
		height: 160px; 
		z-index:100; 
		border-top: 1px solid black; 
		background-color: white; 
	}
	#buttonBox > div { 
		float: left;
		width: 20%; 
		height: 100%; 
		text-align: center; 
		padding-top: 13px;
		margin-top:20px;
	}
	#buttonBox > div > img {
		height:60px;
		width: 60px;
	}
	
	/* 프로필 글귀 변경 아이 */
	#left-board-setting{
		width: 70px;
		height: 70px;
	}
</style>
</c:if>
<script>
function clickBtn(link){
	$("#miniIframe").attr("src",link);
	$option = 'mini-option.do?uidx=${mini.uidx}';
	if(link == $option){
		$("#miniIframe").attr("scrolling","no");
		$("#miniIframe").css({
			'left': '0',
		    'top': '0',
		    'position': 'fixed',
		    'width': '72vw',
		    'height': '98vh',
		    'margin': '1vh 1vw',
			'border-radius': '30px',
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
</script>
</head>
<body class="body">
<div id="mainBox">
	<div id="leftBox">
		<div id="left-topBox">
			<p>TODAY <span style="color: red">${mini.today}</span></p>
			<p>TOTAL <span>${mini.total}</span></p>
		</div>
		<div id="left-centerBox">
			<br>
			<!-- 프로필 사진 -->
			<c:if test="${mini.miniProfile == null}">
				<img src="<%=request.getContextPath()%>/resources/upload/1.png" id="profile" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do'),clickThis(this)">
			</c:if>
			<c:if test="${mini.miniProfile != null}">
				<img src="<%=request.getContextPath() %>/miniroomboard2/getProfile.do?originFileName=${mini.miniProfile}" id="profile" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do'),clickThis(this)">
			</c:if>
			
			<div id="left-boardBox">
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
		
	</div>
	<div id="centerBox">
		<iframe id="miniIframe" src="mini-home.do?uidx=${mini.uidx}"></iframe>
	</div>
	<div id="buttonBox">
		<div class="boardBtn act"  onclick='clickBtn("mini-home.do?uidx=${mini.uidx}"),clickThis(this)'><img src="<%=request.getContextPath()%>/resources/icon/home.png"></div>
		<div class="boardBtn" onclick="clickBtn('mini-diary.do?uidx=${mini.uidx}'),clickThis(this)"><img src="<%=request.getContextPath()%>/resources/icon/diary.png"></div>
		<div class="boardBtn" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=2'),clickThis(this)"><img src="<%=request.getContextPath()%>/resources/icon/photo.png"></div>
		<div class="boardBtn" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=3'),clickThis(this)"><img src="<%=request.getContextPath()%>/resources/icon/guestbook.png"></div>
		<c:if test="${mini.uidx == login.uidx}">
		<div class="boardBtn" onclick='clickBtn("mini-option.do?uidx=${mini.uidx}"),clickThis(this)'><img src="<%=request.getContextPath()%>/resources/icon/setting.png"></div>
 		</c:if> 
	</div>
</div>

<div class="box-container">
  <div class="icon-commentary">
    <div class="face arrow"></div>
    <div class="face below"></div>
    <div class="face long front"></div>
    <div class="face long back"></div>
    <div class="face high-top"></div>
    <div class="face short-down"></div>
    <div class="face high bottom"></div>

    <!-- peak tip -->
    <div class="peak">
      <div></div>
      <div></div>
    </div>
  </div>
</div>


</body>
</html>