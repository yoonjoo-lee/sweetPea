<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>SweetPea</title>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#header").load("resources/article/header.jsp"); 
			$("#nav").load("resources/article/nav.jsp"); 
			$("#section").load("resources/article/section.jsp");
			$("#footer").load("resources/article/footer.jsp");
		});
	</script>
	<style type="text/css">
		#view{
			width: 60vw;
			margin: 0 auto;
			margin-bottom: 15em;
		}
	</style>
	<c:if test="${device eq 'MOBILE' }">
	<style>
		#view{
			width: 100%;
		}
	</style>
	
	</c:if>
</head>
<body>
<article>
	<header id="header"></header>
	<br>
	<div id="view">
	<nav id="nav"></nav>
	<br>
	<section id="section"></section>
	</div>
	<br>
	<footer id="footer"></footer>
	
</article>
</body>
</html>
