<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="list.do?category=2&nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
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
<br>
	<div id="view">
<c:if test="${searchVo.category == 2}">
	<h2>자유게시판</h2>
</c:if>
<c:if test="${searchVo.category == 3}">
	<h2>유머게시판</h2>
</c:if>


<!-- 페이징 옵션 선택 -->
<div style="float: right;">
	<select id="cntPerPage" name="sel" onchange="selChange()">
		<option value="5"
			<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
		<option value="15"
			<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
	</select>
</div> <!-- 옵션선택 끝 -->
	
	
	
	
<!-- 검색 -->	
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
<!-- 리스트 테이블 -->
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
					<tr onclick="location.href='view.do?bidx=${vo.bidx }'">
						<%-- <td><a href="content.do?bidx=${vo.bidx }">${vo.title }</a></td> --%>
						<%-- <td>${vo.name }</td> --%>
						<td>${vo.title }</td>
						<td>${vo.content }</td>
						<td>${vo.name }</td>
						<td>${vo.datetime }</td>
						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
</table>

<!-- 페이징 -->
<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="list.do?category=2&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="list.do?category=2&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="list.do?category=2&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
</div>


<a href="write.do?category=${category }">작성하기</a>

<br>
	</div>
	<br>
	<!-- <footer id="footer"></footer> -->
</body>
</html>