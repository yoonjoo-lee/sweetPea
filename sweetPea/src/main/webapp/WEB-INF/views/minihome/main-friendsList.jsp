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
.searchInput{
    width: 100%;
    height: 25px;
    font-size: 0.8em;
    padding-left: 5px;
    font-style: oblique;
    display: inline;
    outline: none;
    box-sizing: border-box;
    color: black;
    border: 1px solid lightgray;
}

.friendsBox{
	padding: 3px 0;
    border-bottom: 1px solid #e5e5e5;
    text-indent: 3px;
    width: 100%;
    height: 23px;
    font-size: 14px;
    cursor: pointer;
    line-height: 23px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}

.fname{
	color: gray;
	font-size: 0.8em;
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
    font-size: 12px;
    font-weight: 400;
    text-align: center;
    text-decoration: none;
    border: none;
    display: block;
    width: 90px;
    height: 25px;
    box-shadow: 0 4px 6px -1px rgb(0 0 0 / 10%), 0 2px 4px -1px rgb(0 0 0 / 6%);
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
	display: none;
	overflow: scroll;
    overflow-x: hidden;
    max-height: 90px;
    width: 100%;
}
body{
	font-family: ${myMini.font};
	margin: 0;
    overflow: hidden;
}
.show{
	display:block !important;
}
</style>

<script>
function goMini($uidx){
	window.parent.parent.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+$uidx;
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
                    				+""+value.name+"<span class='fname boxOn'>["+value.bfname+"]</span>"
                    				+"<div class='listBtnBox' id='listBtn"+value.bfidx+"'>"
                    				+"<button class='btn-mini' onclick='goMini("+value.bfidx+")'>미니홈피 가기</button>"
                    				+"</div></div>");
                    }
                    else if (value.bfidx == ${login.uidx}){
                    	$("#listFullBox").append("<div class='friendsBox boxOn' onclick='onBtn("+value.uidx+",this)'>"
                    				+""+value.name+"<span class='fname boxOn'>["+value.uname+"]</span>"
                    				+"<div class='listBtnBox' id='listBtn"+value.uidx+"'>"
                    				+"<button class='btn-mini' onclick='goMini("+value.uidx+")'>미니홈피 가기</button>"
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

<script>
$(function(){
	$(".inputBox").click(function(){
		$("#listFullBox").addClass('show');
	})
	$('html',parent.document).click(function(e) {   
	if(!$(e.target).hasClass("searchInput") && !$(e.target).hasClass("friendsBox") && !$(e.target).hasClass("fname")) {
		$("#listFullBox").removeClass('show');
	}
	});
})
</script>
</head>
<body>
<div class="inputBox">
  <input type="text" placeholder="친구 찾기" class="searchInput" onkeyup="searchFriends(this,${login.uidx})">
</div>
<c:if test="${list.size() == 0}">
	<div class="friendsBox" style="color: darkgray; width: 100%">친구가 없습니다</div>
</c:if>
<c:if test="${list.size() > 0}">
	<div id="listFullBox" class="">
	<c:forEach var="vo" items="${list}">
		<c:if test="${vo.uidx == login.uidx}">
			<div class="friendsBox boxOn" onclick="onBtn('${vo.bfidx},this')">
				${vo.name}<span class="fname boxOn">[${vo.bfname}]</span>
				<div class="listBtnBox" id="listBtn${vo.bfidx}">
					<button class="btn-mini" onclick="goMini(${vo.bfidx})">미니홈피 가기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${vo.bfidx == login.uidx}">
			<div class="friendsBox boxOn" onclick="onBtn('${vo.uidx},this')">
				${vo.name}<span class="fname boxOn">[${vo.uname}]</span>
				<div class="listBtnBox" id="listBtn${vo.uidx}">
					<button class="btn-mini" onclick="goMini(${vo.uidx})">미니홈피 가기</button>
				</div>
			</div>
		</c:if>
	</c:forEach>
	</div>
</c:if>

</body>
</html>