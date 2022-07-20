<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>SweetPea</title>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		$(function(){
			$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
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
		section{
			border: 1px solid black;
			width: 49.2vw;
			height: 100%;
			float: right;
		}
		
		
		ul li {
			list-style-type:none;
			
		}
		.pea_package_box1, .pea_package_box2  {float:left; margin:0 auto; text-align:center; }
		.pea_package_box{
			position:relative;
			display:flex;
		}
		dt{float:left;}
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
	<div class="pea_package">
		<div class="pea_meaning">
			<dl>
				<dt>완두콩이란?</dt>
				<dd>아이템(미니룸, BGM) 결제를 위해 필요한 전용 결제수단입니다.</dd>
			</dl>
		</div>
		<div class="pea_package_box">
			<div class="pea_package_box1" >
				<ul >
					<li>쿠키 1개 <input type="button" value="100원"></li>
					<li>쿠키 10개 <input type="button" value="1,000원"></li>
					<li>쿠키 30개 <input type="button" value="3,000원"></li>
					<li>쿠키 50개 <input type="button" value="5,000원"></li>
					<li>쿠키 100개 <input type="button" value="10,000원"></li>
				</ul>
			</div>
			<div class="pea_package_box2" >	
				<ul >
					<li>쿠키 200개 <input type="button" value="20,000원"></li>
					<li>쿠키 300개 <input type="button" value="30,000원"></li>
					<li>쿠키 500개 <input type="button" value="50,000원"></li>
					<li>쿠키 700개 <input type="button" value="70,000원"></li>
					<li>쿠키 1,000개 <input type="button" value="100,000원"></li>
				</ul>
			</div>	
		</div>
	</div>
	
	<input type="button" id="naverPayBtn" value="네이버페이 결제 버튼">
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script>
    var oPay = Naver.Pay.create({
          "mode" : "production", // development or production
          "clientId": "u86j4ripEt8LRfPGzQ8" // clientId
    });

    //직접 만드신 네이버페이 결제버튼에 click Event를 할당하세요
    var elNaverPayBtn = document.getElementById("naverPayBtn");

    elNaverPayBtn.addEventListener("click", function() {
        oPay.open({
          "merchantUserKey": "가맹점 사용자 식별키",
          "merchantPayKey": "가맹점 주문 번호",
          "productName": "상품명을 입력하세요",
          "totalPayAmount": "1000",
          "taxScopeAmount": "1000",
          "taxExScopeAmount": "0",
          "returnUrl": "사용자 결제 완료 후 결제 결과를 받을 URL"
        });
    });

</script>
	
	
	
	
<!-- 	<div class="pea_package">
		<div class="pea_package2"></div>
		<div class="pea_package3">
			<div class="pea_menu">
				<ul>
					<li>
						<dl>
							<dt>완두콩 1개</dt>
							<dd>100원</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>완두콩 10개</dt>
							<dd>1,000원</dd>
						</dl>					
					</li>
					<li>
						<dl>
							<dt>완두콩 30개</dt>
							<dd>3,000원</dd>
						</dl>					
					</li>
					<li>
						<dl>
							<dt>완두콩 50개</dt>
							<dd>5,000원</dd>
						</dl>					
					</li>
					<li>
						<dl>
							<dt>완두콩 100개</dt>
							<dd>10,000원</dd>
						</dl>					
					</li>
				</ul>
				<ul>
					<li>
						<dl>
							<dt>완두콩 200개</dt>
							<dd>20,000원</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>완두콩 300개</dt>
							<dd>30,000원</dd>
						</dl>					
					</li>
					<li>
						<dl>
							<dt>완두콩 500개</dt>
							<dd>50,000원</dd>
						</dl>					
					</li>
					<li>
						<dl>
							<dt>완두콩 700개</dt>
							<dd>70,000원</dd>
						</dl>					
					</li>
					<li>
						<dl>
							<dt>완두콩 1,000개</dt>
							<dd>100,000원</dd>
						</dl>					
					</li>
				</ul>
			</div>
		</div>
	
	
	</div>  -->
	
	<br>
	<footer id="footer"></footer>
	

</body>
</html>
