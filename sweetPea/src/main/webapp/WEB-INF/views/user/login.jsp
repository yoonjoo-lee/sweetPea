<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="login.do" method="post">
<input type="text" name="id" placeholder="아이디">
<input type="password" name="pwd" placeholder="비밀번호">
<button type="submit">로그인</button>
</form>


<a href="findId.do">아이디찾기</a>
<a href="">비밀번호찾기</a>
<a href="join.do">회원가입</a>


</body>
</html>