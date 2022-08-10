<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	h3,h4,h5{
		margin:0;
		text-indent: 5px;
	}
	.decalBox{
		display: inline-block;
		float: left;
		width: 48%;
		height: 100%;
	}
	.listBox{
		border: 1px solid gray;
		border-left: 0;
		border-right: 0;
		margin: 10px 0;
		padding: 5px;
	}
	ul{
		margin: 0;
		padding: 0;
		display: inline-block;
		list-style: none;
		font-size: 12px;
	}
	ul>li:first-child{
		font-weight: bold;
	}
	.btn{
		float: right;
	    width: 15%;
	    font-size: 10px;
	    display: block;
	    height: 30px;
	    margin-top: 10px;
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
async function addFriends(uidx){
	await Swal.fire({
		title: '수락하시겠습니까?',
		icon: 'question',
		showCancelButton: true,
		confirmButtonText: '예',
		cancelButtonText: '아니오',
		preConfirm: () => {
			$.ajax({
				url: "../mini/acceptFriends.do",
				type: "get",
				data:{"uidx": uidx, "bfidx": ${login.uidx}},
				success: async function(data){
					if(data == 1){
						await Swal.fire({
							title: '일촌완료',
							icon: 'success',
							confirmButtonText: '확인'
						});
						window.location.reload();	
					}
					else{
						alert("오류!");
					}
				}
			});
			
			
		}
	});
}

async function refuseFriends(uidx){
	await Swal.fire({
		title: '거절하시겠습니까?',
		icon: 'question',
		showCancelButton: true,
		confirmButtonText: '예',
		cancelButtonText: '아니오',
		preConfirm: () => {
			$.ajax({
				url: "../mini/refuseFriends.do",
				type: "get",
				data:{"uidx": uidx, "bfidx": ${login.uidx}},
				success: async function(data){
					if(data == 1){
						await Swal.fire({
							title: '거절하였습니다',
							icon: 'success',
							confirmButtonText: '확인'
						});
						window.location.reload();	
					}
					else{
						alert("오류!");
					}
				}
			});
			
			
		}
	});
}

async function cancelFriends(bfidx){
	await Swal.fire({
		title: '취소하시겠습니까?',
		icon: 'question',
		showCancelButton: true,
		confirmButtonText: '예',
		cancelButtonText: '아니오',
		preConfirm: () => {
			$.ajax({
				url: "../mini/cancelFriends.do",
				type: "get",
				data:{"uidx": ${login.uidx}, "bfidx": bfidx},
				success: async function(data){
					if(data == 1){
						await Swal.fire({
							title: '취소하였습니다',
							icon: 'success',
							confirmButtonText: '확인'
						});
						window.location.reload();	
					}
					else{
						alert("오류!");
					}
				}
			});
			
			
		}
	});
}

</script>
</head>
<body>
<h3>친구 신청 목록d</h3>
<hr>
<div class="decalBox">
	<h4>친구 요청 받기</h4>
	<c:forEach var="vo" items="${checkList}">
		<div class="listBox">
			<ul class="content-ul">
				<li>${vo.name}(${vo.id}) <span style="color: gray">${vo.fdate}</span></li>
				<li>요청자 일촌명 : ${vo.uname}</li>
				<li>　본인 일촌명 : ${vo.bfname}</li>
			</ul>
			<button class="btn" style="margin-left: 5px;" onclick="refuseFriends(${vo.uidx})">거절</button>
			<button class="btn" onclick="addFriends(${vo.uidx})">수락</button>
		</div>
	</c:forEach>
	
	<div>
		<ul class="myPaging">
			<c:if test="${checkPaging.startPage != 1 }">
				<li class="page-item"><a class="page-link" href="main.do?uidx=${login.uidx}&nowPage=${paging.startPage - 1 }&cntPerPage=${checkPaging.cntPerPage}">&lt;</a></li>
			</c:if>
			<c:forEach begin="${checkPaging.startPage }" end="${checkPaging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == checkPaging.nowPage }">
						<li class="page-item  active"><b class="page-link">${p }</b></li>
					</c:when>
					<c:when test="${p != checkPaging.nowPage }">
						<li class="page-item"><a class="page-link" href="main.do?uidx=${login.uidx}&nowPage=${p }&cntPerPage=${checkPaging.cntPerPage}">${p }</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${checkPaging.endPage != checkPaging.lastPage}">
				<li class="page-item"><a class="page-link" href="main.do?uidx=${login.uidx}&nowPage=${checkPaging.endPage+1 }&cntPerPage=${checkPaging.cntPerPage}">&gt;</a></li>
			</c:if>
		</ul>
	</div>
	
</div>
<div class="decalBox" style="margin-left: 2%">
	<h4>친구 신청</h4>
	<c:forEach var="vo" items="${acceptList}">
		<div class="listBox">
			<ul class="content-ul">
				<li>${vo.name}(${vo.id}) <span style="color: gray">${vo.fdate}</span></li>
				<li>　본인 일촌명 : ${vo.uname}</li>
				<li>상대방 일촌명 : ${vo.bfname}</li>
			</ul>
			<button class="btn" style="margin-left: 5px;" onclick="cancelFriends(${vo.bfidx})">취소</button>
		</div>
	</c:forEach>
</div>
</body>
</html>