<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
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
	margin-bottom: 15em;
}
#footer{
	width: 100%;
	bottom: 0;
	left: 0;
	position: absolute;
}
		
.searchDiv{
	float: left;
	padding-right: 5px;
}


table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  /* background: #73685d; */
  background: #52C3BD;
  /* background: medium turquoise;  */
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
</style>
<body>

<header id="header"></header>
<br>
<div id="view">
<c:if test="${searchVo.category == 1}">
	<h2>공지게시판</h2>
</c:if>
<c:if test="${searchVo.category == 2}">
	<h2>자유게시판</h2>
</c:if>
<c:if test="${searchVo.category == 3}">
	<h2>유머게시판</h2>
</c:if>
<c:if test="${searchVo.category == 4}">
	<h2>자주 묻는 질문</h2>
</c:if>
<c:if test="${searchVo.category == 5}">
	<h2>Q&A</h2>
</c:if>


<!-- 페이징 옵션 선택 -->
<div style="float: right;">
	<select  class="form-select" id="cntPerPage" name="sel" onchange="selChange()">
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
		<div class="searchDiv"><select  class="form-select" name="searchType">
			<option value="title" <c:if test="${!empty SearchVo.searchType and SearchVo.searchType eq 'title' }">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty SearchVo.searchType and SearchVo.searchType eq 'contentWriter' }">selected</c:if>>내용+작성자</option>
		</select></div>
		<div class="searchDiv"><input class="form-control" style="width:200px" type="text" name="searchValue" <c:if test="${!empty SearchVo.searchValue}">value="${SearchVo.searchValue }"</c:if>></div>
		<div class="searchDiv"><input type="hidden" name="category" value=${category }></div>
		<div class="searchDiv"><input type="submit"  class="btn btn-secondary" value="검색"></div>
</form>
<br><br>

총 ${list.size()}건이 조회되었습니다.
<!-- 리스트 테이블 -->
<table>
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
						<td>${vo.bidx }</td>
						<td>${vo.title }</td>
						<td>${vo.name }</td>
						<td>${vo.datetime }</td>
						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
</table>

<br>
<!-- 페이징 -->
<%-- <div style="display: block; text-align: center;">		
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
</div>  --%>

<!-- 페이징 -->
<div style="margin-left:38%">
	<ul class="pagination">		
		<c:if test="${paging.startPage != 1 }">
			<li class="page-item"><a class="page-link" href="list.do?category=2&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item  active"><b class="page-link">${p }</b></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li class="page-item"><a class="page-link" href="list.do?category=2&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<li class="page-item"><a class="page-link" href="list.do?category=2&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
		</c:if>
	</ul>
</div>


<!-- 공지게시판 작성은 관리자만 접근할수 있도록 함-->
<c:if test="${(login.pea_super =='N' && searchVo.category != 1) || login.pea_super =='Y'}">
<button style="float:right" class="btn btn-secondary" onclick="location.href='write.do?category=${category }'">작성하기</button>
</c:if>


</div>
<br>
<footer id="footer"></footer>
	<!-- <footer id="footer"></footer> -->
</body>
</html>