<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap icons-->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>SHOPPING BASKET</title>
<style>
* {
	box-sizing: border-box;
}

h3, ul {
	text-align: center;
	margin-bottom: 0;
}

ul {
	list-style-type: none;
	padding: 0;
	width: 100%;
}

li {
	display: inline-block;
	font-size: 1.1em;
}

.header-ul {
	background-color: #52C3BD;
	color: white;
	padding: 0.2em 0;
}

.content-ul {
	background-color: #e5e5e5;
	padding: 0.5em 0;
	font-size: 0.8em;
	margin-top: 0.2em;
}

.header-ul>li:first-child, .content-ul>li:fist-child {
	width: 10%;
}
/* 구매버튼, 삭제버튼 오른쪽 정렬  */
.btnBox>input {
	float: right;
	margin-left: 0.5em;
}

/* 장바구니 리스트 순서   */
.header-ul>li:first-child, .content-ul>li:fist-child {
	width: 10%;
}

.header-ul>li:nth-child(2), .content-ul>li:nth-child(2) {
	width: 15%
}

.header-ul>li:nth-child(3), .content-ul>li:nth-child(3) {
	width: 45%;
	cursor: pointer;
}

.header-ul>li:last-child, .content-ul>li:last-child {
	width: 25%;
}

.btn btn-secondary {
	
}
</style>
<script>
$(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").is(":checked"))
			$(".checkBox").prop("checked",true);
		else{
			$(".checkBox").prop("checked",false);
		}
	});
})
/* 장바구니 목록삭제  */

	async function basketItemDel(){
		var valueArr = new Array();
		var list = $("input[name='rowCheck']");
		var ft = '<%=request.getContextPath()%>';
		
		var checkboxValues = [];
	    $("input[name='rowCheck']:checked").each(function(i) {
	        checkboxValues.push($(this).val());
	    });
		
		var allData = {"checkBox": checkboxValues}
			/* alert(checkboxValues); */
		if(checkboxValues.length == 0){
			Swal.fire({
			      title: '실패',
			      text: '삭제할 아이템이 없습니다',
			      icon: 'error',
		    });
			return;
		}else{
			await Swal.fire({
				  text: '선택한 아이템을 삭제하시겠습니까?',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '예',
				  cancelButtonText: '아니오'
				}).then((result) => {
				   if (result.isConfirmed) {
					   $.ajax({
						  url: ft + "/item/basketItemDel.do?uidx="+${login.uidx}+"",
						  type: "get",
						  data: allData,
						  success: async function(result){
							  await Swal.fire({
							      text: '삭제가 완료되었습니다',
							      icon: 'success',
						  		});
						    window.location.reload();
						  },
						  error: function (error){
						  	alert('다시 시도하세요');
						  }
						});
				  }
				  else{
					window.location.reload();  
				  }
				})
		}
	}
	
/* 장바구니 리스트 구매 버튼  */
function myItemAdd(${vo.iidx},${vo.price},'${vo.name}','${vo.img}'){
	var valueArr = new Array();
	var list = $("input[name='rowCheck']");
	var ft = '<%=request.getContextPath()%>';
	
	var checkboxValues = [];
    $("input[name='rowCheck']:checked").each(function(i) {
        checkboxValues.push($(this).val());
    });
	
	var allData = {"checkBox": checkboxValues}
		/* alert(checkboxValues); */
	if(checkboxValues.length == 0){
		Swal.fire({
		      title: '실패',
		      text: '구매 할 아이템이 없습니다',
		      icon: 'info',
	    });
		return;
	}else{
		await Swal.fire({
			  text: '선택한 아이템을 구매하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '예',
			  cancelButtonText: '아니오'
			}).then((result) => {
			   if (result.isConfirmed) {
				   $.ajax({
					  url: ft + "/item/basketListAdd.do?uidx="+${login.uidx}+"",
					  type: "get",
					  data: allData,
					  success: async function(result){
						  await Swal.fire({
						      text: '구매가 완료되었습니다',
						      icon: 'success',
					  		});
					    window.location.reload();
					  },
					  error: function (error){
					  	alert('다시 시도하세요');
					  }
					});
			  }
			  else{
				window.location.reload();  
			  }
			})
	}
}
	
	
	
	
}
/* 아이템 구매  */
function itemBuy(){
	 Swal.fire({
		icon:'info',
		title:'아이템 구매 기능  준비중...',
		toast:true,
		timer: 2000,
	    timerProgressBar: true,
	 })
} 
</script>
</head>
<body>
	<div>
		<div style="text-align:right;">
			<c:if test="${login.uidx >0 }">
				<input type="button" class="btn btn-secondary" onclick="myItemAdd(${vo.iidx},${vo.price},'${vo.name}','${vo.img}')" value="구매하기">
				<input type="button" class="btn btn-secondary" onclick="basketItemDel()" value="삭제">
			</c:if>
		</div>
		<ul class="header-ul">
			<li><input type="checkbox" id="allCheck"></li>
			<li>사진</li>
			<li>아이템명</li>
			<li>상품금액</li>

		</ul>
		<c:if test="${list.size() == 0 || login.uidx == null }">
			<ul class="content-ul">
				<li>등록된 아이템이 없습니다.</li>
			</ul>
		</c:if>
		<c:if test="${list.size() >0 }">
			<c:forEach var="vo" items="${list}">
				<ul class="content-ul">
					<li><input type="checkbox" name="rowCheck" value="${vo.uiidx}" class="checkBox"></li>
					<li><img src="<%=request.getContextPath()%>/item/imageView.do?originFileName=${vo.img}" style="width:100px;height:100px;"></li>
					<li>${vo.name}</li>
					<li>${vo.price} 개</li>
				</ul>
			</c:forEach>
		</c:if>

	</div>
	<script type="text/javascript">
/* 	 function myItemAdd(iidx){
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
	 } */
	 /* 아이템 구매  */
	 async function myItemAdd(iidx,price,name,img){
		 var uidx = '${login.uidx}';
		 if ('${login.pea_amount}'<price){
			 Swal.fire({
					text : '보유하신 완두콩 갯수가 부족합니다.',
					icon : 'info',
	/* 				timer: 2000,
					timerProgressBar: true, */
					
					footer: '<a href="#" onclick="charge()">결제/충전 GO!</a>'
			 		 
			 })
		 }else{
			 await Swal.fire({
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
							url:"myItemAdd.do",
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
									window.location.reload();
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
	</script>
</body>
</html>



















