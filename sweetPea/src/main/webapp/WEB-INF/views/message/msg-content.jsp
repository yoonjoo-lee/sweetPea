<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<style>
	h3,ul{
		text-align: center;
		margin: 0;
	}
	h3{
		margin-bottom: 0.3em;
	}
	ul{
		list-style-type: none;	
		padding: 0;
		width: 100%;
	}
	li{
		display: inline-block;
		font-size: 1.1em;
		
	}
	.header-ul{
		background-color: #52C3BD;
		color: white;
		padding: 0.2em 0;
	}
	.content-ul{
		background-color: #e5e5e5;
		padding: 0.5em 0;
		font-size: 0.8em;
		margin-top: 0.2em;
	}
	ul>li:first-child {width: 25%;}
	ul>li:nth-child(2) {width: 45%}
	ul>li:last-child {width: 25%;}
	.btnBox>input{
		float: right;
		margin-left: 0.5em;
	}
	img{
		position: absolute;
		top: 0;
		left: 0;
		width: 1.5em;
		height: 1.5em;
		margin: 0.5em;
		cursor: pointer;
	}
</style>
</head>
<body>
<img alt="뒤로가기" src="<%=request.getContextPath()%>/resources/images/reply_message_icon.png" onclick="location.href='main.do?uidx='+${login.uidx}">
<h3>쪽지내용</h3>
<div>
	<ul class="header-ul">
		<li>${vo.writer}</li>
		<li>${vo.title}</li>
		<li>${vo.datetime}</li>
	</ul>
	${vo.content}
</div>
</body>
</html>