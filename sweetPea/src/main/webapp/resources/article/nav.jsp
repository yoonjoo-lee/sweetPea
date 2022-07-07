<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style type="text/css">
	.loginBox{
		display: none;
	}
	div.banner{
		background-image: url("<%=request.getContextPath()%>/resources/images/banner2.png");
		width: 100%;
		height: 10rem;
		border: 1px solid black;
		display: block;
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
	@media (min-width: 992px){
		.loginBox{
			display: inline-block;
			width: 25%;
			height: 10rem;
			border: 1px solid black;
		}
		div.banner{
			width: 72%;
			float: right;
			height: 10rem;
			display: inline-block;
		}
	}
	
	.cameleon{
		background-image: url("<%=request.getContextPath()%>/resources/images/camelon.png");
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: contain;
		margin-top: 1em;
		width: 100%;
		height: 40%;
	}
	.login-button{
		margin: 10% auto;
		border: 0;
		display: block;
		width: 75%;
		border-radius: 2em;
		font-size: 0.8em;
	}
	.logout-bottom{
		font-size: 0.2em;
		text-decoration: none;
		margin-bottom: 2em;
	}
	.logout-bottom>a:first-child {
		margin-left: 1em;
		float: left;
	}
	.logout-bottom>a:last-child {
		margin-right: 1em;
		float: right;
	}
</style>
</head>
<body>
	<div>
		<div class="loginBox">
			<div class="logout">
				<div class="cameleon"></div>
				<input type="button" class="login-button" onclick="location.href='user/login.do'" value="로그인">
				<div class="logout-bottom">
					<a>회원가입</a>
					<a>아이디/비밀번호 찾기</a>
				</div>
			</div>
		</div>
		<div class="banner"></div>
	</div>
</body>
</html>