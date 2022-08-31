<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
*:not(hr){margin: 0;}
h3{
	margin: 1vh 0;
    font-size: 3vh;
}
#title-box{ 
    width:100%; 
    display:flex; 
    justify-content: center;
}

#title{ 
    width:78%; 
    height:4.5vh; 
    border:1px #D8D8D8 solid; 
    border-radius: 5px; 
    padding:0 10px; 
    margin-bottom:10px;
    margin-right: 2vw; 
    font-size:2vw; 
}
.submitBtn{
	float: right;
    width: 15vw;
    height: 4.5vh;
}


.dropdown{
  position : relative;
  display : inline-block;
}
.dropbtn{
  display : block;
  border : 2px solid rgb(94, 94, 94);
  border-radius : 4px;
  background-color: #fcfcfc;
  font-weight: 400;
  color : rgb(124, 124, 124);
  width :20vw;
  text-align: left;
  cursor : pointer;
  font-size : 2vw;
  z-index :1;
  position : relative;
  padding: 0.5vh 0.5vw;
  text-indent: 0.5vw;
}
.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fcfcfc;
  min-width : 20vw;
  border-radius: 8px;
  max-height : 20vh;
  overflow : scroll;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}
.dropdown-content::-webkit-scrollbar{
  width : 5px;
  height : 10px;
}
.dropdown-content::-webkit-scrollbar-thumb{
  border-radius : 2px;
  background-color :rgb(194, 194, 194)
}

