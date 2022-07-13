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
		  inputLabel: '회원탈퇴 위해 현재 비밀번호를 입력해주세요',
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
			let sw = 0;
			if(data==0){
				await Swal.fire({
					  icon: 'error',
					  title: '실패',
					  text: '비밀번호가 일치하지 않습니다',
					  position: 'top'
					});
				window.location.reload();
			}else{
				await Swal.fire({
					  title: '정말로 탈퇴하시겠습니까?',
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '예',
					  cancelButtonText: '아니오',
					  position: 'top'
					}).then((result) => {
					   if (result.isConfirmed) {
						   sw = 1;
					  }
					  else{
						window.parent.location.href="<%=request.getContextPath()%>/user/myPage.do";  
					  }
					})
				if(sw == 1){
					await Swal.fire({
					      title: '회원탈퇴 되었습니다',
					      icon: 'success',
					      position: 'top',
					      showConfirmButton: false,
					      timer: 2000
				    });
					window.parent.location.href="<%=request.getContextPath()%>/user/delId.do?uidx="+${login.uidx};
				}
			}
		}
	});
});
</script>
</head>
<body>
</body>
</html>