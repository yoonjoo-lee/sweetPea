<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
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
	width: 100%;
}

.loginBox {
	width: 100%;
    height: 165px;
    border: 1px solid black;
}

.login-top {
	font-size: 0.1em;
    margin-top: 5%;
    height: 18%;
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
	height: 72%;
}

.login-bottom {
	height: 22%;
}

.profile {
	height: 110px;
    border: 0;
    border-radius: 110px;
    width: 110px;
    margin-left: 3%;
    vertical-align: bottom;
    float: left;
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
	margin-top: 20px;
}

.categoryBox>h3 {
	margin: 10px 0;
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
	.leftBanner{
		background-image: url("<%=request.getContextPath()%>/resources/images/leftbanner.png");
		width: 100%;
		height: 700px;
		display: block;
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
	

.login-button {
	margin: 5% auto;
    border: 0;
    display: block;
    width: 85%;
    border-radius: 2em;
    font-size: 1em;
    height: 30px;
    line-height: 30px;
}

.logout-bottom>span {
	font-size: 0.5em;
	margin-bottom: 2em;
}

.logout-bottom>span:first-child {
	margin-left: 10px;
	float: left;
}

.logout-bottom>span:last-child {
	margin-right: 10px;
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
.category1,.category3{
	text-decoration:none;
	color: inherit;
}
</style>

<c:if test="${device eq 'PC'}">
<style>
.info ul {
	list-style: none;
    font-size: 0.8em;
    padding: 0;
    margin: 0;
    text-indent: 5px;
}

.login-center div {
	display: inline-block;
    height: 100%;
    position: relative;
    margin-left: 7px;
}
</style>
</c:if>

<div class="side-nav">
	<c:if test="${device eq 'PC' }">
	<div class="loginBox">
		<c:if test="${login != null}">
			<div class="login-top">
				<span>${login.name}님</span> <input type="button" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
			</div>
			<div class="login-center">
				<img class="profile" src="${login.profile }" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" />

				<div class="info">
					<ul>
						<li>today <span style="color: red">${today}</span></li>
						<li>total &nbsp; ${total}</li>
						<li><a style="cursor: pointer;" onclick="openMessage()">쪽지</a></li>
						<li>완두콩 <a style="text-decoration: none; color: #007500; font-weight: bold;" href="<%=request.getContextPath()%>/user/charge.do">${login.pea_amount}</a>개</li>
					</ul>
					<input type="button" style="position: absolute; bottom: 5%; font-size: 1em;" onclick="openMini()" value="미니홈피 가기">
				</div>
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
	</div>
	</c:if>
	<div class="categoryBox">
		<h3>마이 페이지</h3>
		<ul>
			<li><a onclick="info('myPage-modify.do?uidx=${login.uidx}')">정보 수정</a></li>
			<li><a onclick="info('myPage-changePwd.do?uidx=${login.uidx}')">비밀번호 수정</a></li>
			<li><a onclick="info('myPage-profile.do')">프로필 변경</a></li>
			<li><a onclick="after()">신청 글 보기</a></li>
			<li><a onclick="info('myPage-del.do')">회원 탈퇴</a></li>
			<li><a onclick="after()">보유아이템 및 결제내역</a></li>
		</ul>
	</div>
	
	<c:if test="${device eq 'PC' }">
	<div class="categoryBox leftBanner"></div>
	</c:if>
	
</div>
<script>
	function info(url){
		$('#myIframe').attr('src',url);
	}
	
	function after(){
		Swal.fire({
			text : '추후 추가 예정입니다.',
			icon : 'info',
			timer: 3000,
			timerProgressBar: true,
			}); 
	}
	
</script>