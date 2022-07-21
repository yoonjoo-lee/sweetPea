<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>

<c:if test="${device eq 'PC'}">
<style>
	*{
		margin: 0;
		padding: 0;
	}
	#mainBox{
		background-color: #52C3BD;
		border-radius: 30px;
		width: 75vw;
		height: 98vh;
		position: relative;
		z-index: -1;
		margin: 1vh 1vw;
	}
	#leftBox{
		background-color: white;
		width: 15vw;
		height: 95%;
		display: inline-block;
		margin: 1.8% 0;
		margin-left: 2vw;
		border-radius: 15px;
	}
	#centerBox{
		background-color: black;
		width: 55vw;
		height: 95%;
		margin: 1.8% 0;
		display: inline-block;
		border-radius: 15px;
	}
	#buttonBox{
		width: 10vw;
		height: 95%;
		margin: 1.8% 0;
		display: inline-block;
	}
	.boardBtn{
		width: 100%;
		height: 5vh;
		background-color: aqua;
		margin-top: 3vh;
	}
</style>
</c:if>
<c:if test="${device eq 'MOBILE'}">
<style>
	body{
	background-color: black;
	}
</style>
</c:if>

</head>
<body>
<c:if test="${device eq 'PC'}">
<div id="mainBox">
	<div id="leftBox"><%-- <img src="${login.profile }"> --%>
	</div><div id="centerBox"></div>
	<div id="buttonBox">
	<div class="boardBtn"></div><br>
	<div class="boardBtn"></div>
	<div class="boardBtn"></div>
	<div class="boardBtn"></div>
	<div class="boardBtn"></div>
	</div>
</div>

</c:if>

<c:if test="${device eq 'MOBILE'}">

모바일입니다


</c:if>
</body>
</html>