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
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet"/>
<c:if test="${device == 'MOBILE'}">
<style>
.loginBox{
	display: none;
}
div.banner{
	width: 100%;
	height: 100%;
	border: 1px solid black;
	display: block;
	position: relative;
}
</style>
</c:if>
<script>
		$(function(){
			$(".banner").load("<%=request.getContextPath()%>/resources/article/nav-banner.jsp");
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
<c:if test="${newMsg > 0}">
<style>
	.msgBtn::after{
		background-image: url('<%=request.getContextPath()%>/resources/images/n_red_alphabet_letters_icon.png');
		background-size: 8px;
	    width: 8px;
	    height: 8px;
	    content: "";
	    background-repeat: no-repeat;
	    position: absolute;
	}
</style>
</c:if>

</head>
<body style="max-width: 700px;	max-height: 400px;">
	<div>
		<div class="loginBox">
			<!-- 로그인 상태 -->
			<c:if test="${login != null}">
				<div class="profile" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" style="background-image: url('${login.profile}');">
				<img src="<%=request.getContextPath()%>/resources/images/setting.png" style="width: 15px; position: absolute; top: 7px; right: 7px;">
				</div>
				<div class="login-center">
					<span>${login.name}님</span>
					<input type="button" style="float: right;" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
					<div class="info">
						<ul>
							<li>today <span style="color: red">${mytoday}</span></li>
							<li><a class="msgBtn" style="cursor: pointer;" onclick="openMessage()">쪽지</a></li>
							<li>total &nbsp; ${mytotal}</li>
							<li>완두콩 <a style="text-decoration: none; color: #007500; font-weight: bold;" href="<%=request.getContextPath()%>/user/charge.do">${login.pea_amount}</a>개</li>
						</ul>
						<input type="button" style="width: 100%; height: 30px; margin: 5px 0;" onclick="openMini(${login.uidx})" value="미니홈피 가기">
					</div>
				</div>
			</c:if>
			<!-- 로그인 상태 끝 -->
			<!-- 로그아웃 상태 -->
			<c:if test="${login == null}">
				<div class="login">
					<div class="cameleon"></div>
					<div class="longin-button-box">
						<input type="button" class="login-button" onclick="location.href='<%=request.getContextPath()%>/user/login.do'" value="로그인">
						<div class="logout-bottom">
							<span><a href="<%=request.getContextPath()%>/user/join.do">회원가입</a></span>
							<span>
								<a href="<%=request.getContextPath()%>/user/findId.do">아이디</a> /
								<a href="<%=request.getContextPath()%>/user/findPwd.do">비밀번호 찾기</a>
							</span>
						</div>
					</div>
				</div>
			</c:if>
			<!-- 로그아웃 상태 끝 -->
		</div>
		<div class="banner"></div>
	</div>

</body>
</html>