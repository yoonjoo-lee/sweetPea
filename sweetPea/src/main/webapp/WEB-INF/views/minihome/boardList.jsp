<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<%@ page session="true"%>
<%@ page import="java.time.LocalDate"%>
<style>

</style>


<%-- <%!
public void monthDown() {
	calcmonth -= 1;
	if (calcmonth<=0){ calcmonth=12; }
}
%> --%>



	<div class='diary'>
		<!-- for(var i=0; i<data.length;i++){ -->
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


