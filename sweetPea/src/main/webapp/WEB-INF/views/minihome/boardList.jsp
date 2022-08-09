<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<%@ page session="true"%>
<%@ page import="java.time.LocalDate"%>

<style>
.diary-box{
	border-radius: 10px;
	box-shadow: 2px 3px 4px 2px rgba(34, 36, 38, 0.15);
}
</style>
<!-- 글 -->
<div class='diary'>
	<c:forEach var="board" items='${list }'>
		<c:if test="${board.secret=='Y' && login.uidx == mini.uidx}">
			<div class='diary-box'>
				<div class='diary-date' id='bold-text'>
					<i class='bi-lock-fill'></i>${board.secret}${board.date }<span style='float: right;'> <i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i> <i class='bi-trash' onclick=''></i></span>
				</div>
				<div class='diary-text' id='basic-text'>${board.content }</div>
			</div>
		</c:if>
		<c:if test="${board.secret!='Y'}">
			<div class='diary-box'>
				<div class='diary-date' id='bold-text'>
					${board.date }<span style='float: right;'> <i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i> <i class='bi-trash'onclick=''></i></span>
				</div>
				<div class='diary-text' id='basic-text'>${board.content }</div>
			</div>
		</c:if>
	</c:forEach>
</div>


