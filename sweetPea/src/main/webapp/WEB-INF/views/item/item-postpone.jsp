<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<title>item-postpone</title>
</head>
<body>
	<h3 style="text-align:center;">ITEM-POSTPONE</h3>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="itemList" style="width: 100%"></div>
	</div>
<script>

/* 아이템 리스트 나열 */	
$(function itemSelectAll(){
	$.ajax({
	url:"itemSelectAll.do",
	type:"get",
	data:"cate="+7,
	success:function(data){
		var html="";
		for(var i=0; i<data.length;i++){
			html +="<div class='col mb-5' style='float:left;'>";
			html +="<div class='card h-100'>";
			html +="<img class='card-img-top' src='<spring:url value = '/images/itemImg/"+data[i].img+"'/>'>";
			html +="<div class='card-body p-4'>";
			html +="<div class='text-center'>";
			html +="<h5 class='fw-bolder'>"+data[i].name+"</h5>";
			html +="<i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>"+data[i].price;
			html +="</div>";
			html +="</div>";
			html +="<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
			html +="<div class='text-center'>";
			html +="<a class='btn btn-outline-dark mt-auto' href='javascript:void(0);' onclick='itemApproval("+data[i].iidx+",1);'>등록</a>&nbsp;";
			html +="<a class='btn btn-outline-dark mt-auto' href='javascript:void(0);' onclick='itemDel("+data[i].iidx+");'>삭제</a>";
			html +="</div>";
			html +="</div>";
			html +="</div>";
			html +="</div>";
			html +="</div>";
			html +="</div>";
		}
			$("#itemList").html(html);
							
		}

	})
					
})

function itemDel(iidx){
	var check = confirm("정말로 삭제하시겠습니까?");	
	if (check){
		location.href="itemDel.do?iidx="+iidx+"";
	} 
}

function itemApproval(iidx, check){
	console.log(iidx);
	console.log(check);
	$.ajax({
		url:"approvalCheck.do",
		type:"post",
		data:{"iidx":iidx,"check":check},
		success:function(data){
			alert('변경 되었습니다.');
			document.location.reload();
			
		}
	})
}
</script>
</body>
</html>