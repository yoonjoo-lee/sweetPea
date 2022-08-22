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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	function openMini(uidx){
		var popupX = (document.body.offsetWidth / 2) - (1100 / 2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 2) - 350;
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		if ('${device}' == 'MOBILE') { 
			window.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+uidx;
		}else{
			window.open('<%=request.getContextPath()%>/mini/main.do?uidx='+uidx,'name()',
						'resizable=no width=1300 height=650,left='+popupX+',top='+popupY);
			}
	}
	$(function(){
		$(".masthead").click(function(){
			window.location.href="<%=request.getContextPath()%>/";
		})
	})
</script>
<c:if test="${device == 'MOBILE'}">
<style>
#mainNav {
  padding-top: 1vh;
  padding-bottom: 1vh; 
  background-color: #212529;
} 
#mainNav .navbar-toggler {
  padding: 0.75rem;
  font-size: 0.75rem;
  font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  text-transform: uppercase;
  font-weight: 700;
}
#mainNav .navbar-brand {
  color: #ffc800;
  font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-weight: 700;
  letter-spacing: 0.0625em;
  text-transform: uppercase;
}
#mainNav .navbar-brand img {
  height: 2rem;
}
#mainNav .navbar-nav .nav-item .nav-link {
  font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  font-size: 0.95rem;
  color: #fff;
  letter-spacing: 0.0625em;
}
#mainNav .navbar-nav .nav-item .nav-link.active, #mainNav .navbar-nav .nav-item .nav-link:hover {
  color: #ffc800;
}

.navbar-toggler {
    display: block;
  }
	
.collapse:not(.show) {
    display: none;
}
	
.mobile-header-idxBox{
	display: inline-block;
    width: 55vw;
    height: 100%;
    border: 0;
    margin: 2vh 5vw;
}
.mobile-header-idxBox>span{
	line-height: 4vh;
}

.mobile-header-idxBox>.profile{
	width: 25vw;
    height: 25vw;
    border: 0;
    border-radius: 25vw;
    margin: 0 auto;
    display: block;
    float: none;
}
.mobile-header-idxBox>.login-center>span{
	font-size: 3vw;
    line-height: 3vh;
}
.mobile-header-idxBox>.login-center>input{
    height: 3vh;
    width: 20vw;
}

.mobile-header-idxBox>.login-center>.info>ul{
	font-size: 3vw;
}
.mobile-header-idxBox>.login-center>.info>ul>li{
	color: white;
}

.mobile-header-idxBox>.login>.cameleon{
    height: 10vh;
    display: block;
    width: 100%;
    margin: 1vh 0;
}
.mobile-header-idxBox>.login>.longin-button-box {
	width: 100%;
    display: block;
}

.mobile-header-idxBox>.login>.longin-button-box>input {
	margin: 1vh 0;
    width: 100%;
    height: 4vh;
    font-size: 3vw;
}

.nav-link{
	font-size: 4vw !important;
}


.navbar-nav{
	display: inline-block;
	float: right;
}

.masthead{
	min-width: auto !important;
}
.py-4{
	padding-top: 1vh !important;
	padding-bottom: 6vh !important;
}
</style>

</c:if>
<script type="text/javascript">
function gift(){
		Swal.fire({
		      title: '준비중입니다.',
		      text: '선물하기 페이지는 추후에 추가될 예정입니다.',
		      icon: 'info',
				timer: 4000,
			    timerProgressBar: true,
		  	    });
		  } 
        </script>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand header-a" href="<%=request.getContextPath()%>/home.do"><img src="<%=request.getContextPath()%>/resources/images/pea-move-unscreen.gif" alt="..." /></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
   		Menu
    	<i class="fas fa-bars ms-1"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
		<c:if test="${device == 'MOBILE'}">
		<div class = "mobile-header-idxBox">
			
			
			<!-- 로그인 상태 -->
			<c:if test="${login != null}">
				<img class="profile" src = "${login.profile }" onclick="location.href='<%=request.getContextPath()%>/user/myPage.do'" />
				<div class="login-center">
					<span>${login.name}님</span>
					<input type="button" style="float: right;" onclick="location.href='<%=request.getContextPath()%>/user/logout.do'" value="로그아웃">
					<div class="info">
						<ul>
							<li>today <span style="color: red">${today}</span></li>
							<li><a style="cursor: pointer; text-decoration: none; color: inherit;" href="<%=request.getContextPath()%>/message/main.do?uidx=${login.uidx}">쪽지</a></li>
							<li>total &nbsp; ${total}</li>
							<li>완두콩 <a style="text-decoration: none; color: #007500; font-weight: bold;" href="<%=request.getContextPath()%>/user/charge.do">${login.pea_amount}</a>개</li>
						</ul>
						<input type="button" style="width: 86%; height: 4vh; margin: 2vh 0; font-size: 3vw; position: absolute; bottom: 0; left: 7%; border: 0; border-radius: 4vh;" onclick="openMini(${login.uidx})" value="미니홈피 가기">
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
							<span style="color: white; font-size: 3vw;"><a href="<%=request.getContextPath()%>/user/join.do">회원가입</a></span>
							<span style="color: white; font-size: 3vw;">
								<a href="<%=request.getContextPath()%>/user/findId.do">아이디</a> /
								<a href="<%=request.getContextPath()%>/user/findPwd.do">비밀번호 찾기</a>
							</span>
						</div>
					</div>
				</div>
			</c:if>
			<!-- 로그아웃 상태 끝 -->
				</div>
			</c:if>
					
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0 ">
                        <li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/item/shop.do?category=4">아이템상점</a></li>
                        <li class="nav-item"><a class="nav-link header-a" href="#" onclick="gift()">선물하기</a></li>
                        <li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/charge.do">결제/충전</a></li>
                        <li class="nav-item nav-hover" >
                        	<a class="nav-link header-a" href="<%=request.getContextPath()%>/mainboard/community.do">커뮤니티</a>
                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list" >
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=1">　공지　</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=2">　자유　</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=3">　유머　</a></li>
                        	</ul>
                        </li>
                        <li class="nav-item nav-hover">
                        	<a class="nav-link" href="<%=request.getContextPath()%>/mainboard/service.do">고객센터</a>
                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list">
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=4">　FAQ　</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=5">　Q&A　</a></li>
                        	</ul>
                        </li>
                        <c:if test="${login.pea_super == 'Y' }">
                        	<li class="nav-item nav-hover">
								<a class="nav-link" href="#"> 관리자 </a>   
	                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list">
								  <li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/memberManagement.do">회원관리</a></li>
								  <li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=6">신고관리</a></li>
								  <%-- <li><a class="nav-link" href="<%=request.getContextPath()%>/item/item-approval.do">아이템승인</a></li> --%>
							    </ul>
							</li>                   	
                        </c:if>

                        <%-- <c:if test="${login != null}">
                        	<li class="nav-item"><a class="nav-link header-a" style="cursor: pointer" onclick="openMini(${login.uidx})">미니홈피</a></li>
                        	<li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></li>
                        </c:if>
                        <c:if test="${login == null}">
                        	<li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/login.do">로그인</a></li>
                        </c:if> --%>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead" style="cursor: pointer;">
        </header>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath()%>/resources/js/header.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        
        

</body>
</html>