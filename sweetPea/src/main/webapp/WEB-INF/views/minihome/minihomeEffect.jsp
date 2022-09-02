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

.itemBox{
	float:left;
	width:210px;
}
.itemImg{
	width:200px;
	height:100px;
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
h3{
	text-align: center;
}
.itemFullBox{
	display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
.itemBox {
    width: 46vw;
    margin: 1vh 1vw;
    float: inherit;
    border: 1px solid black;
    padding: 2vh 3vw;
    box-shadow: 1px 1px 5px 1px black;
}
b{
    color: grey;
    text-align: center;
    display: block;
    margin-bottom: 2vh;
}
.itemImg{
	width: fit-content;
    height: 15vh;
    max-width: 100%;
    display: block;
    margin: 0 auto;
}
.itemBtnBox{
	display: flex;
}
#changebtn {
    float: inherit;
    width: 100%;
    margin: 2vh 1vw;
}
</style>
</c:if>

</head>
<body>
<h3>아이템</h3>
<c:if test="${list.size()==0 }">
보유한 아이템이 없어요:(
</c:if>

<div class="itemFullBox">

<c:forEach var="item" items="${list }">
<div class="itemBox">
<b style='color:grey;'>${item.name }</b>
<img class="itemImg" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img}'/>
<div class="itemBtnBox">
<c:if test="${item.subcategory==1}">
<!-- 1.테마 2.미니룸 배경 3.캐릭터 4.동물 5.가구  -->
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=${item.img }&category=1'">변경</button><br> 
</c:if>
<c:if test="${item.subcategory==2}"><!-- 미니룸 배경 --> 
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=${item.img }&category=2'">m변경 </button><br> 
</c:if>
<c:if test="${item.subcategory==3 || item.subcategory==4 || item.subcategory==5}"><!-- 캐릭터 --> 
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/addTominiroom.do?uidx=${login.uidx }&iidx=${item.iidx }'">추가 </button>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/removeFromMiniroom.do?uidx=${login.uidx }&iidx=${item.iidx }'">제거 </button>
</c:if>
</div>
</div>
</c:forEach>

</div>



</body>
</html>