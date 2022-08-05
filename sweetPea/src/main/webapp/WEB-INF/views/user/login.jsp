<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<link href="<%=request.getContextPath()%>/resources/css/login.css" rel="stylesheet" />
<c:if test="${device eq 'MOBILE' }">
	<style>
		.box{
			width: 100%;
		}
	</style>
	</c:if>
</head>
<body>
<header id="header"></header>
<br><br>
<div class="box">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<form action="login.do" method="post">
		<input type="text" name="id" placeholder="아이디">
		<input type="password" name="pwd" placeholder="비밀번호">
		<button type="submit">로그인</button>
	</form>
	
	<div class="subBox">
	<a href="findId.do">아이디찾기</a>
	<a href="findPwd.do">비밀번호찾기</a>
	<a href="join.do">회원가입</a>
	</div>
</div><br>

<footer id="footer"></footer>
</body>
</html>