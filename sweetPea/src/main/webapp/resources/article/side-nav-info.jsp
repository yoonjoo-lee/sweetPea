<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
	.side-nav{
		display: inline-block;
		float: left;
		width: 10vw;
		height: 60vh;
		margin-bottom: 15em;
	}
	.loginBox{
		display: inline-block;
		width: 100%;
		height: 17vh;
		border: 1px solid black;
	}
	.login-top{
		font-size: 0.1em;
		margin-top: 3em;
		height: 20%;
	}
	.login-top>span{
		float: left;
		font-size: 9em;
		margin-left: 1em;
		color: silver;
	}
	.login-top>input{
		float: right;	
		margin-right: 3em;
	}
	.login-center{
		height: 55%;
	}
	.login-bottom{
		height: 22%;
	}
	.login-center div{
		display: inline-block;
		height: 85%;
	}
	.profile{
		height: 85%;
		border: 1px solid black;
		width: 40%;
		margin-left: 5%;
		vertical-align: bottom;
	}
	.info{
		width: 50%;
	}
	.info ul{
		list-style: none;
		font-size: 0.05em;
		padding: 0;
	}
	.login-bottom>input{
		width: 85%;
		display: block;
		margin: 0 auto;
		font-size: 0.8em;
	}
	input{
		margin: 0;
	    font-family: inherit;
	    font-size: inherit;
	    line-height: inherit;
	}
	.categoryBox{
		border: 1px solid black;
		margin-top: 1.5vh;
	}
	.categoryBox>h3{
		margin: 1vh 0;
		text-align: center;
	}
	.categoryBox>ul{
		font-size: 0.8em;
	}
	a:hover{
		cursor: pointer;
		text-decoration: underline;
		color: aqua;
	}
	.leftBanner{
		background-image: url("<%=request.getContextPath()%>/resources/images/leftbanner.png");
		width: 100%;
		height: 100%;
		display: block;
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
</style>
<div class="side-nav">
	<div class="loginBox">
		<div class="login-top">
			<span>${login.name}님</span>
			<input type="button" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
		</div>
		<div class="login-center">
			<%-- <div class="profile" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'"></div> --%>
<%-- 			<img class="profile" src = "<spring:url value = '/images/profile/${login.profile }'/>" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" /> --%>
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
			<input type="button" onclick="openMini()" value="미니홈피 가기">
		</div>
	</div>
	<div class="categoryBox">
		<h3>마이 페이지</h3>
		<ul>
			<li><a onclick="info('myPage-modify.do?uidx=${login.uidx}')">정보 수정</a></li>
			<li><a onclick="info('myPage-changePwd.do?uidx=${login.uidx}')">비밀번호 수정</a></li>
			<li><a onclick="info('myPage-profile.do')">프로필 변경</a></li>
			<li><a>신청 글 보기</a></li>
			<li><a onclick="info('myPage-del.do')">회원 탈퇴</a></li>
			<li><a>보유아이템 및 결제내역</a></li>
		</ul>
		<c:if test="${login.pea_super == 'Y'}">
		<h3>관리자</h3>
		<ul>
			<li><a>신고 관리</a></li>
			<li><a>신청글 관리</a></li>
		</ul>	
		</c:if>
	</div>
	<div class="categoryBox leftBanner"></div>
</div>
<script>
	function info(url){
		$('#myIframe').attr('src',url);
	}
</script>