<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<div>얖ㅇㅇㅇㅇㅇㅇㅇ</div>
<%
LocalDate now = LocalDate.now(); // 현재 시간 정보 불러오기 
int year = now.getYear(); // 년
int monthValue = now.getMonthValue(); // 월 
int dayOfMonth = now.getDayOfMonth(); // 일
String dayOfWeek = now.getDayOfWeek().toString(); // 일


//윤년 계산하여 각 월의 일수 저장
int[] lastdate = {0,31,28,31,30,31,30,31,31,30,31,30,31}; 
if (year%4==0){ 
	if (year%100!=0){ 
		lastdate[2] = 29;
	}
	else { 
		if (year%400==0){ 
			lastdate[2] = 29;
		}else{
			lastdate[2] = 28;
		}
	}	
} else{
	lastdate[2] = 28;
}

int calcmonth = monthValue;

String month = month;
%>
<div class='month' id='basic-text'>
	<c:forEach var="date" begin="1" end="<%=lastdate[month] %>">
		<span>${date}<%-- <c:out value="${date}" /> --%></span>	
	</c:forEach>
</div>