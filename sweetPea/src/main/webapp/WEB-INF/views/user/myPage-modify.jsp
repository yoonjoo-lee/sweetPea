<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<style>
	#img{
		width: 30%;
		height: 30%;
		margin: 0 auto;
		display: block;
	}
	h4,h5{
		text-align: center;
	}
	.inputBox{
		width: 85%;
		margin: 0 auto;
	}
	.inputIdx,.inputBox>input{
		font-size: 1em;
		width: 100%;
		height: 2em;
		margin: 1em 0;
		display: block;
	}
	.inputIdx>p,.inputBox>p{
		display: inline-block;
		margin: 0.3em 0.8em;
		width: 14%;
		text-align: right;
	}
	.inputIdx>input[type=text],.inputIdx>select{
		border: 1px soild black;
		padding: 0;
		height: 85%;
		width: 60%;
		font-size: 1em;
		text-indent: 0.2em;
	}
	.afterCheckBox{
		display: none;
	}
	.inputBox>span{
		font-size: 0.8em;
		display: inline-block;
		margin: 0.2em 0.2em;
	}
	#btn{
		width: 61%;
		height: 2em;
		display: block;
		margin: 0 auto;
	}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
.inputBox{
	width: 100%;
    font-size: 3.5vw;
}
.inputIdx{
    height: 6vh;
}
.inputIdx>p{
	width: 18%;
    text-align: right;
    margin: 1vh 1vw;
}
.inputIdx>input[type=text], .inputIdx>select {
	width: 76%;
}
#email,#addr{
	width: 50%;
}
#mailCheckBtn,#addrBtn{
	height: 6vh !important;
    font-size: 3vw;
    border: 0;
    width: 23vw !important;
}
#btn{
	width: 95%;
    height: 6vh;
}
</style>
</c:if>

<script>
var uidx = ${login.uidx};
	$(async function(){
		let {value:password} = await Swal.fire({
			title: '비밀번호 확인',
			  input: 'password',
			  inputLabel: '회원정보 수정을 위한 비밀번호를 입력해주세요',
			  inputPlaceholder: '비밀번호',
			  inputAttributes: {
			    maxlength: 20,
			    autocapitalize: 'off',
			    autocorrect: 'off'
			  },
			  position: 'top'
		});
		let pwd = password;
		
		console.log("비밀번호 찾기 uidx", uidx);
		$.ajax({
			type : 'get',
			url : '<%=request.getContextPath()%>/user/pwdCheck.do?uidx='+uidx+'&pwd='+pwd,
			success : async function (data) {
				if(data==0){
					await Swal.fire({
						  icon: 'error',
						  title: '실패',
						  text: '비밀번호가 일치하지 않습니다',
						  position: 'top'
						});
					window.location.reload();
				}else{
					$(".afterCheckBox").attr("style","display:block");
				}
			}
		});
	});
</script>
<script>
		function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("addr").value = addr;
	            }
	        }).open();
	    }
</script>
</head>
<body>
	<c:if test="${mini==0 && device eq 'PC'}"><br><br></c:if>
	<div class="afterCheckBox">
		<c:if test="${mini==0 }"><img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img"></c:if>
		<h4>회원 정보 수정</h4>
		<h5>이메일 인증번호 받기 필수</h5>
		<form id="frm">
		<div class="inputBox">
			<div class = "inputIdx">
				<p>이름 :</p>
				<input type="text" id="name" name="name" value="${vo.name}">
			</div>
			<div class = "inputIdx">
				<p>성별 :</p>
				<select name="gender" id="gender">
					<option value="">성별</option>
					<option value="M">남자</option>
					<option value="W">여자</option>
				</select>
			</div>
			<c:if test="${vo.gender.equals('M')}">
				<script>$("#gender").val("M").prop("selected",true)</script>
			</c:if>
			<c:if test="${vo.gender.equals('W')}">
				<script>$("#gender").val("W").prop("selected",true)</script>
			</c:if>
			<div class = "inputIdx">
				<p>생년월일 :</p>
				<input type="text" id="birth" name="birth" value="${vo.birth}">
			</div>
			<div class = "inputIdx">
				<p>Phone :</p>
				<input type="text" id="phone" name="phone" value="${vo.phone}">
			</div>
			<div class = "inputIdx">
				<p>이메일 :</p>
				<input type="text" id="email" name="email" value="${vo.email}">
				<input type="button" style="height: 2.2em" id="mailCheckBtn" onclick="mailCheck()" value="인증번호 받기"><br>
			</div>
			<div class = "inputIdx" style="margin-bottom: 0;">
				<p></p>
				<input type="text" class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled">
			</div>
			<p></p><span id="span-email"></span>
			<div class = "inputIdx">
				<p>주소 :</p>
				<input type="text" name="addr" id="addr" value="${vo.addr}">
				<input type="button" id="addrBtn" style="height: 2.2em" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			</div>
				<input type="button" onclick="change()" id="btn" value="변경" disabled="disabled">
		</div>
			
		</form>
	</div>
	
