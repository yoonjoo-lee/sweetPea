<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet" />
<style type="text/css">

</style>
<script>
		$(function(){
			$(".banner").load("resources/article/nav-banner.jsp");
		});
		<c:if test="${login != null}">
			function openMessage(){
				var popupX = (document.body.offsetWidth / 2) - (700 / 2);
				// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
				var popupY= (window.screen.height / 2) - 350;
				// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
				var uidx = ${login.uidx};
				window.open('<%=request.getContextPath()%>/message/main.do?uidx='+uidx,'name',
						'resizable=no width=750 height=400,left='+popupX+',top='+popupY);
			}
			
			<%-- function openMini(uidx){
				var popupX = (document.body.offsetWidth / 2) - (1100 / 2);
				// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
				var popupY= (window.screen.height / 2) - 350;
				// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
				if (${device} eq "MOBILE") { 
					window.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+uidx;
				}else{
					window.open('<%=request.getContextPath()%>/mini/main.do?uidx='+uidx,'name()',
							'resizable=no width=1300 height=650,left='+popupX+',top='+popupY);
				}
			} --%>
		</c:if>
</script>

</head>
<body style="max-width: 700px;	max-height: 400px;">
	<div>
		<div class="loginBox">
			<!-- 로그인 상태 -->
			<c:if test="${login != null}">
				<div class="login-top">
					<span>${login.name}님</span>
					<input type="button" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
				</div>
				<div class="login-center">
					<%-- <div class="profile" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'"><img src = "<spring:url value = '/images/profile/${login.profile }'/>"></div>
					 --%>
<%-- 					 <img class="profile" src = "<spring:url value = '/images/profile/${login.profile }'/>" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" /> --%>
					 <img class="profile" src = "${login.profile }" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" />
					 
					<div class="info">
						<ul>
							<li>today</li>
							<li>new</li>
							<li>친구신청</li>
							<li><a onclick="openMessage()">쪽지</a></li>
							<li>완두콩 <input type="button" value="충전"></li>
						</ul>
					</div>
				</div>
				<div class="login-bottom">
					<input type="button" onclick="openMini(${login.uidx})" value="미니홈피 가기">
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