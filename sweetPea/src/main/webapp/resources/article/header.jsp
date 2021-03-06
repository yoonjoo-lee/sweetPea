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
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand header-a" href="home.do"><img src="<%=request.getContextPath()%>/resources/images/pea-move-unscreen.gif" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/item/shop.do">???????????????</a></li>
                        <li class="nav-item"><a class="nav-link header-a" href="#portfolio">????????????</a></li>
                        <li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/charge.do">??????/??????</a></li>
                        <li class="nav-item nav-hover" >
                        	<a class="nav-link header-a" href="<%=request.getContextPath()%>/mainboard/community.do">????????????</a>
                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list" >
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=1">????????????</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=2">????????????</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=3">????????????</a></li>
                        	</ul>
                        </li>
                        <li class="nav-item nav-hover">
                        	<a class="nav-link" href="<%=request.getContextPath()%>/mainboard/service.do">????????????</a>
                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list">
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=4">???FAQ???</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=5">???Q&A???</a></li>
                        	</ul>
                        </li>
                        <c:if test="${login.pea_super == 'Y' }">
                        	<li class="nav-item nav-hover">
								<a class="nav-link" href="<%=request.getContextPath()%>"> ????????? </a>   
	                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list">
								  <li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/memberManagement.do"> ????????????</a></li>
								  <li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=6"> ????????????</a></li>
								  <li><a class="nav-link" href="<%=request.getContextPath()%>/">???????????????</a></li>
							    </ul>
							</li>                   	
                        </c:if>

                        <c:if test="${login != null}">
                        	<li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/logout.do">????????????</a></li>
                        </c:if>
                        <c:if test="${login == null}">
                        	<li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/login.do">?????????</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <!-- <div class="container">
                <div class="masthead-subheading">0705</div>
                <div class="masthead-heading text-uppercase">?????????</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div> -->
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