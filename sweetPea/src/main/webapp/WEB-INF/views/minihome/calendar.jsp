<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<style>
.eachdate:hover{
color:#fff;
}
</style>

<!-- 달력 -->
<div class='day' id='bold-text'>
<span id='demo'></span>${year}.${month}.<span id="day"></span><br></div>
<div class='month' id='basic-text'>
	<c:forEach var="date" begin="1" end="${monthByDate}">
		<span class="eachdate" onclick="openlist(${year},${month},${date})">${date}&nbsp;</span>	
	</c:forEach>
</div>
<script>
/* 날짜별 글 불러오기 */
function openlist(year,month,day){
	sessionStorage.setItem("clickday", day ); // 저장
	
 	$("#day").text(day); 
	$.ajax({
		url: "<%=request.getContextPath()%>/miniroomboard2/boardByDate.do",
		type: "GET",
		data: {"year":year, "month":month, "day":day, "category":1},
		success: function(html){
			console.log("글 리스트 오픈 성공");
			$("#board").html(html);
		},
		error: function(){
			console.log("답변 창 오픈 실패");
		}
	}) 
}

/* 클릭 날짜 세션 값에 저장 */
var tmpday = ${day};
$(function (){
	if(sessionStorage.getItem("clickday")!=null){
		var clickday=sessionStorage.getItem("clickday"); 
		$("#day").text(clickday); 
	}else{
		$("#day").text(tmpday); 
	};
	
 	$(".eachdate").mouseover(function(){
		/* $(".cursor").css("background-color","black"); */
		mouseCursor.classList.add("link-grow");
		mouseCursor.style.zIndex = "-1";
		mouseCursor.classList.add("hovered-link"); 
	})
	$(".eachdate").mouseleave(function(){
		/* $(".cursor").css("background-color","inherit"); */
		mouseCursor.classList.remove("link-grow");
      	mouseCursor.style.zIndex = "1000";
      	mouseCursor.classList.remove("hovered-link");
	}) 
})
</script>