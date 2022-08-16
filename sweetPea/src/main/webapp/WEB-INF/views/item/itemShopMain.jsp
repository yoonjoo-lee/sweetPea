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
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
#img {
	width: 30%;
	height: 30%;
	margin: 0 auto;
	display: block;
}

h4 {
	text-align: center;
}

.inputBox {
	width: 60%;
	margin: 0 auto;
}

.inputIdx {
	font-size: 1em;
	width: 100%;
	height: 2em;
	border: 1px solid black;
	margin: 1em 0;
}

.inputIdx>p {
	display: inline-block;
	margin: 0.3em 0.8em;
}

.aBox {
	float: right;
}

.aBox>a {
	color: inherit;
	text-decoration: none;
}

/* 카테고리 셀렉트 부분 스타일  */
body {
	text-align: left;
}

div {
	display: block;
}

.search_option_wrap {
	position: relative;
	min-height: 127px;
	margin-top: 12px;
	border: 1px solid #b3b3b3;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.search_category_item {
	float: left;
	width: 128px;
	margin-top: 5px;
}

li {
	display: list-item;
	list-style: none;
	text-align: left;
}

.search_category_title {
	float: left;
	width: 112px;
	height: 27px;
	line-height: 27px;
	font-weight: bold;
}

.search_option_item {
	position: relative;
	padding: 0 17px;
	display: block;
}

.search_option_list {
	border: 1px solid #b3b3b3;
	box-sizing: border-box;
}

.search_cate_item {
	float: left;
	width: 128px;
	margin-top: 0px;
}

