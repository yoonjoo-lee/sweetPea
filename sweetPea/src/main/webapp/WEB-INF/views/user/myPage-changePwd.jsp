<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<style>
	#img{
		width: 60%;
		height: 30%;
		margin: 0 auto;
		display: block;
	}
	h4,h5{
		text-align: center;
	}
	.afterCheckBox{
		width: 40%;
		margin: 0 auto;
	}
	.inputBox>input{
		display: block;
		width: 80%;
		height: 2em;
		margin: 0.8em auto;
		text-indent: 0.5em;
	}
	input[type=button]{
		width: 83%;
		height: 2.5em;
		margin: 0.8em auto;
	}
	.afterCheckBox{
		display: none;
	}
	.inputBox>span{
		font-size: 0.7em;
		display: block;
		width: 80%;
		margin: 0 auto;
	}
</style>
<script>
$(async function(){
	let {value:password} = await Swal.fire({
		title: '비밀번호 확인',
		  input: 'password',
		  inputLabel: '비밀번호 변경을 위해 현재 비밀번호를 입력해주세요',
		  inputPlaceholder: '비밀번호',
		  inputAttributes: {
		    maxlength: 20,
		    autocapitalize: 'off',
		    autocorrect: 'off'
		  },
		  position: 'top'
	});
	let pwd = password;
	$.ajax({
		type : 'get',
		url : "<%=request.getContextPath()%>/user/pwdCheck.do?uidx="+${login.uidx}+"&pwd="+pwd,
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
	
	window.parent.location.href="<%=request.getContextPath()%>/user/changePwd.do?uidx="+${login.uidx}+"&pwd="+pwd;
	
	
}
</script>

<c:if test="${device eq 'MOBILE'}">
<style>
.afterCheckBox{
	width: 100%;
    font-size: 3.5vw;
}
</style>
</c:if>

</head>
<body>
<br><br><br>
	<div class="afterCheckBox">
		<c:if test="${mini==0 }"><img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img"></c:if>
		<h4>비밀번호 재설정</h4>
		<br>
		<div class="inputBox">
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호">
			<span id="span-pwd"></span>
			<input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인">
			<span id="span-pwd2"></span>
			<input type="button" id="btn" onclick="changePwd()" value="확인">
			
		</div>
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
			
			/* 미니홈피에서 접근할 경우 글꼴 적용 */
			 if (${mini}==1){
				 $("body").css("font-family",'${myMini.font}');
			 }
		</script>
</body>
</html>