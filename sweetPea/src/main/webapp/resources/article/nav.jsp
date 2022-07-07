<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="resources/css/nav.css" rel="stylesheet" />
<style type="text/css"></style>
</head>
<body>
	<div>
		<div class="loginBox">
			<c:if test="${user != null}">
				아이디 : ${user.id}
				이름 : ${user.name}
				<div class="logout">
					<div class="cameleon"></div>
					<input type="button" class="login-button" onclick="location.href='user/login.do'" value="로그인">
					<div class="logout-bottom">
						<span><a href="user/join.do">회원가입</a></span>
						<span>
							<a href="user/findId.do">아이디</a> /
							<a href="user/findPwd.do">비밀번호 찾기</a>
						</span>
					</div>
				</div>
			</c:if>
			<c:if test="${user == null}">
				<div class="login">
					<div class="cameleon"></div>
					<input type="button" class="login-button" onclick="location.href='user/login.do'" value="로그인">
					<div class="logout-bottom">
						<span><a href="user/join.do">회원가입</a></span>
						<span>
							<a href="user/findId.do">아이디</a> /
							<a href="user/findPwd.do">비밀번호 찾기</a>
						</span>
					</div>
				</div>
			</c:if>
		</div>
		<div class="banner"></div>
	</div>
</body>
</html>