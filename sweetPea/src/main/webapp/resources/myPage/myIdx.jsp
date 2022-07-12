<%@page import="pea.board.service.UserService"%>
<%@page import="pea.board.dao.UserDao"%>
<%@page import="pea.board.vo.UserVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
int uidx_ = (int)session.getAttribute("uidx");
UserService userService = null;
UserDao dao = new UserDao();
UserVo vo = userService.userIdx(uidx_);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<style>
	#img{
		width: 30%;
		height: 30%;
		margin: 0 auto;
		display: block;
	}
	h4{
		text-align: center;
	}
</style>
</head>
<body>
	<br>
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<h4>회원 정보</h4>
	${vo.name};
	${vo.id};
</body>
</html>