<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SweetPea</title>
<link href="<%=request.getContextPath()%>/resources/css/findId.css" rel="stylesheet" />
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function(){
		$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
</head>
<body>
<header id="header"></header>
<br><br>
<div class="box">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<h3>본인확인 이메일로 인증​</h3>
	<h4>본인확인 이메일 주소와 입력한 이메일 주소가 같아야,​</h4>
	<h4>인증번호를 받을 수 있습니다.</h4>
	<input type="text" name="name" id="name" placeholder="이름"><br>
	<input type="text" name="email" id="email" placeholder="이메일">
	
	<button type="button" id="mailCheckBtn">인증번호 받기</button><br>
	<input class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled"><br>
	<span id="mail-check-warn"></span>
	<input type="button" id="idCheckBtn" value="아이디 찾기" disabled="disabled">
	
</div>
<script type="text/javascript">
$('#mailCheckBtn').click(function() {
	const name = $('#name').val(); // 이름
	const email = $('#email').val(); // 이메일 주소값 얻어오기!
	const checkInput = $('.mail-check-input'); // 인증번호 입력하는곳 
	var pjtPath = '<%= request.getContextPath()%>';
	
	$.ajax({
		type: 'get',
		url: pjtPath + '/user/idExistCheck.do?name='+name+'&email='+email,
		dataType: 'text',
		success: async function(data){
			if(data == ""){
				await Swal.fire({
				      title: '실패',
				      text: '이름과 이메일이 일치하는 아이디가 없습니다.',
				      icon: 'error',
			    });
				return;
			}else{
				id = data;
				Swal.fire({
				      text: '인증번호 전송중...',
				      didOpen: () => {
				    	    Swal.showLoading()
			    	  },
			    	  backdrop: false
			    });
				$.ajax({
					type : 'get',
					url : pjtPath + '/user/mailCheck.do?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
					success : async function (data) {
						checkInput.attr('disabled',false);
						$('#idCheckBtn').attr('disabled',false);
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
	}else{
		$resultMsg.html('');
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});

$("#idCheckBtn").click(function(){
	const inputCode = $(".mail-check-input").val();
	
	if(inputCode === code){
		$(".box").attr("style","display:none");
		$(".afterBox").attr("style","display:block");
		$(".getId").text(id);
	}else{
		alert("인증번호를 확인하세요");
		return;
	}
});

</script>
<div class="afterBox">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<h4>아이디 찾기</h4>
	<h3>스위피 아이디는 <span class="getId"></span>입니다.</h3>
	<a href="findPwd.do">패스워드 찾기</a> |
	<a href="login.do">로그인</a>
	<input type="button" id="homeBtn" value="홈" onclick="location.href='home.do'">
</div>
<br>
<footer id="footer"></footer>
</body>
</html>