</body>
<script type="text/javascript">
function mailCheck() {
	const email = $('#email').val(); // 이메일 주소값 얻어오기!
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	var pjtPath = '<%= request.getContextPath()%>';
	$.ajax({
		type: 'get',
		url: pjtPath + '/user/userEmailCheck.do?email='+email+'&uidx='+${login.uidx},
		success: async function(data){
			if(data == 1){
				await Swal.fire({
				      text: '이미 인증한 이메일입니다.',
				      icon: 'error',
			    });
				$("#span-email").text('동일한 이메일입니다');
				$("#span-email").css('color','green');
			}else{
				noCheck = data;
				checkInput.attr('disabled',false);
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
						await Swal.fire({
						      text: '인증번호가 전송되었습니다.',
						      icon: 'success',
					    });
					}			
				});
			}
		}
	})
	$("#btn").attr("disabled",false);
} // end send eamil
// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#span-email');
	
	if(inputCode === code){
		$resultMsg.text('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#userEamil1').attr('readonly',true);
		$('#userEamil2').attr('readonly',true);
		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	}else{
		$resultMsg.text('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});

async function change(){
	if($("#span-email").css("color")=="rgb(255, 0, 0)"){
		$('.mail-check-input').focus();
		$('.mail-check-input').blur();
		$('.mail-check-input').focus();
		return;
	}
	else{
		if(noCheck==1 && email != $("#email").val()){
		await Swal.fire({
		      text: '이메일이 변경되었습니다. 인증을 진행해 주세요',
		      icon: 'error',
	    });
		return;
	}
	Swal.fire({
		  title: '변경사항을 저장하시겠습니까?',
		  showCancelButton: true,
		  confirmButtonText: '저장',
		  cancelButtonText: '취소',
		}).then((result) => {
		  /* Read more about isConfirmed, isDenied below */
		  if (result.isConfirmed) {
		    $("#frm").attr("action","<%=request.getContextPath()%>/user/myPage-modify.do?uidx="+${login.uidx});
			$("#frm").attr("method","post");
			$("#frm").submit();
		  }
		})
	}
}
</script>
<script>
	$("#name").blur(function(){
		if($("#name").val() == ""){
			$("#name").val('${vo.name}');
		}
	});
	$("#gender").blur(function(){
		if($("#gender").val() == ""){
			$("#gender").val('${vo.gender}');
		}
	});
	$("#birth").blur(function(){
		if($("#birth").val() == ""){
			$("#birth").val('${vo.birth}');
		}
	});
	$("#phone").blur(function(){
		if($("#phone").val() == ""){
			$("#phone").val('${vo.phone}');
		}
	});
	$("#email").blur(function(){
		if($("#email").val() == ""){
			$("#email").val('${vo.email}');
		}
	});
	$("#addr").blur(function(){
		if($("#addr").val() == ""){
			$("#addr").val('${vo.addr}');
		}
	});
	
	/* 미니홈피에서 접근할 경우 글꼴 적용 */
	 if (${mini}==1){
		 $("body").css("font-family",'${myMini.font}');
	 }
</script>
</html>