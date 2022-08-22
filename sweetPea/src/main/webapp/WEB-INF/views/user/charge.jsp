<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<html>
<head>
<script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script> 
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<title>SweetPea</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
			$("#nav").load("<%=request.getContextPath()%>/resources/article/nav.jsp");
			$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
		});
	</script>
	
<style type="text/css">
#view {
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
}
/* input, button{
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
} */
h4{
	text-indent: 5em;
}
b{
	color: #7dc75e;
}
.back-gray{
	font-size: 1.2em;
    font-weight: bold;
    text-indent: 2em;
    background-color: #e5e3e3;
    padding: 0.1em 0;
}
.back-gray>p:not(:first-child){
	font-weight: normal;
	font-size: 0.8em;
}
ul{
	list-style-type: none;
	padding:0;
}
.pea_package_list_box{
	float: left;
	margin: 0 2%;
	width: 46%;
}
.pea_package_box{
	height: 25em;
}
.buyBtn{
	float: right;
    font-size: 1em;
    height: 100%;
    border: 0;
    width: 6em;
    background-color: #7dc75e;
    color: white;
    transition: 0.5s;
    line-height: 2em;
}
.buyBtn:hover{
	background-color: #519933;
}
.buyText{
    line-height: 2em;
    margin-left: 1em;
}
.pea_package_ul>li{
	margin: 1.5em 0;
    border-bottom: 1px solid #7dc75e;
    height: 2em;
}
</style>

<c:if test="${device eq 'MOBILE' }">
<style>
#view{
	width: 100%;
}

.pea_package_list_box{
	float: left;
	margin: 0 2%;
	width: 96%;
}

.pea_package_box{
	height: 80vh;
}

h4{
	text-indent: 5vw;
}

.back-gray {
    font-size: 3.5vw;
    font-weight: bold;
    text-indent: 2vw;
}

</style>
</c:if>
<script type="text/javascript">
	function payment(price){
		$.ajax({
			url: "payment.do?price="+price,
			success: function(data){
				$("#saleView").html(data);
			}
		})
	}
</script>
</head>
<body>
<c:if test="${login == null}">
	<script>
	$(async function(){
		await Swal.fire({
			  icon: 'error',
			  title: '로그인 필요',
			  text: '로그인 후 이용 가능합니다.',
			  position: 'top'
			});
		window.location.href="home.do";
	})
</script>
</c:if>
<header id="header"></header>
<br>
<div id="view">
	<nav id="nav"></nav>
	<br>
	<div class="pea_package">
		<h2>🟢  완두콩이란?</h2>
		<h4>아이템(미니룸,BGM 등) 결제를 위해 필요한 <b>스위피</b>만의 전용 결제수단입니다.</h4>
		<div class="pea_package_box">
			<p class="back-gray">충전하기</p>
			<div class="pea_package_list_box">
				<ul class="pea_package_ul">
					<li><span class="buyText">완두콩 1개</span><input type="button" class="buyBtn" onclick="payment(100)" value="₩100"></li>
					<li><span class="buyText">완두콩 10개</span><input type="button" class="buyBtn" onclick="payment(1000)" value="₩1,000"></li>
					<li><span class="buyText">완두콩 30개</span><input type="button" class="buyBtn" onclick="payment(3000)" value="₩3,000"></li>
					<li><span class="buyText">완두콩 50개</span><input type="button" class="buyBtn" onclick="payment(5000)" value="₩5,000"></li>
					<li><span class="buyText">완두콩 100개</span><input type="button" class="buyBtn" onclick="payment(10000)" value="₩10,000"></li>
				</ul>
			</div>
			<div class="pea_package_list_box">
				<ul class="pea_package_ul">
					<li><span class="buyText">완두콩 200개</span><input type="button" class="buyBtn" onclick="payment(20000)" value="₩20,000"></li>
					<li><span class="buyText">완두콩 300개</span><input type="button" class="buyBtn" onclick="payment(30000)" value="₩30,000"></li>
					<li><span class="buyText">완두콩 500개</span><input type="button" class="buyBtn" onclick="payment(50000)" value="₩50,000"></li>
					<li><span class="buyText">완두콩 700개</span><input type="button" class="buyBtn" onclick="payment(70000)" value="₩70,000"></li>
					<li><span class="buyText">완두콩 1000개</span><input type="button" class="buyBtn" onclick="payment(100000)" value="₩100,000"></li>
				</ul>
			</div>
		</div>
		<div class="back-gray">
			<p>완두콩 이용 안내</p>
			<p>- 완두콩 구매에 대해서는 부가가치세가 부과되지 않습니다.​</p>
			<p>- 완두콩 구매 시 추가 지급되는 무료 완두콩 수량은 변경될 수 있습니다.</p>
			<p>- 결제 상세 내역은 마이페이지>보유아이템 및 결제내역 메뉴에서 확인 가능합니다. ​</p>
			<p>- 충전한 완두콩을 사용하여 아이템상점/선물하기에서 아이템을 구매하실 수 있습니다.​</p>
			<p>- 완두콩은 무료완두콩부터 유효기간이 임박한 순으로 먼저 사용됩니다.</p>
		</div>
		
	</div>
	<br>
	
	<div id="saleView"></div>
</div>
<br>
<footer id="footer"></footer>
</body>
</html>
