<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <%-- <link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" /> --%>
<!-- 슬릭 슬라이더 -->   

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/plugin/slick/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/plugin/slick/slick/slick-theme.css"/>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/plugin/slick/slick/slick.js"></script>
     
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
.contBox{
	text-align: center;
}
.contBox>img{
    width: 110px;
    height: 110px;
    border-radius: 100%;
    margin: 10px auto;
    display: inline-block;
}
.cont{
    width: 90% !important;
    display: block !important;
    margin: 5px auto;
    box-shadow: 2px 2px 6px 1px #e3e3e3;
    transition: all 0.2s linear;
    overflow: hidden;
    background-color: white;
    position: relative;
}
.cont:hover{
  transform: scale(1.4);
  z-index: 111;
  box-shadow: 2px 2px 6px 1px #6c757d;
}

.slick-list{
	width: 1240px;
    margin: 0 auto;
    overflow: visible;
}
.slick-prev{
	left: 0 !important;
	z-index: 9999;
}
.slick-next {
    right: 0 !important;
}
</style>
<c:if test="${device eq 'MOBILE' }">
<style>
.section-container{
	margin: 0 auto;
}
.slick-list{
	width: 100vw;
}
</style>
</c:if>

<script>
/* 아이템 구매  */
async function myItemAdd(iidx,price,name,img){
	 var uidx = '${login.uidx}';
	 if(!uidx){
		 await Swal.fire({
			 title: '로그인 후 이용가능합니다',
			 icon: 'error',
			 footer: '<a href="<%=request.getContextPath()%>/user/login.do">로그인 하러가기</a>',
		 });
		 return;
	 }
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
	if(!uidx){
		 await Swal.fire({
			 title: '로그인 후 이용가능합니다',
			 icon: 'error',
			 footer: '<a href="<%=request.getContextPath()%>/user/login.do">로그인 하러가기</a>',
		 });
		 return;
	 }
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

<script>
$(function(){
if('${device}' == 'MOBILE'){
	var $value = true;
	var $show = 2
}else{
	var $value = false;
	var $show = 8
}
$('#slider-div').slick({
	slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
	slidesToShow : $show,		// 한 화면에 보여질 컨텐츠 개수
	slidesToScroll : 5,		//스크롤 한번에 움직일 컨텐츠 개수
	speed : 1000,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	autoplay: true,
	autoplaySpeed : 5000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
	vertical : false,		// 세로 방향 슬라이드 옵션
	prevArrow : "<button type='button' class='slick-prev'></button>",		// 이전 화살표 모양 설정
	nextArrow : "<button type='button' class='slick-next'></button>",		// 다음 화살표 모양 설정
	draggable : true, 
	swipeToSlide : $value
});
})
</script>
</head>
<body>
	<div class="lavel">친구 추천</div>
	  	<div id="slider-div" style="display:flex;" >
		<c:forEach items="${randomUser}" var="vo">
		<div class="cont">
			<div class="contBox">
				<img src='${vo.profile}'/>
				<div style="width:100%; position: relative;">
					<span style=" text-align: center; display: block; margin:5px">${vo.name}님</span>
					<div style="width: 90%; margin: 0 auto; margin-top: 10px;">
						<ul style="list-style: none; font-size: 0.8em; margin:0; padding: 0; text-align: center">
							<li>today <span style="color: red">${vo.today}</span></li>
							<li>total &nbsp; ${vo.visit}</li>
						</ul>
						<input type="button" style="width: 100%; height: 30px; margin: 5px 0;" onclick="openMini(${vo.uidx})" value="미니홈피 가기">
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	  	</div>
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