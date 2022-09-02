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
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
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
body{
margin: 0;
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

.mb-5{
/* 	margin-bottom: 3rem !important;
    width: 20%;
    margin: 2vw;
 */    
 float:left;
 width: 20%;
 margin: 1em; 
 padding: 0;
}
.card-img-top{
    width: fit-content;
    height: 15vh;
    max-width: 96%;
    margin: 0 auto;
}
/* h5{
	font-size: 2vw;
} */
.item-span{
	color: gray;
	font-size: 1em;
}
.list-label{
	border-bottom: 1px solid black;
	text-align: center;
	font-size: 18px;
	padding-bottom: 5px !important;
}
.itemList{
	padding:0;
}
.list-content li{
	float:left;
}
.itemList>li:first-child {
	width:28%;
	margin: 5px 0;
}
.itemList>li:nth-child(2){
	width:29%;
}
.list-content>li:not(:first-child){
	line-height: 210px;
	font-weight: bold;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
.itemList>li:nth-child(3){
	width:17%;
}
.itemList>li:nth-child(4){
	width:9%;
}
.itemList>li:last-child{
	width:17%;
}

.content-img{
    height: 200px;
    background-size: contain;
    background-position: center;
    background-repeat: no-repeat;
}
.list-content{
	border-bottom: 1px solid black;
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
.container{
	width: 100% !important;
    margin: 0;
    padding: 0;
}
.container *{
	font-size: 3vw;
}
.list-label{
    height: 5vh;
    line-height: 4vh;
    position: fixed;
    background-color: white;
}
</style>	
</c:if>

</head>
<body>
<c:if test="${device eq 'PC'}">
<br><br>
</c:if>
	<div style="width:90%;margin:0 auto;" class="container row">
		<c:if test="${ilist.size() == 0 || login.uidx == null }">
			<ul class="content-ul">
				<li>등록한 아이템이 없습니다.</li>
			</ul>
		</c:if>
		<c:if test="${ilist.size() >0 }">
			<ul class="list-label itemList">
				<li>이미지
				</li><li>이름
				</li><li>종류
				</li><li>가격
				</li><li>승인여부</li>
			</ul>
			<c:forEach var="vo" items="${ilist}">
				<ul class="list-content itemList">
					<li class='content-img' style="background-image: url(<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img})">
					</li><li>${vo.name}
					</li><li>
					<c:choose>
	                    <c:when test="${vo.subcategory == 1}">
          			        	<span class="item-span">[테마배경]</span>
	                    </c:when>
	                    <c:when test="${vo.subcategory == 2}">
          			        	<span class="item-span">[미니룸배경]</span>
	                    </c:when>
	                    <c:when test="${vo.subcategory == 3}">
	                    	<span class="item-span">[캐릭터]</span>
	                    </c:when>
	                    <c:when test="${vo.subcategory == 4}">
	                    	<span class="item-span">[동물]</span>
	                    </c:when>
	                    <c:when test="${vo.subcategory == 5}">
	                    	<span class="item-span">[가구]</span>
	                    </c:when>
	                    </c:choose>
                    </li><li><i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>${vo.price}
                    </li><li>
						<c:choose>
	                    <c:when test="${vo.approval eq 'Y' && vo.delyn eq 'N'}">
          			        	<span style="color:#007500">[승인]</span>
	                    </c:when>
	                    <c:when test="${vo.postpone eq 'Y' && vo.delyn eq 'N'}">
          			        	<span style="color:skyblue">[보류]</span>
	                    </c:when>
	                    <c:when test="${vo.delyn eq 'Y'}">
          			        	<span style="color:red">[거절]</span>
	                    </c:when>
	                    <c:when test="${vo.approval eq 'N' && vo.postpone eq 'N' && vo.delyn eq 'N'}">
	                    	<span style="color:gray">[승인 대기중]</span>
	                    </c:when>
	                    </c:choose>
					</li>
				</ul>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>