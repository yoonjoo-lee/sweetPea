<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<title>아이템상점</title>
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/resources/images/camelon.png">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function(){
		$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%=request.getContextPath()%>/resources/article/side-nav-item.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<style type="text/css">
#view{
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
	min-height: 1300px;
}
#nav{
	width: 250px;
	height: 100%;
	display: inline-block;
}
#section{
	border: 1px solid black;
	width: 1020px;
	height: 100%;
	float: right;
}
#itemShopMain{
	width: 100%;
	height: 100%;
	display: block;
	margin: 0 auto;			
}
</style>

<c:if test="${device eq 'MOBILE' }">
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet"/>
<style>
article > *,#view,#nav,#section{
	width: 100% !important;
}
#view{
	min-height: auto;
}
#section{
	float: inherit !important;
    height: 65vh;
}
#nav{height: auto;}
.categoryBox,#section{
    border: 1px solid black !important;
    margin-top: 5vh !important;
    border-left: 0 !important;
    border-right: 0 !important;
}
.categoryBox>ul{
    padding: 0;
    margin: 1vh 1vw;
}
.categoryBox>ul>li{
    display: inline-block;
    width: 30vw;
    list-style: none;
    font-size: 4vw;
    margin: 1vh 1vw;
    text-align: center;
}
.leftBanner{
	height: 34vh !important;
}
#leftBanner{
	overflow:hidden;
}
</style>

</c:if>

</head>
<body style="overflow: scroll;">
<article>
	<header id="header"></header>
	<br>
	<div id="view">
	<nav id="nav"></nav>
	<section id="section">
		<iframe id="itemShopMain" src="itemShopMain.do"></iframe>
	</section>
	</div>
	<br>
	<footer id="footer"></footer>
	
</article>

</body>
</html>









