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
			$("#nav").load("<%=request.getContextPath()%>/resources/article/side-nav-item.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>
	<style type="text/css">
		#view{
			width: 80vw;
			margin: 0 auto;
			margin-bottom: 15em;
			height: 100%;
		}
		section{
			border: 1px solid black;
			width: 69.2vw;
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
</head>
<body>
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









