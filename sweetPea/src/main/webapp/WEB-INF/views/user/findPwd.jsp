<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
	});
</script>
<style>
	.box{
		width: 40%;
		margin: 0 auto;
	}
	.findPwd-box input{
	}
</style>
</head>
<body>
<header id="header"></header>
<br>
<div class="box">
	<div class="findPwd-box">
	<h3>비밀번호 찾기</h3><br>
	<h4>비밀번호를 찾고자 하는 아이디를 입력해 주세요</h4>
	<input type="text" name="id" placeholder="아이디"><br>
	<h4>회원정보에 등록한 이메일 인증</h4>
	<input type="text" name="email" id="email" placeholder="이메일">
	<button type="button" id="mailCheckBtn">인증번호 받기</button><br>
	<input class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled">
	<span id="mail-check-warn"></span>
	</div>
</div>

<script type="text/javascript">
$('#mailCheckBtn').click(function() {
	const eamil = $('#email').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	var pjtPath = '<%= request.getContextPath()%>';
	
	$.ajax({
		type : 'get',
		url : pjtPath + '/user/mailCheck.do?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			/* console.log("data : " +  data); */
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send eamil
// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#userEamil1').attr('readonly',true);
		$('#userEamil2').attr('readonly',true);
		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});
</script>
</body>
</html>