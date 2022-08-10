<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
사진첩~
<button onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/photoAlbumUpload.do?uidx=${login.uidx}&category=2'">등록</button>
<c:forEach var="board" items='${list }'>
<%-- <div>${board.content }</div> --%>
<script>
var content = '${board.content }';
var files = content.split('|');
for (var i in files){
 	document.write('<img width="100" height="50" alt="img" src="<%=request.getContextPath() %>/miniroomboard2/imageView.do?originFileName='+files[i]+'"/>')
	document.write(files[i] + '<br>');
}

</script>
</c:forEach>
<%-- <img width="800" height="400" alt="img" src="<%=request.getContextPath() %>/miniroomboard2/imageView.do?originFileName=seocgu.jpg"/>
 --%></body>
</html>