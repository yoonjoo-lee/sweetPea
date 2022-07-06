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
		});
	</script>
</head>
<body>
<article>
	<header id="header">header</header>
	<header id="nav">header</header>
	
</article>

</body>
</html>
