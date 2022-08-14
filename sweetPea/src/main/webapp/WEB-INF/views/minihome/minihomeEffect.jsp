<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
		background-image: url("<%=request.getContextPath()%>/resources/images/back6.jpg");
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
</style>
</head>
<body>
미니홈피 효과 

내 배경 <br>
<c:forEach var="item" items="${list }">
<img width="200" height="100" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img}'/>
${item.name }<br>
</c:forEach>
</body>
</html>