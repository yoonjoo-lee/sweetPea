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
	#img{
		width: 30%;
		height: 30%;
		margin: 0 auto;
		display: block;
	}
	h4{
		text-align: center;
	}
	.inputBox{
		width: 60%;
		margin: 0 auto;
	}
	.inputIdx{
		font-size: 1em;
		width: 100%;
		height: 2em;
		border: 1px solid black;
		margin: 1em 0;
	}
	.inputIdx>p{
		display: inline-block;
		margin: 0.3em 0.8em;
	}
	.aBox{
		float: right;
	}
	.aBox>a{
		color: inherit;
		text-decoration: none;
	}
</style>
</head>
<body>
	<br>
	<c:if test="${mini==0 }"><img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img"></c:if><!-- 메인에서 들어갈 경우만 출력 -->
	<h4>회원 정보</h4>
	<br>
	<div class="inputBox">
		<div class = "inputIdx"><p>이름 :</p>${vo.name}</div>
		<div class = "inputIdx"><p>성별 :</p>${vo.gender}</div>
		<div class = "inputIdx"><p>ID :</p>${vo.id}</div>
		<div class = "inputIdx"><p>생년월일 :</p>${vo.birth}</div>
		<div class = "inputIdx"><p>Phone :</p>${vo.phone}</div>
		<div class = "inputIdx"><p>이메일 :</p>${vo.email}</div>
		<div class = "inputIdx"><p>주소 :</p>${vo.addr}</div>
		<span class = "aBox">
		<a href="myPage-modify.do?uidx=${login.uidx}&mini=${mini}">회원정보 수정</a> |
		<a href="myPage-changePwd.do?uidx=${login.uidx}&mini=${mini}">비밀번호 수정</a> |
		<a href="myPage-del.do">탈퇴하기</a> 
		</span>
	</div>
</body>
</html>