.dropdown-content div{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 2vw;
  padding: 1vh 2vw;
  cursor: pointer;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

.dropdown-content.show{
  display : block;
  position: absolute;
  z-index: 9999;
}
.dropbtn_click{
	float: right;
    height: 2.5vh;
    padding-top: 0.25vw;
}
</style>
<c:if test="${category == 1 }">
<script>
$(function(){
    document.querySelector('.dropbtn_click').onclick = ()=>{
      dropdown();
    }
    document.getElementsByClassName('diary-category').onclick = ()=>{
      showMenu(value);
    };
    dropdown = () => {
      var v = document.querySelector('.dropdown-content');
      var dropbtn = document.querySelector('.dropbtn')
      v.classList.toggle('show');
      dropbtn.style.borderColor = 'rgb(94, 94, 94)';
    }

	showMenu=(value)=>{
			var dropbtn_icon = document.querySelector('.dropbtn_icon');
			var dropbtn_content = document.querySelector('.dropbtn_content');
			var dropbtn_click = document.querySelector('.dropbtn_click');
			var dropbtn = document.querySelector('.dropbtn');
			
			dropbtn_icon.innerText = '';
			dropbtn_content.innerText = value;
			dropbtn_content.style.color = '#252525';
			dropbtn.style.borderColor = '#3992a8';
    }
});

window.onclick= (e)=>{
    if(!e.target.matches('.dropbtn_click')){
      var dropdowns = document.getElementsByClassName("dropdown-content");

      var dropbtn_icon = document.querySelector('.dropbtn_icon');
      var dropbtn_content = document.querySelector('.dropbtn_content');
      var dropbtn_click = document.querySelector('.dropbtn_click');
      var dropbtn = document.querySelector('.dropbtn');

      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
  
</script>
</c:if>
<script>
$(function(){
	$('#summernote').summernote({
        height: 380,
        maxHeight: 400,
        toolbar: [
        	  ['style', ['style']],
        	  ['font', ['bold', 'underline', 'clear']],
        	  ['color', ['color']],
        	  ['para', ['ul', 'ol', 'paragraph']],
        	  ['table', ['table']],
        	  ['insert', ['link', 'picture', 'video']],
        	  ['height', ['height']]
        	],
        placeholder: '내용을 입력하세요'
    });
});
</script>

<c:if test="${device eq 'MOBILE'}">
<style>
.topBox{
	position: sticky;
    z-index: 111;
    background-color: #212529;
    width: 100%;
    height: 10vh;
}
.goHome{
	width: 16vw;
    height: 8vh;
    margin: 1vh 2vw;
}
.inputBox{
	display: inline-block;
    position: absolute;
    width: 50vw;
    left: 25vw;
}
.searchInput{
    width: 100%;
    height: 5vh;
    line-height: 5vh;
    font-size: 5vw;
    padding-left: 1vw;
    font-style: oblique;
    display: inline;
    outline: none;
    box-sizing: border-box;
    color: black;
    margin: 2.5vh 0;
    border: 0;
}

.friendsBox{
    border-bottom: 1px solid #e5e5e5;
    text-indent: 3px;
    width: 100%;
    height: 5vh;
    line-height: 5vh;
    font-size: 5vw;
    padding: 1vh 0;
    padding-left: 1vw;
    cursor: pointer;
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
    max-height: 30vh;
    width: 50vw;
    background-color: white;
    position: absolute;
    top: 7.5vh;
    left: 25vw;
}
.show{
	display:block !important;
}
.inputBox{
	display: inline-block;
    position: absolute;
    width: 50vw;
    left: 25vw;
}
.loginBox{
    float: right;
    font-size: 4vw;
    line-height: 8vh;
    margin: 1vh 3vw;
    color: white;
}

/* 내용부분 추가 css */
h3{
	text-align: center;
}
.submitBtnBox{
    width: 60vw;
    margin: 0 auto;
    display: flex;
}
.submitBtn{
	line-height: 4.5vh;
    float: inherit;
    width: 100%;
    margin: 1vh 1vw;
    font-size: 4vw;
    border-radius: 2vw;
    background-color: white;
    border: 2px solid #8dc38b;
}
#title-box{
    width: 60vw;
    margin: 0 auto;
    font-size: 4vw;
    line-height: 6vh;
    height: 6vh;
}
.secret{
	height: 6vh;
    width: 4vh;
    margin: 0 1vw;
}

</style>
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
</c:if>

</head>
<body>

<c:if test="${device eq 'MOBILE'}">
<div class="topBox">
	<img class="goHome" src="<%=request.getContextPath()%>/resources/images/pea-move-unscreen.gif" onclick="location.href='<%=request.getContextPath()%>/home.do'">
	<c:if test="${login == null}">
	<span class="loginBox" onclick="location.href='<%=request.getContextPath()%>/user/login.do'">login</span>
	</c:if>
	
	<c:if test="${login ne null}">
	<div class="inputBox">
	  <input type="text" placeholder="친구네 가기" class="searchInput" onkeyup="searchFriends(this,${login.uidx})">
	</div>
	<c:if test="${list.size() == 0}">
		<div class="friendsBox" style="color: darkgray; width: 100%">친구가 없습니다</div>
	</c:if>
	<c:if test="${list.size() > 0}">
		<div id="listFullBox" class="">
		<c:forEach var="vo" items="${list}">
			<c:if test="${vo.uidx == login.uidx}">
				<div class="friendsBox boxOn" onclick="goMini(${vo.bfidx})">
					${vo.name}<span class="fname boxOn">[${vo.bfname}]</span>
				</div>
			</c:if>
			<c:if test="${vo.bfidx == login.uidx}">
				<div class="friendsBox boxOn" onclick="goMini(${vo.uidx})">
					${vo.name}<span class="fname boxOn">[${vo.uname}]</span>
				</div>
			</c:if>
		</c:forEach>
		</div>
	</c:if>
	
	</c:if>
	<c:if test="${login != null && login.uidx != mini.uidx}">
	<span class="loginBox" onclick="location.href='<%=request.getContextPath()%>/mini/main.do?uidx=${login.uidx}'">MyHome</span>
	</c:if>
	<c:if test="${login != null && login.uidx == mini.uidx}">
	<span class="loginBox" onclick="location.href='<%=request.getContextPath()%>/user/logoutMini.do?uidx=${mini.uidx}'">logout</span>
	</c:if>
</div>
</c:if>

<form action="<%=request.getContextPath()%>/miniroomboard2/diary_write.do" method="post">
	<h3>글쓰기</h3>
	<hr>
	<div class="submitBtnBox">
	<button class="submitBtn" type="submit">작성</button>
	<c:if test="${device eq 'MOBILE'}">
	<button class="submitBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/mini/main.do?uidx=${mini.uidx}'">취소</button>
	</c:if>
	</div>
	
	<div id="title-box">
		<!-- <input id="title" name="title" placeholder="제목을 입력해 주세요"> -->
		비밀글<input type="checkbox" class="secret" name="secret" value="Y">
		<c:if test="${category == 1}">
		<div class="dropdown">
			<button class="dropbtn" type="button" >
				<span class="dropbtn_icon"></span>
				<span class="dropbtn_content">카테고리1d1</span>
				<img class="dropbtn_click" src="<%=request.getContextPath()%>/resources/images/arrow-down.png" onclick="dropdown()">
			</button>
			<div class="dropdown-content">
				<c:forEach var="cate" items="${subcategory}">
					<div class="diary-category" onclick="showMenu(this.innerText)">${cate.subcategory}</div>
				</c:forEach>
			</div>
		</div>
		</c:if>
	</div>
	<textarea id="summernote" name="content"></textarea>
	<input type="hidden" name="category" value=${category }>
</form>
</body>
</html>