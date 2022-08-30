<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${searchVo.category == 1}">
	<title>공지게시판</title>
</c:if>
<c:if test="${searchVo.category == 2}">
	<title>자유게시판</title>
</c:if>
<c:if test="${searchVo.category == 3}">
	<title>유머게시판</title>
</c:if>
<c:if test="${searchVo.category == 4}">
	<title>자주묻는질문</title>
</c:if>
<c:if test="${searchVo.category == 5}">
	<title>질의응답</title>
</c:if>
<c:if test="${searchVo.category == 6}">
	<title>신고관리</title>
</c:if>
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/resources/images/camelon.png">
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
		location.href="list.do?category="+${searchVo.category}+"&nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<style type="text/css">
#view{
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
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

.myPaging {
    display: flex;
    list-style: none;
    justify-content: center;
    padding: 0;
}
  
 /* @media all and (max-width: 768px) {
    
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
 */

@import url(https://fonts.googleapis.com/css?family=Roboto:700);
.button {
  background: #3D4C53;
  /* margin : 20px auto; */
  width : 200px;
  height : 50px;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
}
.btnTwo {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #26A69A;
  left : -250px;
  transition : .3s;
}
.btnText {
  color : white;
  transition : .3s;
  margin-top : 10px;
}
.btnText2 {
  margin-top : 53px;
  margin-right : -130px;
  color : #FFF;
}
.button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/
  left: -130px;
}
.button:hover .btnText{ /*When hovering over .button change .btnText*/
  margin-left : 65px;
}
.button:active { /*Clicked and held*/
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}

.listLookUp{
	font-size: 1em;
	float: right;
	margin: 1em;
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
#view{
	width: 100%;
}
td{
	font-size: 3vw;
	text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
tr>td:not(:nth-child(2)){
	text-align: center;
}
th,h2{
	text-align: center;
}

.searchDiv{
	padding: 0 !important;
	margin: 1vh 0;
}	
.form-control{
	width: 80vw !important;
}
.btn-secondary{
	width: 18vw !important;
	margin-left: 2vw;
}

.listLookUp{
	font-size: 3vw;
	float: right;
	margin: 1vh 3vw;
}
.btn-write{
	width: 22vw !important;
    margin: 1vh 1vw;
}
</style>
</c:if>

</head>
<body>

<header id="header"></header>
<br>
<div id="view">
<nav id="nav"></nav>
<br>
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
<c:if test="${searchVo.category == 6}">
	<h2>신고 관리</h2>
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
<c:if test="${category ne 6 }">
<form method="get" action="list.do">
		<div class="searchDiv"><select  class="form-select" name="searchType">
			<option value="title" <c:if test="${!empty SearchVo.searchType and SearchVo.searchType eq 'title' }">selected</c:if>>제목</option>
			<option value="contentWriter" <c:if test="${!empty SearchVo.searchType and SearchVo.searchType eq 'contentWriter' }">selected</c:if>>내용+작성자</option>
		</select></div>
		<div class="searchDiv"><input class="form-control" style="width:200px" type="text" name="searchValue" <c:if test="${!empty SearchVo.searchValue}">value="${SearchVo.searchValue }"</c:if>></div>
		<div class="searchDiv"><input type="hidden" name="category" value=${category }></div>
		<div class="searchDiv"><input type="submit"  class="btn btn-secondary" value="검색"></div>
</form>
</c:if>
<!-- 신고내역 페이지 정렬 -->	
<c:if test="${category eq 6 }">
	<div style="float: left; width: 15%;" class="button" onclick="location.href='reportPage.do?category=6&reply=1'">
	   <p class="btnText">미확인</p>
	   <div class="btnTwo">
	     <p class="btnText2">go</p>
	   </div>
	</div>
	<div style="float: left; width: 15%; margin-left:5px;" class="button" onclick="location.href='reportPage.do?category=6&reply=2'">
	   <p class="btnText">접수</p>
	   <div class="btnTwo">
	     <p class="btnText2">go</p>
	   </div>
	</div>
	<div style="float: left; width: 15%; margin-left:5px;" class="button" onclick="location.href='reportPage.do?category=6&reply=3'">
	   <p class="btnText">경고</p>
	   <div class="btnTwo">
	     <p class="btnText2">go</p>
	   </div>
	</div>
	<div style="float: left; width: 15%; margin-left:5px;" class="button" onclick="location.href='reportPage.do?category=6&reply=4'">
	   <p class="btnText">거절</p>
	   <div class="btnTwo">
	     <p class="btnText2">go</p>
	   </div>
	</div>
	<br>
</c:if>
<br><br>


<span class= "listLookUp">총 ${list.size()}건이 조회되었습니다.</span>

<!-- 리스트 테이블 -->
<table>
		<thead>
			<tr>
				<th>글번호</th>
				<c:if test="${searchVo.category == 6 }">
					<th>신고유형</th>
					<th>신고이유</th>
					<th>상태</th>
					<th>신고일자</th>
				</c:if>
				<c:if test="${searchVo.category != 6 }">
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list.size() == 0}">
				<tr>
					<td colspan="4">등록된 게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size() > 0 }">
				<c:forEach var="vo" items="${list }" varStatus="status">
					<tr onclick="location.href='view.do?bidx=${vo.bidx }&category=${vo.category }&ridx=${vo.ridx }'">
						<td>${vo.rnum }</td>
						<c:if test="${searchVo.category==6 }">
							<c:if test="${vo.report==1}">
								<td>욕설/비방</td>
							</c:if>
							<c:if test="${vo.report==2}">
								<td>악성루머</td>
							</c:if>
							<c:if test="${vo.report==3}">
								<td>광고글도배</td>
							</c:if>
							<c:if test="${vo.report==4}">
								<td>기타</td>
							</c:if>
							
							<td>${vo.content }</td>
							
							<c:if test="${vo.reply==1}">
								<td><p style="color:orange;">미확인</p></td>
							</c:if>
							<c:if test="${vo.reply==2}">
								<td>접수</td>
							</c:if>
							<c:if test="${vo.reply==3}">
								<td>경고</td>
							</c:if>
							<c:if test="${vo.reply==4}">
								<td>거절</td>
							</c:if>
						</c:if>
						
						<c:if test="${searchVo.category != 6 }">
							
							<td>${vo.title }</td>
							<td>${vo.name }</td>
						</c:if>
						<td>${vo.datetime }</td>
						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
