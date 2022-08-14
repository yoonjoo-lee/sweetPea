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

</style>
</head>
<body>
미니홈피 효과 

내 배경 <br>
<c:forEach var="item" items="${list }">
<img width="200" height="100" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img}'/>
${item.name }
<!-- 일단 배경을 카테로리 1로 함  -->
<%-- <button onclick="location.href='<%=request.getContextPath()%>/mini/changeMyminihome.do?uidx=${login.uidx }&item=${item.img }&category=1'">변경</button><br> --%>
<button onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=${item.img }&category=1'">변경</button><br> 
</c:forEach>
<button onclick="f5()">새로고침 </button>
<script>
function f5(){
	window.parent.parent.location.href='<%=request.getContextPath()%>/mini/main.do?uidx=2';
}
</script>
</body>
</html>