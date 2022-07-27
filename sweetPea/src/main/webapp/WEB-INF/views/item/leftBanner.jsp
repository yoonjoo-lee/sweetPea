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
</head>
<body>

<h3 style="text-align:center;">NEW ITEM!</h3>
	
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="itemList" style="width: 100%"></div>
	</div>
<script type="text/javascript">
$(function (){
	 $.ajax({
		url:"itemListNewLimit.do",
		type:"get",
		success:function(data){
			var html="";
			for(var i=0; i<data.length;i++){
			html +="<div class='col mb-5' style='float:left;'>";
			html +="<div class='card h-100'>";
			html +="<img class='card-img-top' src='<spring:url value = '/images/itemImg/"+data[i].img+"'/>'>"; 
			/* html +="<div class='card-body p-4'>"; */
			/* html +="<div class='text-center'>"; */
			 	html +="<h6 class='fw-bolder'>"+data[i].name+"</h6>";
				html +="<i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>"+data[i].price; 
			/* html +="</div>"; */
			/* html +="</div>"; */
			/* html +="<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
			html +="</div>"; */
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