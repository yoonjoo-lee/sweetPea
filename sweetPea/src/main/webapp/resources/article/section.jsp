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
        <%-- <link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" /> --%>
<style type="text/css">
.lavel{
	width: 100%;
    height: 40px;
    text-align: center;
    font-size: 17px;
    background-color: #81c769;
    color: red;
    font-weight: bold;
    line-height: 40px;
    margin: 20px 0;
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
	font-size: 1em;
}

.section-container{
	width: 95%;
	margin: 50px auto;
}
.container-content{
	justify-content: center;
	display: flex;
    flex-wrap: wrap;
}
.mb-5{
	margin: 10px;
}
</style>
<c:if test="${device eq 'MOBILE' }">
<style>
.section-container{
	margin: 0 auto;
}
</style>
</c:if>
</head>
<body>
	<div class="lavel">신상품</div>
	<div class="section-container">
		<div class="container-content">
			<c:forEach items="${newList}" var="vo">
			<div class="col mb-5">
		        <div class="card h-100">
		            <img class="card-img-top" style="height: 130px;" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img}'/>
		            <div class="card-body p-4">
		                <div class="text-center">
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
		                    	<span class="item-span">[글꼴]</span>
		                    </c:when>
		                    <c:when test="${vo.subcategory == 5}">
		                    	<span class="item-span">[가구]</span>
		                    </c:when>
		                    </c:choose>
		                    <h3 class="fw-bolder">${vo.name}</h3>
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
	<div class="section-container">
		<div class="container-content">
			<c:forEach items="${mostList}" var="vo">
			<div class="col mb-5">
		        <div class="card h-100">
		            <img class="card-img-top" style="height: 130px;" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img}'/>
		            <div class="card-body p-4">
		                <div class="text-center">
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
		                    	<span class="item-span">[글꼴]</span>
		                    </c:when>
		                    <c:when test="${vo.subcategory == 5}">
		                    	<span class="item-span">[가구]</span>
		                    </c:when>
		                    </c:choose>
		                    <h3 class="fw-bolder">${vo.name}</h3>
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
<c:if test="${device eq 'PC'}">	
<script>
	var length = $(".col").length / 2;
	if(length == 6){
		$(".col").css("width","16.6%");
	}
</script>
</c:if>	
</body>
</html>