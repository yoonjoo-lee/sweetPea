<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>

<% Integer day = (Integer)session.getAttribute("day"); %>
<!-- 달력 -->
<div class='day' id='bold-text'>
<span id='demo'></span>${year}.${month}.<span id="day">${saveDay}</span><br></div>
<div class='month' id='basic-text'>
	<c:forEach var="date" begin="1" end="${monthByDate}">
		<span onclick="openlist(${year},${month},${date})">${date}</span>	
	</c:forEach>
</div>
<button onclick="test()">gg</button>

<script>
/* 날짜별 글 불러오기 */
function openlist(year,month,day){
	sessionStorage.setItem("testday", day ); // 저장
	
 	$("#day").text(day); 
	$.ajax({
		url: "<%=request.getContextPath()%>/miniroomboard2/boardByDate.do",
		type: "GET",
		data: {"year":year, "month":month, "day":day},
		success: function(html){
			console.log("글 리스트 오픈 성공");
			$("#board").html(html);
		},
		error: function(){
			console.log("답변 창 오픈 실패");
		}
	}) 
}
$(function test(){
	if(sessionStorage.getItem("testday")==null){
		console.log("nulllllll");
	}else{
		var testday=sessionStorage.getItem("testday"); // mineItRecord
		console.log(testday);
		$("#day").text(testday); 
	}
})
</script>