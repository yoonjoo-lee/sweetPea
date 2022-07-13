<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SweetPea</title>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#nav").load("<%=request.getContextPath()%>/resources/article/side-nav-info.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>
	<style type="text/css">
		#view{
			width: 60vw;
			margin: 0 auto;
			margin-bottom: 15em;
			height: 100%;
		}
		section{
			border: 1px solid black;
			width: 49.2vw;
			height: 100%;
			float: right;
		}
		#myIframe{
			width: 96%;
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
		<iframe id="myIframe" src="<%=request.getContextPath()%>/resources/myPage/myIdx.jsp"></iframe>
	</section>
	</div>
	<br>
	<footer id="footer"></footer>
	
</article>

</body>
</html>
