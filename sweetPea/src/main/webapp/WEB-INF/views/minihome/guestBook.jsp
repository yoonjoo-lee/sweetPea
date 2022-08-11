<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style>
/* #content {
	display: inline-block;
	vertical-align: top;
} */

.profile {
	width: 120px;
	height: 120px;
}

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
</style>
</head>
<body>
	<h1>
		<i class="bi bi-plus-square-fill" style="color: grey;" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/diary_write.do?uidx=${login.uidx}&category=3'"></i>
	</h1>
	<c:forEach var="board" items='${list }'>
		<table>
			<thead>
				<tr>
					<th colspan=2>
					
							<b>${board.name }</b>
							<i class="bi bi-house-heart" onclick="openMini(${board.writer })">미니홈피</i>
							 (${board.date })
							<i class="bi bi-eraser"></i><i class="bi bi-trash" onclick=""></i>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width=120>
							<img class="profile" src="${board.profile }" alt=''>
					</td>
					<td>
						${board.content }
					</td>
				</tr>
			</tbody>
		</table>
		
		
	</c:forEach>
	
<script>
function openMini(writer){
	<%-- location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+writer+""; --%>
	var popupX = (document.body.offsetWidth / 2) - (1100 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - 350;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	
	var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase()));
	 
	if (mobile) { 
		window.location.href="<%=request.getContextPath()%>/mini/main.do?uidx=${vo.uidx}";
	}else{
		window.open("<%=request.getContextPath()%>/mini/main.do?uidx="+writer+"",'name',
				'resizable=no width=1300 height=650,left='+popupX+',top='+popupY);
	}
}
</script>
</body>
</html>