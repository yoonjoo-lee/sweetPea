<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
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
<body>

<header id="header"></header>
리스트(커뮤니티/고객센터)
${category }
category
<br>
	<div id="view">
	<nav id="nav"></nav>
	<br>
	<section id="section"></section>
	</div>
	<br>
	<footer id="footer"></footer>
<form method="get" action="list.do">
		<select name="searchType">
			<option value="title" <c:if test="${!empty SearchVo.searchType and SearchVo.searchType eq 'title' }">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty SearchVo.searchType and SearchVo.searchType eq 'contentWriter' }">selected</c:if>>내용+작성자</option>
		</select>
		<input type="text" name="searchValue" <c:if test="${!empty SearchVo.searchValue}">value="${SearchVo.searchValue }"</c:if>>
		<input type="hidden" name="category" value=${category }>
		<input type="submit" value="검색">
</form>
총 ${list.size()}건이 조회되었습니다.

<table border="1" width="1000" height="300">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="4">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size() > 0 }">
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.bidx }</td>
						<%-- <td><a href="content.do?bidx=${vo.bidx }">${vo.title }</a></td> --%>
						<%-- <td>${vo.name }</td> --%>
						<td>${vo.title }</td>
						<td>${vo.content }</td>
						<td>${vo.hit }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
</table>
<a href="write.do?category=${category }">작성하기</a>
</body>
</html>