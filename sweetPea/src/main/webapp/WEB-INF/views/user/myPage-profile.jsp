<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<h4>프로필 변경</h4>
	<br>
	<form id="profileUpdate" action="/user/profile.do?uidx=${login.uidx}" method="post" enctype="multipart/form-data">
	<div class="inputBox">
		<input type="file" name="profileImgUrl" id="profileImgUrl">
	</div>
	</form>
</body>
</html>