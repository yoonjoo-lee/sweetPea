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
h3{
	display: inline-block;
    text-indent: 1em;
    margin: 0;
}
.inputBox{
    display: inline-block;
    float: right;
}
.searchInput{
	width:70%;
    height:100%;
    border:none;
    font-size:0.8em;
    padding-left: 5px;
    font-style: oblique;
    display:inline;
    outline:none;
    box-sizing: border-box;
    color:black;
    border: 2px solid lightgray;
}
.searchBtn{
	width: 30%;
    height:100%;
    border:none;
    font-size:0.8em;
    outline:none;
    display:inline;
    margin-left: -10px;
    box-sizing: border-box;
    background-color: lightgray;
    cursor: pointer;
    padding-bottom: 3px;
}
.searchBtn:hover{
	background-color: #e9f0dd;
}

.friendsBox{
	padding: 1vh 0;
    border-bottom: 1px solid #e5e5e5;
    text-indent: 10px;
    width: 100%;
    height: 4vh;
    font-size: 1em;
    cursor: pointer;
    line-height: 4vh;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.fname{
	color: gray;
	font-size: 0.8em;
}
.fimg{
	width: 4vh;
	float: left;
    height: 100%;
    border-radius: 25px;
}
.listBtnBox{
	display: none;
	position: absolute;
}

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
:root {
  --button-color: #ffffff;
  /* --button-bg-color: #0d6efd;
  --button-hover-bg-color: #025ce2; */
}

.listBtnBox>button{
	-webkit-appearance: none;
  	-moz-appearance: none;
  	appearance: none;
	background: var(--button-bg-color);
	color: var(--button-color);
	margin: 0;
	padding: 0.2em 0.5em;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 2vw;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	border: none;
	display: block;
	width: 18vh;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}
.btn-change,.btn-mini{
  --button-bg-color: #7dc75e;
  --button-hover-bg-color: #218838;
}
.btn-delete {
  --button-bg-color: #dc3545;
  --button-hover-bg-color: #c82333;
}
button:active,
button:hover,
button:focus {
  background: var(--button-hover-bg-color);
  outline: 0;
}
button:disabled {
  opacity: 0.5;
}

#listFullBox{
	overflow: scroll;
	overflow-x: hidden;
    height: 80vh;
    width: 35%;
    margin: 0 auto;
}
body{
	font-family: ${myMini.font};
}
</style>

<script>

function goMini($uidx){
	window.parent.parent.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+$uidx;
}

function delBtn($fidx){
	var $uidx = ${login.uidx};
	Swal.fire({
		html: '<span style="color: red">친구삭제</span> 하시겠습니까?',
		icon: 'question',
		showCancelButton: true,
		confirmButtonText: '네',
		cancelButtonText: '아니요',
		position: 'top',
		preConfirm: () => {
			$.ajax({
				url: '../mini/delFriends.do',
				type: 'get',
				data: {"uidx": $uidx, "bfidx": $fidx},
				success: async function(){
					await Swal.fire({
						title: '삭제완료',
						icon: 'success',
						position: 'top'
					});
					window.location.reload();
				},
				error: function(){
					alert("오류!");
				}
			})
		}
	});
}

async function changeName($myNicName,$fName,$fNicName,$fidx){
	var $uidx = ${login.uidx};
	const { value: formValues } = await Swal.fire({
		  title: '친구명을  변경',
		  html:
			"<p>본인 일촌명</p>" +
		    "<input id='swal-input1' class='swal2-input' onkeyup='noSpace(this)' value='"+$myNicName+"'>" +
		    "<p style='margin-top: 1em'>"+$fName+"님의 일촌명</p>" +
		    "<input id='swal-input2' class='swal2-input' onkeyup='noSpace(this)' value="+$fNicName+">",
		  focusConfirm: false,
		  showCancelButton: true,
		  confirmButtonText: "변경",
		  cancelButtonText: "취소",
		  preConfirm: () => {
		    return [
		      document.getElementById('swal-input1').value,
		      document.getElementById('swal-input2').value
		    ]
		  }
		})
		
		if (formValues) {
					$myNicName = formValues[0];
					$fNicName = formValues[1];
					var $arrow = '<%=request.getContextPath()%>/resources/images/rocket_filled_icon.png';
					$.ajax({
						url:"changeFriends.do",
						type:"get",
						data:{"uname" : $myNicName
							, "bfname" : $fNicName
							, "uidx" : $uidx
							, "bfidx" : $fidx
							},
						success: async function(data){
							await Swal.fire({
								title: '<span style="color: red">변경</span> 되었습니다.',
								icon: 'success'
							})
							window.location.reload();
						}
					});
				}
}
</script>
<script>

$(function(){
	$(document).click(function(e){
		if(!$(e.target).hasClass('boxOn')){
			$(".listBtnBox").css("display","none");
		}
	});
}) 

