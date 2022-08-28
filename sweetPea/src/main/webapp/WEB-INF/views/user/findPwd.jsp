<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>

<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet"/>
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<style>
#view{
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
}
	.box{
		width: 30%;
		margin: 0 auto;
	}
	.afterBox{
	display: none;
	width: 15%;
	margin: 0 auto;
	margin-bottom: 15em;
	}
	#img{
		width: 40%;
		height: 40%;
		margin: 0 auto;
		display: block;
	}
	h3{font-size: 1.5em;}
	h4{font-size: 1em; margin-bottom: 0;}
	input{
	width: 100%;
	height: 2.5em;
	margin: 0.8em 0 ;
}
#email{
	width: 65%;
}
#mailCheckBtn{
    height: 2.5em;
    margin: 1em 0;
    font-size: 0.8em;
    margin-left: 3%;
    border: 0;
    width: 30%;
}
	#mail-check-warn{
		font-size: 0.8em;
	}
	.getId{
		color: green;
		font-weight: bold;
	}
	.box>a{
		width: 25%;
		margin: 0 auto;
		font-size: 0.8em;
		text-decoration: none;
		color: inherit;
	}
	.afterBox input{
		width: 100%;
	}
	#idCheckBtn{
		display: block;
	}
	.box>span{
		font-size: 0.7em;
	}
</style>
<script>
	function changePwd(){
		if($('#pwd').val()=="" || ($('#pwd2').val() != "" && $("#span-pwd").css("color")=="rgb(255, 0, 0)")){
			$('#pwd').focus();
			$('#pwd').blur();
			$('#pwd').focus();
			return;
		}else if($('#pwd2').val()== "" || $('#pwd').val()!=$('#pwd2').val()){
			$('#pwd2').focus();
			$('#pwd2').blur();
			$('#pwd2').focus();
			return;
		}
		const pwd = $("#pwd").val();
		window.location.href="<%=request.getContextPath()%>/user/changePwd.do?uidx="+uidx+"&pwd="+pwd;
		
	}
</script>

<c:if test="${device eq 'MOBILE' }">
<style>
#view{
	width: 100% !important;
}
.box{
	width: 92% !important;
	margin: 0 auto;
}
.afterBox{
	width: 90%;
}
</style>

</c:if>

</head>
<body>
<header id="header"></header>
<br><br>
<div id="view">
<div class="box">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<h3>비밀번호 찾기</h3>
	<h4>비밀번호를 찾고자 하는 아이디를 입력해 주세요</h4>
	<input type="text" name="id" id="id" placeholder="아이디">
	<h4>회원정보에 등록한 이메일 인증</h4>
	<input type="text" name="email" id="email" placeholder="이메일">
	<button type="button" id="mailCheckBtn">인증번호 받기</button><br>
	<input class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled">
	<span id="mail-check-warn"></span><br>
	<input type="button" id="changeBtn" value="비밀번호 변경" disabled="disabled"><br>
	<a href="findId.do">ID 찾기</a>  
	<a href="login.do" style="margin-left: 1vw;">로그인</a>
</div>

<script type="text/javascript">
$('#mailCheckBtn').click(function() {
	const id = $("#id").val();
	const email = $('#email').val(); // 이메일 주소값 얻어오기!
	const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳 
	
	$.ajax({
		type: 'get',
		url: '<%= request.getContextPath()%>/user/pwdExistCheck.do?id='+id+'&email='+email,
		dataType: 'text',
		success: async function(data){
			if(data == 0){
				await Swal.fire({
				      title: '실패',
				      text: '아이디와 이메일이 일치하는 정보가 없습니다.',
				      icon: 'error'
			    });
				return;
			}else{
				uidx = data;
				Swal.fire({
				      text: '인증번호 전송중...',
				      didOpen: () => {
				    	    Swal.showLoading()
			    	  },
			    	  backdrop: false
			    });
				$.ajax({
					type : 'get',
					url : '<%=request.getContextPath()%>/user/mailCheck.do?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
					success : async function (data) {
						checkInput.attr('disabled',false);
						code =data;
						await Swal.fire({
						      text: '인증번호가 전송되었습니다.',
						      icon: 'success',
					    });
					}
				}); // end ajax	
			}
		}
	});	
}); // end send eamil
// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		$resultMsg.html('');
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#userEamil1').attr('readonly',true);
		$('#userEamil2').attr('readonly',true);
		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
        $('#changeBtn').attr('disabled',false);
	}else{
		$resultMsg.html('');
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});

$("#changeBtn").click(function(){
	const inputCode = $(".mail-check-input").val();
	
	if(inputCode === code){
		$(".box").attr("style","display:none");
		$(".afterBox").attr("style","display:block");
	}else{
		alert("인증번호를 확인하세요");
		return;
	}
});

</script>
<div class="afterBox">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<h4 style="text-align: center;">비밀번호 재설정</h4>
	<input type="password" id="pwd" placeholder="새 비밀번호">
	<span id="span-pwd"></span><br>
	<input type="password" id="pwd2" placeholder="새 비밀번호 확인">
	<span id="span-pwd2"></span><br>
	<input type="button" id="changeBtn" value="확인" onclick="changePwd()">
</div>
<script>
	$("#pwd").blur(function(){
		if($("#pwd").val() == ""){
			$("#span-pwd").text("비밀번호를 입력하세요");
			$("#span-pwd").css("color","red");
		}else if($("#pwd").val() != $("#pwd2").val()){
			$("#span-pwd").text("비밀번호 확인필요");
			$("#span-pwd").css("color","red");			
		}else{
			$("#span-pwd").text("비밀번호 일치");
			$("#span-pwd").css("color","green");
		}
	});
	$("#pwd2").blur(function(){
		if($("#pwd2").val() == ""){
			$("#span-pwd2").text("비밀번호 확인을 입력하세요");
			$("#span-pwd2").css("color","red");
		}else if($("#pwd").val() != $("#pwd2").val()){
			$("#span-pwd").text("비밀번호 확인필요");
			$("#span-pwd").css("color","red");
			$("#span-pwd2").text("");
		}else if($("#pwd").val() == $("#pwd2").val()){
			$("#span-pwd").text("비밀번호 일치");
			$("#span-pwd").css("color","green");
			$("#span-pwd2").text("");
		}	
	});
</script>
</div>
<br>
<footer id="footer"></footer>
</body>
</html>