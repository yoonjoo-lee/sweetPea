<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

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
	

	
	function openMini(){
		var popupX = (document.body.offsetWidth / 2) - (1100 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 2) - 350;
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		var uidx = ${login.uidx};
		
		var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase()));
		 
		if (mobile) { 
			window.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+uidx;
		}else{
			window.open('<%=request.getContextPath()%>/mini/main.do?uidx='+uidx,'name',
					'resizable=no width=1300 height=650,left='+popupX+',top='+popupY);
		}
	}
</c:if>
</script>
<style type="text/css">
.side-nav {
	display: inline-block;
	float: left;
	width: 10vw;
	height: 60vh;
	margin-bottom: 15em;
}

.loginBox {
	display: inline-block;
	width: 100%;
	height: 17vh;
	border: 1px solid black;
}

.login-top {
	font-size: 0.1em;
	margin-top: 3em;
	height: 20%;
}

.login-top>span {
	float: left;
	font-size: 9em;
	margin-left: 1em;
	color: silver;
}

.login-top>input {
	float: right;
	margin-right: 3em;
}

.login-center {
	height: 55%;
}

.login-bottom {
	height: 22%;
}

.login-center div {
	display: inline-block;
	height: 85%;
}

.profile {
	height: 85%;
	border: 1px solid black;
	width: 40%;
	margin-left: 5%;
	vertical-align: bottom;
}

.info {
	width: 50%;
}

.info ul {
	list-style: none;
	font-size: 0.05em;
	padding: 0;
}

.login-bottom>input {
	width: 85%;
	display: block;
	margin: 0 auto;
	font-size: 0.8em;
}

input {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

.categoryBox {
	border: 1px solid black;
	margin-top: 1.5vh;
}

.categoryBox>h3 {
	margin: 1vh 0;
	text-align: center;
}

.categoryBox>ul {
	font-size: 0.8em;
}

a:hover {
	cursor: pointer;
	text-decoration: underline;
	color: aqua;
}

.leftBanner {
	background-image:;
	width: 100%;
	height: 100%;
	display: block;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover;
}

.login-button {
	margin: 10% auto;
	border: 0;
	display: block;
	width: 75%;
	border-radius: 2em;
	font-size: 0.5em;
}

.logout-bottom>span {
	font-size: 0.02vw;
	margin-bottom: 2em;
}

.logout-bottom>span:first-child {
	margin-left: 0.5vw;
	float: left;
}

.logout-bottom>span:last-child {
	margin-right: 0.5vw;
	float: right;
}

.logout-bottom a {
	text-decoration: none;
	color: inherit;
}

.cameleon {
	background-image:
		url("<%=request.getContextPath()%>/resources/images/camelon.png");
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: contain;
	margin-top: 1em;
	width: 100%;
	height: 40%;
}

#leftBanner {
	width: 100%;
	height: 100%;
	display: block;
	margin: 0 auto;
}
</style>
<div class="side-nav">
	<div class="loginBox">
		<!-- 로그인 상태 -->
		<c:if test="${login != null}">
			<div class="login-top">
				<span>${login.name}님</span> <input type="button" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
			</div>
			<div class="login-center">
				<img class="profile" src="${login.profile }" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" />

				<div class="info">
					<ul>
						<li>today</li>
						<li>new</li>
						<li>친구신청</li>
						<li><a onclick="openMessage()">쪽지</a></li>
						<li>완두콩 <input type="button" onclick="location.href='<%=request.getContextPath()%>/user/charge.do'" value="충전"></li>
					</ul>
				</div>
			</div>
			<div class="login-bottom">
				<input type="button" onclick="openMini()" value="미니홈피 가기">
			</div>
		</c:if>
		<!-- 로그인 상태 끝 -->
		<!-- 로그아웃 상태 -->
		<c:if test="${login == null}">
			<div class="login">
				<div class="cameleon"></div>
				<input type="button" class="login-button" onclick="location.href='<%=request.getContextPath()%>/user/login.do'" value="로그인">
				<div class="logout-bottom">
					<span><a href="<%=request.getContextPath()%>/user/join.do">회원가입</a></span> <span> <a href="<%=request.getContextPath()%>/user/findId.do">아이디</a> / <a href="<%=request.getContextPath()%>/user/findPwd.do">비밀번호 찾기</a>
					</span>
				</div>
			</div>
		</c:if>
		<!-- 로그아웃 상태 끝 -->

	</div>
	<div class="categoryBox">
		<h3><a onclick="location.href='shop.do'">아이템상점</a></h3>
		<ul>
			<li><a onclick="info('itemShopMain.do?category=1')">미니룸</a></li>
			<li><a onclick="info('itemShopMain.do?category=2')">BGM</a></li>
			<li><a onclick="info('itemShopMain.do?category=3')">커스텀</a></li>
			<li><a onclick="info('myItemList.do?uidx=${login.uidx}')">내 아이템</a></li>
			<li><a onclick="">선물하기</a></li>
		</ul>
		<c:if test="${login.pea_super == 'Y'}">
			<h3>관리자</h3>
			<ul>
				<li><a onclick="info('itemFileChoice.do')">아이템 등록</a></li>
				<li><a onclick="info('item-approval.do')">아이템 승인</a></li>
				<li><a onclick="info('item-postpone.do')">보류</a></li>
			</ul>
		</c:if>
	</div>
	<div class="categoryBox leftBanner">
		<iframe id="leftBanner" src="leftBanner.do"></iframe>
	</div>
</div>
<script>
	function info(url){
		$('#itemShopMain').attr('src',url);
	}
</script>