function onBtn(e,evnet){
	var x = event.pageX;
	var y = event.pageY; 
	var $btn = '#listBtn'+e;
	$(".listBtnBox").css("display","none");
	$($btn).css({'left': x+5,
		 'top': y,
		 'display': 'block'
		});
}

function searchFriends(e,uidx){
	var $name = e.value;
	var values = [];
	 $.ajax({
		url: 'searchFriends.do',
		type: 'get',
		data: {"name": $name,"uidx": uidx},
		success: function(retVal){
			if(retVal.code == "OK"){
				values = retVal.list2;
				$("#listFullBox").empty();
				$.each(values, function( index, value ) {
					console.log(value.bfidx);
                    if (value.uidx == ${login.uidx}){
                    	$("#listFullBox").append("<div class='friendsBox boxOn' onclick='onBtn("+value.bfidx+",this)'>"
                    				+"<img src='"+value.profile+"' class='fimg boxOn'>"
                    				+""+value.name+"<span class='fname boxOn'>["+value.bfname+"]</span>"
                    				+"<div class='listBtnBox' id='listBtn"+value.bfidx+"'>"
                    				+"<button class='btn-mini' onclick='goMini("+value.bfidx+")'>미니홈피 가기</button>"
                					+"<button class='btn-change' id='changeBtn' onclick=changeName('"+value.uname+"','"+value.name+"','"+value.bfname+"',"+value.bfidx+")>친구명 변경</button>"
                					+"<button class='btn-delete' onclick='delBtn("+value.bfidx+")'>삭제하기</button>"
                    				+"</div></div>");
                    }
                    else if (value.bfidx == ${login.uidx}){
                    	$("#listFullBox").append("<div class='friendsBox boxOn' onclick='onBtn("+value.uidx+",this)'>"
                    				+"<img src='"+value.profile+"' class='fimg boxOn'>"
                    				+""+value.name+"<span class='fname boxOn'>["+value.uname+"]</span>"
                    				+"<div class='listBtnBox' id='listBtn"+value.uidx+"'>"
                    				+"<button class='btn-mini' onclick='goMini("+value.uidx+")'>미니홈피 가기</button>"
                					+"<button class='btn-change' onclick=changeName('"+value.bfname+"','"+value.name+"','"+value.uname+"',"+value.uidx+")>친구명 변경</button>"
                					+"<button class='btn-delete' onclick='delBtn("+value.uidx+")'>삭제하기</button>"
                    				+"</div></div>");
                    }
                 });
			}
			else{
				alert("실패");
			}
		},
		error:function(){
			alert("오류");
		}
	}) 
	
}

function noSpace(e){
	$(e).val($(e).val().replace(/ /gi,''));
}
</script>
</head>
<body>
<h3>친구목록</h3>
<div class="inputBox">
  <input type="text" placeholder="이름 찾기" class="searchInput" onkeyup="searchFriends(this,${login.uidx})">
  <button class="searchBtn" type="button">검색</button>
</div>
<hr>

<c:if test="${list.size() == 0}">
	<div class="friendsBox" style="color: darkgray; width: 100%">친구가 없습니다</div>
</c:if>
<c:if test="${list.size() > 0}">
	<div id="listFullBox">
	<c:forEach var="vo" items="${list}">
		<c:if test="${vo.uidx == login.uidx}">
			<div class="friendsBox boxOn" onclick="onBtn('${vo.bfidx},this')">
				<img src="${vo.profile}" class="fimg boxOn">
				${vo.name}<span class="fname boxOn">[${vo.bfname}]</span>
				<div class="listBtnBox" id="listBtn${vo.bfidx}">
					<button class="btn-mini" onclick="goMini(${vo.bfidx})">미니홈피 가기</button>
					<button class="btn-change" onclick="changeName('${vo.uname}','${vo.name}','${vo.bfname}',${vo.bfidx})">친구명 변경</button>
					<button class="btn-delete" onclick="delBtn(${vo.bfidx})">삭제하기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${vo.bfidx == login.uidx}">
			<div class="friendsBox boxOn" onclick="onBtn('${vo.uidx},this')">
				<img src="${vo.profile}" class="fimg boxOn">
				${vo.name}<span class="fname boxOn">[${vo.uname}]</span>
				<div class="listBtnBox" id="listBtn${vo.uidx}">
					<button class="btn-mini" onclick="goMini(${vo.uidx})">미니홈피 가기</button>
					<button class="btn-change" onclick="changeName('${vo.bfname}','${vo.name}','${vo.uname}',${vo.uidx})">친구명 변경</button>
					<button class="btn-delete" onclick="delBtn(${vo.uidx})">삭제하기</button>
				</div>
			</div>
		</c:if>
	</c:forEach>
	</div>
</c:if>
</body>
</html>