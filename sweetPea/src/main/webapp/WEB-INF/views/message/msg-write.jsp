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
	h3{
		text-align: center;
	}
	textarea{
		margin: 0 auto;
		display: block;
		width: 90%;
		text-indent: 0.5em;
	}
	input{
		width: 90%;
		display: block;
		margin: 0.8em auto;
		height: 2em;
	}
</style>
</head>
<body>
<h3>쪽지쓰기</h3>
<form id="frm" action="write.do" method="post">
	<input type="text" name="title" placeholder="제목">
	<textarea rows="10" cols="" name="content"></textarea>
	<input type="submit" value="입력">
	<input type="hidden" name="uidx" value="${login.uidx}">
	<input type="hidden" name="writer" value="${login.name}">
</form>
</body>
</html>