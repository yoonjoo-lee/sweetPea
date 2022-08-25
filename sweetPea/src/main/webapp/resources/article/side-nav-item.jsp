<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(function(){
	$(".banner").load("resources/article/nav-banner.jsp");
	if(${category == 1}){
		$(".category1").css("font-weight","bold");
		$(".category3").css("font-weight","none");
	}else if(${category == 3}){
		$(".category3").css("font-weight","bold");
		$(".category1").css("font-weight","none");
	}
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

.leftBanner {
	width: 100%;
	height: 800px;
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

<c:if test="${device eq 'MOBILE'}">
<style>
.py-4{
	padding-top: 1vh !important;
	padding-bottom: 6vh !important;
}
</style>

<script>
$(function(){
	$(".categoryList").insertAfter(".leftBanner");
})
</script>
</c:if>


<div class="side-nav">
	<c:if test="${device eq 'PC' }">
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
		<!-- 로그아웃 상태 끝 -->

	</div>
	</c:if>
	<div class="categoryBox categoryList">
		<h3><a onclick="location.href='shop.do?category=4'">아이템상점</a></h3>
		<ul>
			<li><a class="category1" onclick="location.href='shop.do?category=1'">미니룸</a>
			</li><li><a onclick="music()">음악</a>
			</li><li><a class="category3" onclick="location.href='shop.do?category=3'">커스텀</a></li>
			<c:if test="${login.uidx > 0 }">
				<li><a onclick="info('myItemList.do?uidx=${login.uidx}')">내 아이템</a>
				<!-- </li><li><a onclick="gift()">선물하기</a> -->
				</li><li><a onclick="info('itemFileChoice.do')">아이템 등록</a></li>
			</c:if>
		</ul>
		<c:if test="${login.pea_super == 'Y'}">
			<h3>관리자</h3>
			<ul>
				<li><a onclick="info('itemFileChoice.do')">아이템 등록</a>
				</li><li><a onclick="info('item-approval.do')">아이템 승인</a>
				</li><li><a onclick="info('item-postpone.do')">보류</a></li>
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
/* 선물하기 페이지 준비 */
	function gift(){
		Swal.fire({
		      title: '준비중입니다.',
		      text: '선물하기 페이지는 추후에 추가될 예정입니다.',
		      icon: 'info',
				timer: 4000,
			    timerProgressBar: true,
	    });
} 
/* 음악 준비 중 */
	function music(){
		Swal.fire({
		      title: '준비중입니다.',
		      text: '음악 아이템은 추후 추가될 예정입니다.',
		      icon: 'info',
				timer: 4000,
			    timerProgressBar: true,
	    });
}  
 

	
</script>










