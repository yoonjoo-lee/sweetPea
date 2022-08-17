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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
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

body{
font-family: ${myMini.font};
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
h1{
	margin:0;
}
.bi-plus-square-fill{
    font-size: 4vh;
    float: right;
    margin: 1vh;
}
table{
	margin-top: 2vh;
}
th,td{
	font-size: 3.5vw;
}
#mainBox{
	margin:0;
	margin-bottom: 10vh;
}
</style>
<script>
	function mobileWrite(){
		$("#mainBox").load("<%=request.getContextPath()%>/miniroomboard2/diary_write.do?uidx=${login.uidx}&category=3");
	}
</script>
</c:if>
</head>
<body>
	<h1>
<c:if test="${login != null}">
	<c:if test="${device eq 'PC'}">
	<i class="bi bi-plus-square-fill" style="color: grey;" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/diary_write.do?uidx=${login.uidx}&category=3'"></i>
	</c:if>
	<c:if test="${device eq 'MOBILE'}">
	<i class="bi bi-plus-square-fill" style="color: grey;" onclick="mobileWrite()"></i>
	</c:if>
</c:if>
	</h1>
	<c:forEach var="board" items='${list }'>
		<table>
			<thead>
				<tr>
					<th colspan=2>
					
							<b>${board.name }</b>
							<i class="bi bi-house-heart" onclick="openMini(${board.writer })">미니홈피</i>
							 (${board.date })
							 <c:if test="${login.uidx == board.writer }">
								<i class="bi bi-eraser"></i><i class="bi bi-trash" onclick="deletephoto(${board.mbidx})"></i>
							 </c:if>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width=120>
							<!-- 프로필 사진 -->
							<c:if test="${board.miniProfile == null}">
								<img class="profile" src="<%=request.getContextPath()%>/resources/upload/1.png">
							</c:if>
							<c:if test="${board.miniProfile != null}">
								<img class="profile" src="<%=request.getContextPath() %>/miniroomboard2/getProfile.do?originFileName=${board.miniProfile}">
							</c:if>
					</td>
					<td>
						${board.content }
					</td>
				</tr>
			</tbody>
		</table>
		
		
	</c:forEach>
	
<script>
// 게시글 작성자 미니홈피 방문하기
function openMini(writer){
		window.parent.location.href="<%=request.getContextPath()%>/mini/main.do?uidx="+writer+"";
}

/* 게시물 삭제 */
async function deletephoto(mbidx){
	Swal.fire({
		  title: '정말로 삭제하시겠습니까?',
		  text: "되돌릴 수 없어요!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제'
		}).then((result) => {
		  if (result.isConfirmed) {
				location.href="<%=request.getContextPath()%>/miniroomboard2/guestBookDelete.do?mbidx="+mbidx+"";
		    Swal.fire(
		      '삭제 성공!',
		      '삭제에 성공하였습니다.',
		      'success'
		    )
		  }
		})
}
</script>
</body>
</html>