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
			width: 20%;
			height: 10rem;
			border: 1px solid black;
		}
		div.banner{
			width: 77%;
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
		background-size: cover;
		margin-top: 10%;
		width: 100%;
		height: 40%;
		
	}
</style>
</head>
<body>
	<div>
		<div class="loginBox">
			<div class="logout cameleon"></div>
		</div>
		<div class="banner"></div>
	</div>
</body>
</html>