</table>

<!-- 공지게시판 작성은 관리자만 접근할수 있도록 함-->
<c:if test="${(login.pea_super =='N' && searchVo.category != 1) || login.pea_super =='Y'}">
<button style="float:right" class="btn btn-secondary btn-write" onclick="location.href='write.do?category=${category }'">작성하기</button>
</c:if>
<br><br>
<!-- 페이징 -->
<c:if test="${category ne 6 }">
<div>
	<ul class="myPaging">		
		<c:if test="${paging.startPage != 1 }">
			<li class="page-item"><a class="page-link" href="list.do?category=${searchVo.category}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item  active"><b class="page-link">${p }</b></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li class="page-item"><a class="page-link" href="list.do?category=${searchVo.category}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<li class="page-item"><a class="page-link" href="list.do?category=${searchVo.category}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
		</c:if>
	</ul>
</div>
</c:if>
<!-- 페이징 (신고내역 페이지)	  --> 
<c:if test="${category eq 6 }">
<div>
	<ul class="myPaging">		
		<c:if test="${paging.startPage != 1 }">
			<li class="page-item"><a class="page-link" href="reportPage.do?category=${searchVo.category}&reply=${reply }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<li class="page-item  active"><b class="page-link">${p }</b></li>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<li class="page-item"><a class="page-link" href="reportPage.do?category=${searchVo.category}&reply=${reply }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<li class="page-item"><a class="page-link" href="reportPage.do?category=${searchVo.category}&reply=${reply }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
		</c:if>
	</ul>
</div>
</c:if>

</div>
<br>
<footer id="footer"></footer>
	<!-- <footer id="footer"></footer> -->
</body>
</html>