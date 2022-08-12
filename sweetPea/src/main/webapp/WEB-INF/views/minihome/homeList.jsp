<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<%@ page session="true"%>
<%@ page import="java.time.LocalDate"%>

<style>
.list-box{
	/* border-radius: 10px; */
	/* box-shadow: 1px 2px 2px 1px rgba(34, 36, 38, 0.15); */
}

.list-box {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>
<!-- 글 -->
<div class='list'>
<ul>
	<c:forEach var="board" items='${list }'>
				<%-- <div class='diary-date' id='bold-text'>
					${board.date }
				</div> --%>
				<c:if test="${board.category == 2}">
					<li><div class='list-box' id='basic-text'>${board.title }</div></li>
				</c:if>
				<c:if test="${board.category != 2}">
					<li><div class='list-box' id='basic-text'>${board.content }</div></li>
				</c:if>
	</c:forEach>
</ul>
</div>


