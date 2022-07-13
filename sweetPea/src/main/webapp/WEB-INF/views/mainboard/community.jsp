<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			width: 60%;
			margin: 0 auto;
		}
		#footer{
			width: 100%;
			bottom: 0;
			left: 0;
			position: absolute;
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
  
 @media all and (max-width: 768px) {
    
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
</style>
</head>

<body>
<header id="header"></header>
<div id="view">
<h2>커뮤니티</h2>
<h4>공지게시판</h4>
<div id="boardList1">
</div>
<h4>자유게시판</h4>
<div id="boardList2">
</div>
<h4>유머게시판</h4>
<div id="boardList3">
</div>
</div>
</body>


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
				html+="<td>"+data[i].bidx+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="<td>"+data[i].datetime+"</td>";
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
				html+="<td>"+data[i].bidx+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="<td>"+data[i].datetime+"</td>";
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
				html+="<td>"+data[i].bidx+"</td>";
				html+="<td><a href='view.do?bidx="+data[i].bidx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="<td>"+data[i].datetime+"</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#boardList3").html(html);
		}
	});
})
</script>
</html>