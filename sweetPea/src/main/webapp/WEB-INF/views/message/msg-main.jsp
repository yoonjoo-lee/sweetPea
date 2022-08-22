<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
* {
	box-sizing: border-box;
}

.megBox h3,.megBox ul {
	text-align: center;
	margin-bottom: 0;
}

.megBox ul {
	list-style-type: none;
	padding: 0;
	width: 100%;
}

.megBox li {
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

.btnBox>input {
	float: right;
	margin-left: 0.5em;
}

.page-link {
	color: #fff;
	border-color: #ffc800;
	padding: 0.375rem 0.75rem;
	position: relative;
	display: block;
	text-decoration: none;
	border: 1px solid #e5e5e5;
}

a.page-link {
	background-color: #8CC4C0;
}

b.page-link {
	background-color: #723b80;
}

.myPaging {
	display: flex;
	list-style: none;
	justify-content: center;
	padding: 0;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
</style>
<script>
	async function delMsg(){
		var valueArr = new Array();
		var list = $("input[name='rowCheck']");
		var ft = '<%=request.getContextPath()%>';
		
		var checkboxValues = [];
	    $("input[name='rowCheck']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		var allData = {"checkBox": checkboxValues}
		if(checkboxValues.length == 0){
			Swal.fire({
			      title: '실패',
			      text: '삭제할 쪽지가 없습니다',
			      icon: 'error',
		    });
			return;
		}else{
			await Swal.fire({
				  text: '선택한 쪽지를 삭제하시겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText: '아니오'
				}).then((result) => {
				   if (result.isConfirmed) {
					   
					   $.ajax({
						  url: ft + "/message/delMsg.do",
						  type: "get",
						  data: allData,
						  success: async function(result){
							  await Swal.fire({
							      text: '삭제가 완료되었습니다',
							      icon: 'error',
						  		});
						    window.location.reload();
						  },
						  error: function (error){
						  	alert('다시 시도하세요');
						  }
						});
					  
				  }
				  else{
					window.location.reload();  
				  }
				})
			
			
			
		}
			
	}
</script>

<c:if test="${device eq 'MOBILE'}">
<style>
h3{
    font-size: 6vw;
    text-align: center;
}
.btnBox{
	height: 3vh;
}
.btnBox>input{
	float: right;
    margin: 0 2vw;
    width: 15vw;
    height: 100%;
    font-size: 3vw;
}
.megBox>ul{
	height: 5vh;
}
.megBox>ul>li{
	font-size: 2.5vw;
    line-height: 5vh;
}
.header-ul>li>input[type="checkbox"],.content-ul>li>input[type="checkbox"]{
	vertical-align: text-top;
	margin: 0;
}
</style>
<script>
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp"); 
		});
</script>
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet"/>


</c:if>

</head>
<body>
	<header id="header"></header>
	<h3>쪽지함</h3>
	<div class="btnBox">
		<c:if test="${login.pea_super eq 'Y'}">
			<input type="button" onclick="location.href='write.do'" value="쪽지쓰기">
		</c:if>
		<input type="button" onclick="delMsg()" value="삭제">
	</div>
	<br>
	<div class="megBox">
		<ul class="header-ul">
			<li><input type="checkbox" id="allCheck"></li>
			<li>보낸 사람</li>
			<li>제목</li>
			<li>받은 날짜</li>
		</ul>
		<c:if test="${list.size() == 0}">
			<ul class="content-ul">
				<li>등록된 쪽지가 없습니다.</li>
			</ul>
		</c:if>
		<c:if test="${list.size() > 0 }">
			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.view_check eq 'Y'}">
					<ul class="content-ul" style="color: lightgray;">
						<li><input type="checkbox" name="rowCheck" value="${vo.midx}" class="checkBox"></li>
						<li>${vo.writer}</li>
						<li onclick="location.href='content.do?midx=${vo.midx}'">${vo.title}</li>
						<li>${vo.datetime}</li>
					</ul>
				</c:if>
				<c:if test="${vo.view_check eq 'N'}">
					<ul class="content-ul">
						<li><input type="checkbox" name="rowCheck" value="${vo.midx}" class="checkBox"></li>
						<li>${vo.writer}</li>
						<li onclick="location.href='content.do?midx=${vo.midx}'">${vo.title}</li>
						<li>${vo.datetime}</li>
					</ul>
				</c:if>
			</c:forEach>
		</c:if>
		<div>
			<ul class="myPaging">
				<c:if test="${paging.startPage != 1 }">
					<li class="page-item"><a class="page-link" href="main.do?uidx=${login.uidx}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a></li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item  active"><b class="page-link">${p }</b></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li class="page-item"><a class="page-link" href="main.do?uidx=${login.uidx}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<li class="page-item"><a class="page-link" href="main.do?uidx=${login.uidx}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a></li>
				</c:if>
			</ul>
		</div>

	</div>
</body>
<script>
$(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").is(":checked"))
			$(".checkBox").prop("checked",true);
		else{
			$(".checkBox").prop("checked",false);
		}
	});
})
	
</script>
</html>
