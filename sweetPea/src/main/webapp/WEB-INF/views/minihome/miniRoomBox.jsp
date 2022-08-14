<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여ㄹ기  
<c:forEach var="item" items="${miniroom }">
${item.img }
<img width="200" height="100" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }'/>
</c:forEach>
</body>
</html>