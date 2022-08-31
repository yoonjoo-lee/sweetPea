<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/resources/images/camelon.png">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>

<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<style type="text/css">
#view{
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
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
  
/*  @media all and (max-width: 768px) {
    
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
  
  
  } */
  
  
  
  

@import url(https://fonts.googleapis.com/css?family=Roboto:700);
.button {
  background: #3D4C53;
  margin : 20px auto;
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
th{
	text-align: center;
}	
</style>
</c:if>

</head>

<body>
<article>
<header id="header"></header>
<br>
<div id="view">
<nav id="nav"></nav>
<br>
<section>
<!-- <h2>커뮤니티</h2> -->
<!-- <h4>공지게시판</h4> -->
<div class="button" onclick="location.href='<%=request.getContextPath()%>/mainboard/list.do?category=1'">
   <p class="btnText">공지게시판</p>
   <div class="btnTwo">
     <p class="btnText2">go!</p>
   </div>
</div>
 
<div id="boardList1">
</div>
<!-- <h4>자유게시판</h4> -->
<div class="button" onclick="location.href='<%=request.getContextPath()%>/mainboard/list.do?category=2'">
   <p class="btnText">자유게시판</p>
   <div class="btnTwo">
     <p class="btnText2">go!</p>
   </div>
</div>
<div id="boardList2">
</div>
<!-- <h4>유머게시판</h4> -->
<div class="button" onclick="location.href='<%=request.getContextPath()%>/mainboard/list.do?category=3'">
   <p class="btnText">유머게시판</p>
   <div class="btnTwo">
     <p class="btnText2">go!</p>
   </div>
</div>
<div id="boardList3">
</div>
</section>
</div>
<br>
<footer id="footer"></footer>
<script>
$(document).ready(function(){
	$.ajax({
		url:"boardList.do?category=1",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>글번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "<th>작성일</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].rnum+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"&category="+data[i].category+"&ridx="+data[i].ridx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="<td>"+data[i].datetime+"</td>";
				html+="</tr>";
			}
			if (data.length==0){
				html+="<tr>";
				html+="<td colspan=3>등록된 게시물이 없습니다.</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#boardList1").html(html);
		}
	});
})

$(document).ready(function(){
	$.ajax({
		url:"boardList.do?category=2",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>글번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "<th>작성일</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].rnum+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"&category="+data[i].category+"&ridx="+data[i].ridx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="<td>"+data[i].datetime+"</td>";
				html+="</tr>";
			}
			if (data.length==0){
				html+="<tr>";
				html+="<td colspan=3>등록된 게시물이 없습니다.</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#boardList2").html(html);
		}
	});
})

$(document).ready(function(){
	$.ajax({
		url:"boardList.do?category=3",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>글번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "<th>작성일</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].rnum+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"&category="+data[i].category+"&ridx="+data[i].ridx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="<td>"+data[i].datetime+"</td>";
				html+="</tr>";
			}
			if (data.length==0){
				html+="<tr>";
				html+="<td colspan=3>등록된 게시물이 없습니다.</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#boardList3").html(html);
		}
	});
})
</script>

</article>
</body>
</html>