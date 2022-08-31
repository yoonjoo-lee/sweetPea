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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>item-approval</title>

<style type="text/css">
.mb-5{
	margin-bottom: 3rem !important;
    width: 20%;
    margin: 1em;
}
.card-img-top{
    width: fit-content;
    height: 150px;
    max-width: 96%;
    margin: 0 auto;
}
h5{
	font-size: 1.2em;
}
.item-span{
	color: gray;
	font-size: 1em;
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
.row{
   flex-wrap: nowrap !important;
   justify-content: start !important;
}
.col{
	width: 45% !important;
}
.container{
	overflow-x: scroll;
	height: 100%;
	padding: 0 !important;
	padding-bottom: 5vh !important;
	width: 100% !important;
}
.mb-5{
	margin: 1vh 5vw !important;
}
.p-4{
	padding: 1rem !important;
	height: 20vh;
}
.card-footer{
	padding-top: 0 !important;
}
.card-img-top{
    height: 20vh;
}
.text-center{
	font-size: 3vw;
}
.text-center>h5{
	font-size: 5vw;
	margin: 1vh 0;
}
.h-100{
	width: 45vw;
}
</style>	
</c:if>

</head>
<body>
	<h3 style="text-align:center;">ITEM-APPROVAL</h3>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="itemList" style="width: 100%"></div>
	</div>
<script>

/* 아이템 리스트 나열 */	
$(function itemSelectAll(){
	var category = ${category};
	$.ajax({
	url:"itemSelectAll.do",
	type:"get",
	data:{"cate":6,"category":4,"subcategory":6},
	success:function(data){
		var html="";
		for(var i=0; i<data.length;i++){
			html +="<div class='col mb-5' style='float:left;width: 20%;margin: 1em; padding: 0;'>";
			html +="<div class='card h-100' style='width:100%'>";
			html +="<img class='card-img-top' src='<%=request.getContextPath()%>/item/imageView.do?originFileName="+data[i].img+"'/>";
			html +="<div class='card-body p-4'>";
			html +="<div class='text-center'>";
			if(data[i].subcategory == 1){
					html +="<span class='item-span'>[테마배경]</span>";
				}else if(data[i].subcategory == 2){
					html +="<span class='item-span'>[미니룸배경]</span>";
				}else if(data[i].subcategory == 3){
					html +="<span class='item-span'>[캐릭터]</span>";
				}else if(data[i].subcategory == 4){
					html +="<span class='item-span'>[글꼴]</span>";
				}else if(data[i].subcategory == 5){
					html +="<span class='item-span'>[가구]</span>";
				}
			html +="<h5 class='fw-bolder'>"+data[i].name+"</h5>";
			html +="<i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>"+data[i].price;
			html +="</div>";
			html +="</div>";
			html +="<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
			html +="<div class='text-center'>";
			html +="<a class='btn btn-outline-dark mt-auto' href='javascript:void(0);' onclick='itemApproval("+data[i].iidx+",1);'>등록</a>&nbsp;";
			html +="<a class='btn btn-outline-dark mt-auto' href='javascript:void(0);' onclick='itemApproval("+data[i].iidx+",2);'>보류</a>";
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

/* 아이템 승인 버튼  */
function itemApproval(iidx, check){
	console.log(iidx);
	console.log(check);
	$.ajax({
		url:"approvalCheck.do",
		type:"post",
		data:{"iidx":iidx,"check":check},
		success: async function(data){
			console.log(data);
			console.log(check);
			if(check==1){
			await Swal.fire({
					text: '처리 완료',
					icon: 'success',
					timer: 2000,
				    timerProgressBar: true,
				})
					window.location.reload();
			}else{
				await Swal.fire({
				text: '보류로 이동',
				icon: 'info',
				timer: 2000,
			    timerProgressBar: true,
			})
				window.location.reload();
			}
			
		}
	})
}
</script>
</body>
</html>