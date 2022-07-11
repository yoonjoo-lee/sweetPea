<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
	.box{
		width: 25%;
		margin: 0 auto;
		margin-bottom: 15em;
	}
	.afterBox{
		display: none;
		width: 25%;
		margin: 0 auto;
		margin-bottom: 15em;
	}
	#img{
		width: 40%;
		height: 40%;
		margin: 0 auto;
		display: block;
	}
	form>input,form>button{
		width: 60%;
		height: 2.5em;
		margin: 0.8em auto ;
		display: block;
		
	}
	#mail-check-warn{
		font-size: 0.8em;
	}
	.getId{
		color: green;
		font-weight: bold;
	}
</style>
</head>
<body>
<header id="header"></header>
<div class="box">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	
	<form action="login.do" method="post">
	<input type="text" name="id" placeholder="아이디">
	<input type="password" name="pwd" placeholder="비밀번호">
	<button type="submit">로그인</button>
	</form>
	
<a href="findId.do">아이디찾기</a>
<a href="findPwd.do">비밀번호찾기</a>
<a href="join.do">회원가입</a>
</div><br>


<footer id="footer"></footer>
</body>
</html>