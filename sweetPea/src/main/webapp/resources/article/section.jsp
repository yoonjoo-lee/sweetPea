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

<script>
/* 아이템 구매  */
function myItemAdd(iidx,price,name,img){
	 var uidx = '${login.uidx}';
	 if ('${login.pea_amount}'<price){
		 Swal.fire({
				text : '보유하신 완두콩 갯수가 부족합니다.',
				icon : 'info',
				footer: '<a href="<%=request.getContextPath()%>/user/charge.do">결제/충전 GO!</a>'
		 })
	 }else{
		 Swal.fire({
			   title: '정말로 구매하시겠습니까?',
			   html: '<b>['+name+']</b><span style="color:gray"><br><i style="color:green" class="bi-circle-fill"></i><span>&nbsp;</span>'+price+'</span>',
			   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			   imageUrl: '<%=request.getContextPath()%>/item/imageView.do?originFileName='+img,
			   
			}).then(result => {
			   // 만약 Promise리턴을 받으면,
			   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
				   $.ajax({
						url:"item/myItemAdd.do",
						type:"post",
					 	data:{"uidx":uidx,"iidx":iidx,"price":price},
						success:async function(data){
							if(data==0){
								Swal.fire({
									text: '내 아이템에 존재한 아이템입니다.',
									icon: 'warning',
									timer: 2000,
								    timerProgressBar: true,
								});
							}else{
								/* alert("장바구니에 추가되었습니다."); */
							 await Swal.fire({
									text : '내 아이템에 추가되었습니다.',
									icon : 'success',
									timer: 2000,
									timerProgressBar: true,
									}); 
								console.log(uidx);
								window.parent.location.reload();
							}
						},
						error:function(){
							alert('내 아이템에 추가되지 않았습니다.');
						}
					})
			   }
			});
	 }
} 

/* 장바구니 리스트 추가  */
async function itemShoppingAdd(iidx){
	var uidx = '${login.uidx}';
	$.ajax({
		url:"item/itemShoppingAdd.do",
		type:"get",
	 	data:{"uidx":uidx,"iidx":iidx},
		success:async function(data){
			if(data==0){
				Swal.fire({
					text: '내 아이템 또는 장바구니에 존재한 아이템입니다.',
					icon: 'warning',
					timer: 2000,
				    timerProgressBar: true,
				});
			}else{
			 await Swal.fire({
					title : '장바구니에 추가되었습니다.',
					text : '장바구니는 아이템상점에서 확인 가능합니다',
					icon : 'success',
					timer: 2000,
					timerProgressBar: true,
					}); 
				window.location.reload();
			}
		},
		error:function(){
			alert('장바구니에 추가되지 않았습니다.');
		}
	})
}
</script>
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
		                    	<span class="item-span">[동물]</span>
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
			                <img class = 'dealImg money' src="./resources/icon/money_icon.png" onclick="myItemAdd(${vo.iidx},${vo.price},'${vo.name}','${vo.img}')">
			                <img class = 'dealImg cart' src="./resources/icon/cart_icon.png" onclick="itemShoppingAdd(${vo.iidx})">
			                <!-- <img class = 'dealImg gift' src="./resources/icon/gift_icon.png" onclick='itemGift()'> -->
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
		                    	<span class="item-span">[동물]</span>
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
			                <img class = 'dealImg money' src="./resources/icon/money_icon.png" onclick="myItemAdd(${vo.iidx},${vo.price},'${vo.name}','${vo.img}')">
			                <img class = 'dealImg cart' src="./resources/icon/cart_icon.png" onclick="itemShoppingAdd(${vo.iidx})">
			                <!-- <img class = 'dealImg gift' src="./resources/icon/gift_icon.png" onclick='itemGift()'> -->
		                </div>
		            </div>
		        </div>
		    </div>
			</c:forEach>
		</div>
	</div>
</body>
</html>