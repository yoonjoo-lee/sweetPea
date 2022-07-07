<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<script>
 /*
function idCheck(){
		alert("go"); 
		if($("#memberid").val()== ""){
			alert("아이디를 입력하지 않았습니다.");
		}else{
				$.ajax({
					url:"idcheck.do",
					type:"get",
					data:"memberid="+$("#id").val(),
					success:function(data){
						if($("#id").val()==data.id){
							
							alert("중복된 아이디 입니다.");
							 $("#disabled").addAttr("disabled"); 
						}else{
							alert("사용가능한  아이디 입니다.");
							$("#disabled").removeAttr("disabled");
						}	
				}
			})
		};
	}
*/
function join(){
	let fm = document.frm;
	if($("#id").val()== ""){
		$('#id').focus();
		$('#id').blur();
		$('#id').focus();
		return;
	} else if($('#pwd').val()==""){
		$('#pwd').focus();
		$('#pwd').blur();
		$('#pwd').focus();
		return;
	}else if($('#pwd2').val()== "" || $('#pwd').val()!=$('#pwd2').val() ){
		$('#pwd2').focus();
		$('#pwd2').blur();
		$('#pwd2').focus();
		return;
	}else if($('#name').val()==""){
		$('#name').focus();
		$('#name').blur();
		$('#name').focus();
		return;
		
	}else if($('#gender').val()==""){
		$('#gender').focus();
		$('#gender').blur();
		$('#gender').focus();
		return;
	}else if($('#birth').val()==""){
		$('#birth').focus();
		$('#birth').blur();
		$('#birth').focus();
		return;
	}else if($('#phone').val()==""){
		$('#phone').focus();
		$('#phone').blur();
		$('#phone').focus();
		return;
	}else if($('#email').val()==""){
		$('#email').focus();
		$('#email').blur();
		$('#email').focus();
		return;
	}else{
		fm.action = "<%=request.getContextPath()%>/user/join.do";
		fm.method = "post";
		fm.submit;
	}
}


</script>
</head>
<body>
<form name="frm">
	<input type="text" name="id" id="id" placeholder="아이디"><br>
	<span></span>
	
	<script>
	$('#id').blur(function(){
		if($('#id').val()==""){
			$('#id').next().next('span').text('아이디를 입력하세요');
			$('#id').next().next('span').css('color','red');
		}else{
			$.ajax({
				url:"idCheck.do",
				type:"get",
				data:"id="+$('#id').val(),
				success: function(data){
					if(data==1){
						$('#id').next().next("span").text('중복된 아이디입니다.');
						$('#id').next().next('span').css('color','red');
					}else{
						$('#id').next().next('span').text('사용가능한 아이디입니다.');
						$('#id').next().next('span').css('color','green');
					}
				}
			});
		}
	});
		
			
			
					
					
/* 					$('#id').blur(function(){
					let 
					if(value==0){
						$('#id').next("span").text('중복된 아이디입니다.');
						$('#id').next('span').css('color','red');
					}else if($('#id').val()==""){
						$('#id').next('span').text('아이디를 입력하세요');
						$('#id').next('span').css('color','red');
					}else if($('#id').val()!="") {
						$('#id').next('span').text('사용가능한 아이디입니다.');
						$('#id').next('span').css('color','green');
					}
				}) */
	</script>
	<!-- <input type="button" onclick="idCheck()" value="중복체크" > -->
	<br>
	<input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br>
	<span></span><br>
	<input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인"><br>
	<span></span><br>
		<script>
	$("#pwd").blur(function(){
		if($("#pwd").val() == ""){
			$("#pwd").next().next("span").text("비밀번호를 입력하세요");
			$("#pwd").next().next("span").css("color","red");
		}else if($("#pwd").val() != $("#pwd2").val()){
			$("#pwd").next().next("span").text("비밀번호 확인필요");
			$("#pwd").next().next("span").css("color","red");			
		}else{
			$("#pwd").next().next("span").text("비밀번호 일치");
			$("#pwd").next().next("span").css("color","green");
		}
	});
	$("#pwd2").blur(function(){
		if($("#pwd2").val() == ""){
			$("#pwd2").next().next("span").text("비밀번호 확인을 입력하세요");
			$("#pwd2").next().next("span").css("color","red");
		}else if($("#pwd").val() != $("#pwd2").val()){
			$("#pwd").next().next("span").text("비밀번호 확인필요");
			$("#pwd").next().next("span").css("color","red");
			$("#pwd2").next().next("span").text("");
		}else if($("#pwd").val() == $("#pwd2").val()){
			$("#pwd").next().next("span").text("비밀번호 일치");
			$("#pwd").next().next("span").css("color","green");
			$("#pwd2").next().next("span").text("");
		}	
	});
	</script>
	<input type="text" name="name" id="name" placeholder="이름">
	
	<select name="gender" id="gender">
		<option value="">성별</option>
		<option value="M">남자</option>
		<option value="W">여자</option>
	</select>
	<br>
	<span></span>
	<span></span>
		<script>
	$('#name').blur(function(){
		if($('#name').val()==""){
			$('#name').next().next().next('span').text("이름을 입력하세요.");
			$('#name').next().next().next('span').css('color','red');
		}else{
			$('#name').next().next().next('span').text("이름 입력 완료");
			$('#name').next().next().next('span').css('color','green')
		}
	})
	$('#gender').mousedown(function(){
		if($('#gender').val()==""){
			$('#gender').next().next().next('span').text("성별을 선택하세요.");
			$('#gender').next().next().next('span').css('color','red');
		}else{
			$('#gender').next().next().next('span').text("선택완료");
			$('#gender').next().next().next('span').css('color','green');
		}
	})
	</script>
<!-- 	<input type="radio" name="gender" id="gender" value="M" checked>남자
	<input type="radio" name="gender" id="gender" value="F">여자 -->
	<br>
	<input type="text" name="birth" id="birth" placeholder="생년월일 (-)제외" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"><br>
	<span></span><br>
	<script>
		$('#birth').blur(function(){
			if($('#birth').val()==""){
				$('#birth').next().next('span').text('생년월일을 입력하세요');
				$('#birth').next().next('span').css('color','red');
			}else{
				$('#birth').next().next('span').text('입력완료');
				$('#birth').next().next('span').css('color','green');
			}
		})
		
	</script>
	<input type="tel" name="phone" id="phone" placeholder="연락처 (-)제외" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"><br>
	<span></span><br>
	<script>
		$('#phone').blur(function(){
			if($('#phone').val()==""){
				$('#phone').next().next('span').text('연락처를 입력하세요');
				$('#phone').next().next('span').css('color','red');
			}else {
				$('#phone').next().next('span').text('입력완료');
				$('#phone').next().next('span').css('color','green');
			}
		})
	</script>
	<input type="text" name="email" id="email" placeholder="이메일">
	<input type="button" id="mailCheckBtn" value="인증번호 받기" ><br>
	<input class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled"><br>
	<span id="mail-check-warn"></span><br>
	<input type="" name="addr" placeholder="주소"><input type="button" value="검색"><br>
	<br>
	<input type="button" value="회원가입" onclick="join()" >
</form>







<script type="text/javascript">
$('')



$('#mailCheckBtn').click(function() {
	alert("되나?");
	const eamil = $('#email').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	var pjtPath = '<%= request.getContextPath()%>';
	
	$.ajax({
		type : 'get',
		url : pjtPath + '/user/mailCheck.do?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
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