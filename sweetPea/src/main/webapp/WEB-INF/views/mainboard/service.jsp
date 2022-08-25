<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  
  
  }
   */
  
  
  
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

<c:if test="${device eq 'MOBILE' }">
<style>
#view{
	width: 100% !important;
}
.button{
	width: 46% !important;
	margin: 1vh 2vw !important;
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
<!-- <h2>고객센터</h2><br> -->
<!-- <button class="btn btn-secondary" onclick="boardList4()">FAQ</button>
<button class="btn btn-secondary" onclick="boardList5()">Q&A</button> -->

<div style="float: left; width: 15%;" class="button" onclick="boardList4()">
   <p class="btnText">FAQ</p>
   <div class="btnTwo">
     <p class="btnText2">really?</p>
   </div>
</div>
<div style="float: left; width: 15%; margin-left:5px;" class="button" onclick="boardList5()">
   <p class="btnText">Q&A</p>
   <div class="btnTwo">
     <p class="btnText2">really?</p>
   </div>
</div>

<div id="boardList">
</div>
</div>
<script>
$(function (){
	$.ajax({
		url:"boardList.do?category=4",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>글번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].bidx+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"&category="+data[i].category+"&ridx="+data[i].ridx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="</tr>";
			}
			if (data.length==0){
				html+="<tr>";
				html+="<td colspan=3>등록된 게시물이 없습니다.</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			if ('${login.pea_super}'=='Y'){
				html += "<br>";
				html += "<button style='float:right' class='btn btn-secondary' onclick='location.href=`write.do?category=4`'>작성하기</button>";
				html += "<br>";
				}
			$("#boardList").html(html);
		}
	});
})

function boardList4(){
	$.ajax({
		url:"boardList.do?category=4",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>글번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].bidx+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"&category="+data[i].category+"&ridx="+data[i].ridx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="</tr>";
			}
			if (data.length==0){
				html+="<tr>";
				html+="<td colspan=3>등록된 게시물이 없습니다.</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			if ('${login.pea_super}'=='Y'){
				html += "<br>";
				html += "<button style='float:right' class='btn btn-secondary' onclick='location.href=`write.do?category=4`'>작성하기</button>";
				html += "<br>";
				}
			$("#boardList").html(html);
		}
	});
}

function boardList5(){
	$.ajax({
		url:"boardList.do?category=5",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>글번호</th>";
			html += "<th>제목</th>";
			html += "<th>작성자</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].bidx+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"&category="+data[i].category+"&ridx="+data[i].ridx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="</tr>";
			}
			if (data.length==0){
				html+="<tr>";
				html+="<td colspan=3>등록된 게시물이 없습니다.</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";

			html += "<br>";
			if ('${login}'!=''){
				html += "<button style='float:right' class='btn btn-secondary' onclick='location.href=`write.do?category=5`'>작성하기</button>";
			}
			html += "<br>";
			$("#boardList").html(html);
		}
	});
}
</script>
</body>
</html>