ul {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

/* 아이템 페이지 */
.item_page {
	border: 1px solid #b3b3b3;
	box-sizing: border-box;
}

.category_list ul li.select {
	width: 113px;
	height: 40px;
	border: 1px solid #bfbfbf;
	border-bottom-color: #33383e;
	margin-left: -1px;
	margin-bottom: -1px;
	display: block;
	list-style-type: disc;
}

.category_list {
	position: relative;
	border-bottom: 1px solid #33383e;
}

.first_select {
	display: inline;
}

/* 아이템 상품들  */
.lavel {
	width: 100%;
	height: 1.5rem;
	text-align: center;
	font-size: 0.95rem;
	background-color: #81c769;
	color: red;
}

/* 아이템상품 이미지 크기  */
.row-cols-2>* {
	flex: 0 0 auto;
	width: 15%;
}

/* 버튼 css */
@import url(https://fonts.googleapis.com/css?family=Roboto:700);

.button {
	background: #3D4C53;
	margin: 20px auto;
	width: 200px;
	height: 50px;
	overflow: hidden;
	text-align: center;
	transition: .2s;
	cursor: pointer;
	border-radius: 3px;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, .2);
}

.btnTwo {
	position: relative;
	width: 200px;
	height: 100px;
	margin-top: -100px;
	padding-top: 2px;
	background: #26A69A;
	left: -250px;
	transition: .3s;
}

.btnText {
	color: white;
	transition: .3s;
	margin-top: 1.5vh;
}

.btnText2 {
	margin-top: 63px;
	margin-right: -130px;
	color: #FFF;
}

.button:hover .btnTwo { /*When hovering over .button change .btnTwo*/
	left: -130px;
}

.button:hover .btnText { /*When hovering over .button change .btnText*/
	margin-left: 65px;
}

.button:active { /*Clicked and held*/
	box-shadow: 0px 5px 6px rgba(0, 0, 0, 0.3);
}

.exampleModalCenter {
	width: 100vw;
}

.col mb-5 {
	width: 200px;
	height: 150px;
}
/* 모달 사이즈  */
</style>
<script type="text/javascript">
/* 장바구니 팝업 */
<c:if test="${login != null}">
function openShoppingBasket(){
	var popupX = (document.body.offsetWidth / 2) - (700 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - 350;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	var uidx = ${login.uidx};
	window.open('<%=request.getContextPath()%>/item/shoppingList.do?uidx='+uidx,'name',
			'resizable=no width=750 height=400,left='+popupX+',top='+popupY);
}
</c:if>

</script>
</head>
<body>
	<br>
	<h4>item shop main</h4>
	<!-- 종류 체크 박스  -->
	<!-- 	<div class="search_option_wrap">

		<br>
		<div class="search_option_item">
			<div class="search_category_title">테마별</div>
			<div class="search_category_contents">
				<ul>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="theme" value="봄"><span class="item_text">봄</span>
					</label></li>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="theme" value="여름"><span class="item_text">여름</span>
					</label></li>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="theme" value="가을"><span class="item_text">가을</span>
					</label></li>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="theme" value="겨울"><span class="item_text">겨울</span>
					</label></li>
				</ul>
			</div>
		</div>
		<br>
		<div class="search_option_item">
			<div class="search_category_title">가격별</div>
			<div class="search_category_contents">
				<ul>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="pea_price" value="10개"><span class="item_text">10개</span>
					</label></li>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="pea_price" value="20개"><span class="item_text">20개</span>
					</label></li>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="pea_price" value="30개"><span class="item_text">30개</span>
					</label></li>
					<li class="search_cate_item"><label class="item_checkbox"> <input type="checkbox" name="pea_price" value="40개"><span class="item_text">40개</span>
					</label></li>
				</ul>
			</div>
		</div>
		<br>

	</div>
	<br> -->
	<!-- 아이템 리스트  -->
	<div style="float: left; width: 15%; margin-left: 5px;" class="button" onclick="itemSelectAll(2)">
		<p class="btnText">인기상품순</p>
		<div class="btnTwo">
			<p class="btnText2">GO?</p>
		</div>
	</div>

	<div style="float: left; width: 15%; margin-left: 5px;" class="button" onclick="itemSelectAll(3)">
		<p class="btnText">가격내림순</p>
		<div class="btnTwo">
			<p class="btnText2">GO?</p>
		</div>
	</div>
	<div style="float: left; width: 15%; margin-left: 5px;" class="button" onclick="itemSelectAll(4)">
		<p class="btnText">가격오름순</p>
		<div class="btnTwo">
			<p class="btnText2">GO?</p>
		</div>
	</div>
	<div style="float: left; width: 15%; margin-left: 5px;" class="button" onclick="itemSelectAll(5)">
		<p class="btnText">신상품순</p>
		<div class="btnTwo">
			<p class="btnText2">GO?</p>
		</div>
	</div>
	<div style="float: right; width: 15%; margin-left: 5px;" class="button" onclick="">
		<p class="btnText" data-toggle="modal" data-target=".bd-example-modal-lg">장바구니</p>
		<div class="btnTwo">
			<p class="btnText2" data-toggle="modal" data-target=".bd-example-modal-lg">GO!</p>
		</div>
	</div>
	<br>
	<!-- 아이템 리스트 뿌려주는 div -->
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="itemList" style="width: 100%"></div>
	</div>
	<br>

	<!-- 모달 창  -->
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">SHOPPING-BASKET</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">X</button>
				</div>
				<div class="modal-body">
					<div class="btnBox" style="height: 750px;">
						<!--  -->
						<c:if test="${login.uidx==null }">
							<iframe src="<%=request.getContextPath()%>/item/shopping-basket.do?uidx=0" style="width: 100%; height: 92%;"></iframe>
						</c:if>
						<c:if test="${login.uidx >0 }">
							<iframe src="<%=request.getContextPath()%>/item/shopping-basket.do?uidx=${login.uidx}" style="width: 100%; height: 92%;"></iframe>
						</c:if>

						<div class="modal-footer">

							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  -->
	<span id="tmp"></span>
	<script>

/* 아이템페이지 첫 로드 할 때  리스트 나열 구문 */	
 $(function itemSelectAll(){
	$.ajax({
	url:"itemSelectAll.do",
	type:"get",
	data:"cate="+1,
	success:function(data){
		var html="";
		for(var i=0; i<data.length;i++){
			html +="<div class='col mb-5' style='float:left; width:230px;'>";
			html +="<div class='card h-100' style='width:200px;height:300px;'>";
			html +="<img class='card-img-top' src='<%=request.getContextPath()%>/item/imageView.do?originFileName="+data[i].img+"'/>";
			html +="<div class='card-body p-4'>";
			html +="<div class='text-center'>";
			html +="<h5 class='fw-bolder'>"+data[i].name+"</h5>";
			html +="<i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>"+data[i].price;
			html +="</div>";
			html +="</div>";
			html +="<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
			html +="<div class='text-center'>";
			html +="<a class='btn btn-outline-dark mt-auto' onclick='myItemAdd("+data[i].iidx+")'>buy</a><span>&nbsp;</span>";
			html +="<a class='btn btn-outline-dark mt-auto' onclick='itemShoppingAdd("+data[i].iidx+")'>add to cart</a>";
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
 
/* 아이템 리스트 카테고리별 나열 */	
function itemSelectAll(cate){
	$.ajax({
	url:"itemSelectAll.do",
	type:"get",
	data:"cate="+cate,
	success:function(data){
		/* 	alert(data[i].name); */
		var html="";
		for(var i=0; i<data.length;i++){
			html +="<div class='col mb-5' style='float:left; width:230px;'>";
			html +="<div class='card h-100' style='width:200px;height:300px;'>";
			html +="<img class='card-img-top' src='<%=request.getContextPath()%>/item/imageView.do?originFileName="+data[i].img+"'/>";
			html +="<div class='card-body p-4'>";
			html +="<div class='text-center'>";
			html +="<h5 class='fw-bolder'>"+data[i].name+"</h5>";
			html +="<i style='color:green' class='bi-circle-fill'></i><span>&nbsp;</span>"+data[i].price;
			html +="</div>";
			html +="</div>";
			html +="<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
			html +="<div class='text-center'>";
			html +="<a class='btn btn-outline-dark mt-auto' onclick='myItemAdd("+data[i].iidx+")'>buy</a><span>&nbsp;</span>";
			html +="<a class='btn btn-outline-dark mt-auto' onclick='itemShoppingAdd("+data[i].iidx+")'>add to cart</a>";
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
					
}

/*  */
function addCart(uiidx){
	alert(uiidx);
}
 /* 아이템 구매  */
 function myItemAdd(iidx){
	 var uidx = '${login.uidx}';
		$.ajax({
			url:"myItemAdd.do",
			type:"post",
		 	data:{"uidx":uidx,"iidx":iidx},
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
					window.location.reload();
				}
			},
			error:function(){
				alert('내 아이템에 추가되지 않았습니다.');
			}
		})
/* 	 Swal.fire({
		icon:'info',
		title:'아이템 구매 기능  준비중...',
		toast:true,
		timer: 2000,
	    timerProgressBar: true,
	 }) */
 } 
 /* 장바구니 리스트 추가  */
 function itemShoppingAdd(iidx){
	 console.log('itemShoppgAdd');
	 var uidx = '${login.uidx}';
	$.ajax({
		url:"itemShoppingAdd.do",
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
				/* alert("장바구니에 추가되었습니다."); */
			 await Swal.fire({
					text : '장바구니에 추가되었습니다.',
					icon : 'success',
					timer: 2000,
					timerProgressBar: true,
					}); 
				console.log(uidx);
				window.location.reload();
			}
		},
		error:function(){
			alert('장바구니에 추가되지 않았습니다.');
		}
	})
}
	/* tagify value key 값 가져오는 구문 */
	      var test = [{'value':"banana"},{'value':"yellow"}];
   
   for (var i=0; i<test.length; i++){
      console.log(test[i]['value']);
   }

/* 모달 */
</script>


	<!-- 페이지 넘버. -->

</body>
</html>





