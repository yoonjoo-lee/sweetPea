<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<script>
	function idCheck(){
		/* alert("go"); */
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
							/* $("#disabled").addAttr("disabled"); */
							
						}else{
							alert("사용가능한  아이디 입니다.");
							$("#disabled").removeAttr("disabled");
						}	
				}
			})
		};
	}

</script>
</head>
<body>
<form method="post" action="join.do">
	<input type="text" name="id" id="id" placeholder="아이디"><input type="button" onclick="idCheck()" value="중복체크" ><br>
	<input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br>
	<input type="password" name="pwd" id="pwd" placeholder="비밀번호 확인"><br>
	
	<input type="text" name="name" id="name" placeholder="이름">
	<select>
		<option>남자</option>
		<option>여자</option>
	</select><br>
	<input type="" name="birth" placeholder="생년월일"><br>
	<input type="number" name="phone"  placeholder="연락처"><br>
	<input type="email" name="email" placeholder="이메일"><br>
	<input type="number" name="emailCertified" placeholder="인증번호 6자리 숫자 입력"><input type="button" onclick="" value="인증번호 받기" ><br>
	<input type="" name="addr" placeholder="주소"><input type="button" value="검색"><br>
	<input type="submit" value="회원가입" >
</form>

</body>
</html>