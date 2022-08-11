<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>

<html>
<head>
<!-- <script language="javascript" type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>  -->
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
	width: 60vw;
	margin: 0 auto;
	margin-bottom: 15em;
	height: 100%;
}
input, button{
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
h4{
	text-indent: 5vw;
}
b{
	color: #7dc75e;
}
.pea_package_box>p{
	font-size: 1vw;
    font-weight: bold;
    text-indent: 2vw;
    background-color: #e5e3e3;
}
ul li {
	list-style-type: none;
}
.pea_package_list_box{
	float: left;
	margin: 0 2%;
	width: 46%;
}
.buyBtn{
	float: right;
	font-size: 1vw;
}

.buyText{
	font-size: 1vw;
}
</style>
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
			<p>충전하기</p>
			<div class="pea_package_list_box">
				<ul>
					<li><span class="buyText">완두콩 1개</span><input type="button" class="buyBtn" onclick="payment(100)" value="100원"></li>
					<li>완두콩 10개 <input type="button" class="buyBtn" onclick="payment(1000)" value="1,000원"></li>
					<li>완두콩 30개 <input type="button" class="buyBtn" onclick="payment(3000)" value="3,000원"></li>
					<li>완두콩 50개 <input type="button" class="buyBtn" onclick="payment(5000)" value="5,000원"></li>
					<li>완두콩 100개 <input type="button" class="buyBtn" onclick="payment(10000)" value="10,000원"></li>
				</ul>
			</div>
			<div class="pea_package_list_box">
				<ul>
					<li>완두콩 200개 <input type="button" class="buyBtn" onclick="payment(20000)" value="20,000원"></li>
					<li>완두콩 300개 <input type="button" class="buyBtn" onclick="payment(30000)" value="30,000원"></li>
					<li>완두콩 500개 <input type="button" class="buyBtn" onclick="payment(50000)" value="50,000원"></li>
					<li>완두콩 700개 <input type="button" class="buyBtn" onclick="payment(70000)" value="70,000원"></li>
					<li>완두콩 1,000개 <input type="button" class="buyBtn" onclick="payment(100000)" value="100,000원"></li>
				</ul>
			</div>
		</div>
	</div>
	</div>
	

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

	<br>
	<footer id="footer"></footer>


</body>
</html>
