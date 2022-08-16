<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap icons-->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>MY ITEM LIST</title>
<script type="text/javascript">
$(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").is(":checked"))
			$(".checkBox").prop("checked",true);
		else{
			$(".checkBox").prop("checked",false);
		}
	});
})

/* 내 아이템 리스트 */
</script>
<style>
* {
	box-sizing: border-box;
}

h3, ul {
	text-align: center;
	margin-bottom: 0;
}

ul {
	list-style-type: none;
	padding: 0;
	width: 100%;
}

li {
	display: inline-block;
	font-size: 1.1em;
}

.header-ul {
	background-color: #52C3BD;
	color: white;
	padding: 0.2em 0;
}

.content-ul {
	background-color: #e5e5e5;
	padding: 0.5em 0;
	font-size: 0.8em;
	margin-top: 0.2em;
}

.header-ul>li:first-child, .content-ul>li:fist-child {
	width: 10%;
}
/* 구매버튼, 삭제버튼 오른쪽 정렬  */
.btnBox>input {
	float: right;
	margin-left: 0.5em;
}

/* 장바구니 리스트 순서   */
.header-ul>li:first-child, .content-ul>li:fist-child {
	width: 10%;
}

.header-ul>li:nth-child(2), .content-ul>li:nth-child(2) {
	width: 15%
}

.header-ul>li:nth-child(3), .content-ul>li:nth-child(3) {
	width: 45%;
	cursor: pointer;
}

.header-ul>li:last-child, .content-ul>li:last-child {
	width: 25%;
}

.btn btn-secondary {
	
}
</style>
</head>
<body>
	<div>
		<div style="text-align:right;">
			<c:if test="${login.uidx >0 }">
				<!-- <input type="button" class="btn btn-secondary" onclick="myItemDel()" value="삭제"> -->
			</c:if>
		</div>
		<ul class="header-ul">
			<li><input type="checkbox" id="allCheck"></li>
			<li>사진</li>
			<li>아이템명</li>
			<!-- <li>상품금액</li> -->

		</ul>
		<c:if test="${ilist.size() == 0 || login.uidx == null }">
			<ul class="content-ul">
				<li>등록된 아이템이 없습니다.</li>
			</ul>
		</c:if>
		<c:if test="${ilist.size() >0 }">
			<c:forEach var="vo" items="${ilist}">
				<ul class="content-ul">
					<li><input type="checkbox" name="rowCheck" value="${vo.iidx}" class="checkBox"></li>
					<li><img src="<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img}" style="width:100px;height:100px;"></li>
					<li>${vo.name}</li>
				<%-- 	<li>${vo.price} 개</li> --%>
				</ul>
			</c:forEach>
		</c:if>
	</div>
	
</body>
</html>