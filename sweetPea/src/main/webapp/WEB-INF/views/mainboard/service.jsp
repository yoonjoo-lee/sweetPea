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
</style>

</head>
<body>
<header id="header"></header>
<div id="view">
<h2>고객센터</h2><br>
<button onclick="boardList4()">FAQ</button>
<button onclick="boardList5()">Q&A</button>
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
			html += "<table border='1' width='1000' height='300'>";
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
				html+="<td><a href='view.do?bidx="+data[i].bidx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
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
			html += "<table border='1' width='1000' height='300'>";
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
				html+="<td><a href='view.do?bidx="+data[i].bidx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
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
			html += "<table border='1' width='1000' height='300'>";
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
				html+="<td><a href='view.do?bidx="+data[i].bidx+"'>"+data[i].title+"</a></td>";
				html+="<td>"+data[i].name+"</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#boardList").html(html);
		}
	});
}
</script>
</body>
</html>