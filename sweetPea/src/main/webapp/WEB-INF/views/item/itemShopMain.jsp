<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
</style>
</head>
<body>
	<br>
	<h4>item shop main</h4>
	<!-- 종류 체크 박스  -->
	<div class="search_option_wrap">

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
	<br>
	<!-- 아이템 리스트  -->
	<div class="item_page">
		<div class="category_list">
			<ul>
				<li class="first_select"><a onclick="">| 인기상품순</a></li>
				<li class="first_select"><a onclick="">| 신상품순</a></li>
				<li class="first_select"><a onclick="">| 낮은가격순</a></li>
				<li class="first_select"><a onclick="">| 높은가격순</a></li>
			</ul>
		</div>
	</div>
	<br>
	<div class="lavel">신상품</div>
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			
			<div id="itemList">
				
			
			</div>
			<script>
				$(function(){
				$.ajax({
					url:"itemSelectAll.do",
					type:"get",
					success:function(data){
					/* 	alert(data[i].name); */
						var html="";
						for(var i=0; i<data.length;i++){
							console.log(data[i].img);
						html +="<div class='col mb-5'>";
						html +="<div class='card h-100'>";
						html +="<img class='card-img-top' src='<spring:url value = '/images/itemImg/"+data[i].img+"'/>'>";
						html +="<div class='card-body p-4'>";
						html +="<div class='text-center'>";
							html +="<h5 class='fw-bolder'>"+data[i].name+"</h5>";
							html +="<div class='d-flex justify-content-center small text-warning mb-2'>";
							html +="<div class='bi-star-fill'></div>";
							html +="<div class='bi-star-fill'></div>";
							html +="<div class='bi-star-fill'></div>";
							html +="<div class='bi-star-fill'></div>";
							html +="<div class='bi-star-fill'></div>";
							html +="</div>";
							html +=data[i].price+" 개";
						html +="</div>";
						html +="</div>";
						html +="<div class='card-footer p-4 pt-0 border-top-0 bg-transparent'>";
						html +="<div class='text-center'>";
						html +="<a class='btn btn-outline-dark mt-auto' href='#'>Add to cart</a>";
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
			
			
	<!-- 페이지 넘버. -->
</body>
</html>

















