<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script src="resources/js/jquery-3.6.0.min.js"></script>
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
			width: 60%;
			margin: 0 auto;
		}
		#footer{
			width: 100%;
			bottom: 0;
			left: 0;
			position: absolute;
		}
	</style>
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
