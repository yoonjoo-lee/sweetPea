<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<title>Insert title here</title>
<style>
table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
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
	color: #3c434a;
	/* background: #73685d; */
	background: #dcdcde;
	/* background: medium turquoise;  */
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	color: #73685d;
}

@media all and (max-width: 500px) {
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
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
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

/* 변경 버튼  */
#changebtn{
float:right; 
width:60px; 
margin:5px 10px;
}

body{
font-family: ${myMini.font};
}
</style>
</head>
<body>
<h3>배경</h3>
<c:forEach var="item" items="${list }">
<div style='float:left; width:210px;'>
<b style='color:grey;'>${item.name }</b>
<img width="200" height="100" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img}'/>
<c:if test="${item.subcategory==1}">
<!-- 일단 배경을 카테로리 1로 함  -->
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=${item.img }&category=1'">변경</button><br> 
</c:if>
<c:if test="${item.subcategory==2}"><!-- 캐릭터 --> 
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/addTominiroom.do?uidx=${login.uidx }&iidx=${item.iidx }'">추가 </button><br> 
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/removeFromMiniroom.do?uidx=${login.uidx }&iidx=${item.iidx }'">제거 </button><br> 
</c:if>
<c:if test="${item.subcategory==3}"><!-- 미니룸 배경 --> 
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=${item.img }&category=3'">m변경 </button><br> 
</c:if>
</div>
</c:forEach>




</body>
</html>