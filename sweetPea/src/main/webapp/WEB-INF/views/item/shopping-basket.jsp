<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" /> -->
<!-- <meta name="description" content="" />
<meta name="author" content="" />
 --><title>SHOPPING BASKET</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.side-nav {
	display: inline-block;
	float: left;
	width: 10vw;
	height: 60vh;
	margin-bottom: 15em;
}

.loginBox {
	display: inline-block;
	width: 100%;
	height: 17vh;
	border: 1px solid black;
}

.login-top {
	font-size: 0.1em;
	margin-top: 3em;
	height: 20%;
}

.login-top>span {
	float: left;
	font-size: 9em;
	margin-left: 1em;
	color: silver;
}

.login-top>input {
	float: right;
	margin-right: 3em;
}

.login-center {
	height: 55%;
}

.login-bottom {
	height: 22%;
}

.login-center div {
	display: inline-block;
	height: 85%;
}

.profile {
	height: 85%;
	border: 1px solid black;
	width: 40%;
	margin-left: 5%;
}

.info {
	width: 50%;
}

.info ul {
	list-style: none;
	font-size: 0.05em;
	padding: 0;
}

.login-bottom>input {
	width: 85%;
	display: block;
	margin: 0 auto;
	font-size: 0.8em;
}

input {
	margin: 0;
	font-family: inherit;
	font-size: inherit;
	line-height: inherit;
}

.categoryBox {
	border: 1px solid black;
	margin-top: 1.5vh;
}

.categoryBox>h3 {
	margin: 1vh 0;
	text-align: center;
}

.categoryBox>ul {
	font-size: 0.8em;
}

a:hover {
	cursor: pointer;
	text-decoration: underline;
	color: aqua;
}

.leftBanner {
	background-image:
		url("<%=request.getContextPath()%>/resources/images/leftbanner.png");
	width: 100%;
	height: 100%;
	display: block;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover;
}
</style>
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
/* 장바구니 목록삭제  */

	async function delCheckItem(){
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
			      text: '삭제할 아이템이 없습니다',
			      icon: 'error',
		    });
			return;
		}else{
			await Swal.fire({
				  text: '선택한 아이템을 삭제하시겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText: '아니오'
				}).then((result) => {
				   if (result.isConfirmed) {
					   
					   $.ajax({
						  url: ft + "/item/delCheckItem.do",
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
</head>
<body>
	<h3>SHOPPING-BASKET</h3>
	<div class="btnBox">
		<input type="button" onclick="location.href='itemBuy.do'" value="구매하기"> <input type="button" onclick="delCheckItem()" value="삭제">
	</div>
	<br>
	<div>
		<ul class="header-ul">
			<li><input type="checkbox" id="allCheck"></li>
			<li>ITEM-MAKER</li>
			<li>ITEM-NAME</li>
			<li>담은 날짜</li>
		</ul>
		<c:if test="${list.size() == 0}">
			<ul class="content-ul">
				<li>등록된 아이템이 없습니다.</li>
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
</html>



















