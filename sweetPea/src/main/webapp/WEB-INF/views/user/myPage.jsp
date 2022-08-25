<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<title>SweetPea</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function(){
		$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%=request.getContextPath()%>/resources/article/side-nav-info.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<style type="text/css">
#view{
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
}
#nav{
	width: 250px;
	height: 100%;
	display: inline-block;
	min-height: 1000px;
}
#section{
	border: 1px solid black;
	width: 1020px;
	height: 100%;
	min-height: 1000px;
	float: right;
}
#myIframe{
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
#view,#section{
	min-height: auto;
}
#section{
	float: inherit !important;
    height: 80vh;
}
#nav{height:auto; min-height: inherit;}
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
<body>
<c:if test="${login == null}">
	<script>
		$(async function(){
			await Swal.fire({
				  icon: 'error',
				  title: '로그인 필요',
				  text: '로그인 후 이용 가능합니다.',
				  position: 'top'
				});
			window.location.href="home.do";
		})
	</script>
</c:if>
<article>
	<header id="header"></header>
	<br>
	<div id="view">
	<nav id="nav"></nav>
	<section id="section">
		<iframe id="myIframe" src="myPage-idx.do?uidx=${login.uidx}&mini=0"></iframe>
	</section>
	</div>
	<br>
	<footer id="footer"></footer>
	
</article>

</body>
</html>
