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
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet" />
<style type="text/css"></style>
<script>
		$(function(){
			$(".banner").load("resources/article/nav-banner.jsp");
		});
	</script>
</head>
<body>
	<div>
		<div class="loginBox">
			<!-- 로그인 상태 -->
			<c:if test="${login != null}">
				<div class="login-top">
					<span>${login.name}님</span>
					<input type="button" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
				</div>
				<div class="login-center">
					<div class="profile" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'"></div>
					<div class="info">
						<ul>
							<li>today</li>
							<li>new</li>
							<li>친구신청</li>
							<li>쪽지</li>
							<li>완두콩 <input type="button" value="충전"></li>
						</ul>
					</div>
				</div>
				<div class="login-bottom">
					<input type="button" value="미니홈피 가기">
				</div>
			</c:if>
			<!-- 로그인 상태 끝 -->
			<!-- 로그아웃 상태 -->
			<c:if test="${login == null}">
				<div class="login">
					<div class="cameleon"></div>
					<input type="button" class="login-button" onclick="location.href='<%=request.getContextPath()%>/user/login.do'" value="로그인">
					<div class="logout-bottom">
						<span><a href="<%=request.getContextPath()%>/user/join.do">회원가입</a></span>
						<span>
							<a href="<%=request.getContextPath()%>/user/findId.do">아이디</a> /
							<a href="<%=request.getContextPath()%>/user/findPwd.do">비밀번호 찾기</a>
						</span>
					</div>
				</div>
			</c:if>
			<!-- 로그아웃 상태 끝 -->
		</div>
		<div class="banner"></div>
	</div>
</body>
</html>