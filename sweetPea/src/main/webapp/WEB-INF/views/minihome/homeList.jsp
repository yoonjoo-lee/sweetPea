<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<%@ page session="true"%>
<%@ page import="java.time.LocalDate"%>

<style>
.list-box {
    margin: 1vh;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
</style>
<!-- 글 -->
<div class='list'>
<ul>
	<c:forEach var="board" items='${list }'>
				<c:if test="${board.category == 2}">
					<c:if test="${board.title ==''}">
						<li><div class='list-box' id='basic-text' onclick="switchPage(${board.category})"  style="cursor:pointer">photo</div></li>
					</c:if>
					<c:if test="${board.title !=''}">
					<li>
						<div class='list-box' id='basic-text' onclick="switchPage(${board.category})"  style="cursor:pointer">${board.title }</div></li>
					</c:if>
				</c:if>
				<c:if test="${board.category != 2}">

					<li><div class='list-box' id='basic-text' onclick="switchPage(${board.category})"  style="cursor:pointer">${board.content }</div></li>

				</c:if>
	</c:forEach>
</ul>
</div>
<script>
// 글 클릭시 페이지 이동
function switchPage(category){

if(category==1){
		parent.clickThis("#1");
		location.href="mini-diary.do?uidx=${mini.uidx}";
	}else if(category==2){
		parent.clickThis("#2");
		location.href="<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=2";
	}else if(category==3){
		parent.clickThis("#3");
		location.href="<%=request.getContextPath()%>/miniroomboard2/boardList.do?category=3";
	} 
}

</script>


