<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<!-- <meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" /> -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<title>leftBanner</title>
<style type="text/css">
body {
	margin:0;
}
.item-span{
	color: gray;
	font-size: 1em;
}
.px-4{
	padding: 0 !important;
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
}
.mb-5{
	margin: 1vh 0 !important;
}
</style>	
</c:if>

</head>
<body>

<h3 style="text-align:center; margin: 20px 0;">NEW ITEM!</h3>
	
	<div class="container px-4 px-lg-5 mt-5" style="width: 100%; margin: 0 !important;">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="itemList" style="width: 100%; margin:0;"></div>
	</div>
<script type="text/javascript">
$(function (){
	 $.ajax({
		url:"itemListNewLimit.do",
		type:"get",
		success:function(data){
			var html="";
			for(var i=0; i<data.length;i++){
			html +="<div class='col mb-5' style='width:100%; padding:0;'>";
			html +="<div class='card h-100' style='width:150px;text-align:center;margin:0 auto;'>";
			html +="<img class='card-img-top'  style='width: fit-content; height: 100px; max-width: 96%; margin: 0 auto;' src='<%=request.getContextPath()%>/item/imageView.do?originFileName="+data[i].img+"'/>";
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
		 	html +="<h6 class='fw-bolder' style='font-size:1em;text-align:center;'>"+data[i].name+"</h6>";
			html +="<i style='color:green' class='bi-circle-fill' style='text-align:center;'><span style='color:black;'>"+data[i].price+"</span></i>"; 
			html +="</div>";
			html +="</div>";
			html +="</div>";
			html +="</div>";
			}
			$("#itemList").html(html);
			
		}
	 })
})

</script>
</body>
</html>