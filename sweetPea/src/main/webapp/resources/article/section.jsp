<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<style type="text/css">
.lavel{
	width: 100%;
	height: 1.5rem;
	text-align: center;
	font-size: 0.95rem;
	background-color: #81c769;
	color: red;
}
@media (min-width: 992px){
	
}
.centerBanner{
	background-image: url("<%=request.getContextPath()%>/resources/images/banner3.png");
	width: 100%;
	height: 10rem;
	background-repeat: no-repeat;
	background-attachment: scroll;
	background-position: center center;
	background-size: cover;
}
.dealImg{
	width: 25%;
	cursor: pointer;
}
.item-span{
	color: gray;
}
</style>
</head>
<body>
	<div class="lavel">신상품</div>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${newList}" var="vo">
			<div class="col mb-5">
		        <div class="card h-100">
		            <img class="card-img-top" style="height: 12vh;" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img}'/>
		            <div class="card-body p-4">
		                <div class="text-center">
		                    <c:choose>
		                    <c:when test="${vo.subcategory == 1}">
		                    	<span class="item-span">[배경]</span>
		                    </c:when>
		                    <c:when test="${vo.subcategory == 2}">
		                    	<span class="item-span">[꾸미기]</span>
		                    </c:when>
		                    </c:choose>
		                    <h5 class="fw-bolder">${vo.name}</h5>
		                    <i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>${vo.price}
		                </div>
		            </div>
		            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                <div class="text-center">
			                <img class = 'dealImg money' src="./resources/icon/money_icon.png" onclick='itemShoppingAdd("+data[i].iidx+")'>
			                <img class = 'dealImg cart' src="./resources/icon/cart_icon.png" onclick='itemBuy()'>
			                <img class = 'dealImg gift' src="./resources/icon/gift_icon.png" onclick='itemGift()'>
		                </div>
		            </div>
		        </div>
		    </div>
			</c:forEach>
		</div>
	</div>
<div class="centerBanner"></div><br>
<div class="lavel">인기상품</div>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<c:forEach items="${mostList}" var="vo">
			<div class="col mb-5">
		        <div class="card h-100">
		            <img class="card-img-top" style="height: 12vh;" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img}'/>
		            <div class="card-body p-4">
		                <div class="text-center">
		                    <c:choose>
		                    <c:when test="${vo.subcategory == 1}">
		                    	<span class="item-span">[배경]</span>
		                    </c:when>
		                    <c:when test="${vo.subcategory == 2}">
		                    	<span class="item-span">[꾸미기]</span>
		                    </c:when>
		                    </c:choose>
		                    <h5 class="fw-bolder">${vo.name}</h5>
		                    <i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>${vo.price}
		                </div>
		            </div>
		            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		                <div class="text-center">
			                <img class = 'dealImg money' src="./resources/icon/money_icon.png" onclick='itemShoppingAdd("+data[i].iidx+")'>
			                <img class = 'dealImg cart' src="./resources/icon/cart_icon.png" onclick='itemBuy()'>
			                <img class = 'dealImg gift' src="./resources/icon/gift_icon.png" onclick='itemGift()'>
		                </div>
		            </div>
		        </div>
		    </div>
			</c:forEach>
		</div>
	</div>
</body>
</html>