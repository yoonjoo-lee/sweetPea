<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
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
	padding: 10px 0;
    border-bottom: 1px solid darkgray;
    text-indent: 10px;
    width: 60%;
    margin: 0 auto;
    font-size: 1em;
}

.listBtnBox{
	float: right;
}

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
:root {
  --button-color: #ffffff;
  --button-bg-color: #0d6efd;
  --button-hover-bg-color: #025ce2;
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
	font-size: 0.86rem;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	border: none;
	border-radius: 4px;
	display: inline-block;
	width: auto;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}
.btn-change{
  --button-bg-color: #28a745;
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
</style>
</head>
<body>
<h3>친구목록</h3>
<div class="inputBox">
  <input type="text" placeholder="이름 찾기" class="searchInput">
  <button class="searchBtn" type="button">검색</button>
</div>
<hr>

<c:if test="${list.size() == 0}">
	<div class="friendsBox" style="color: darkgray; width: 100%">친구가 없습니다</div>
</c:if>
<c:if test="${list.size() > 0 }">
	<c:forEach var="vo" items="${list}">
		<c:if test="${vo.uidx == login.uidx}">
			<div class="friendsBox">${vo.name}(${vo.bfname})
				<span class="listBtnBox">
					<button class="btn-change">일촌명 변경</button>
					<button class="btn-delete">삭제하기</button>
				</span>
			</div>
		</c:if>
		<c:if test="${vo.bfidx == login.uidx}">
			<div class="friendsBox">${vo.name}(${vo.uname})
				<span class="listBtnBox">
					<button class="btn-change">일촌명 변경</button>
					<button class="btn-delete">삭제하기</button>
				</span>
			</div>
		</c:if>
			
	</c:forEach>
</c:if>
</body>
</html>