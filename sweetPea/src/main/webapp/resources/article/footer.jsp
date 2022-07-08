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
	.footer-box{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 0.2vh 0;
		 
	}
	.footer-ul{
		text-align: center;
		width: 100%;
		list-style: none;
		margin: 0.5vh 0;
	}
	.footer-ul>li{
		margin-right: 2vw;
		display: inline-block;
	}
	.footer-link{
		font-size: 0.8vw;
		text-decoration: none;
	}
	.footer-logo{
		background-image: url("<%=request.getContextPath()%>/resources/images/camelon.png");
		width: 15vw;
		height: 10vw;
		margin: 0 10vw;
		display: inline-block;
		background-repeat: no-repeat;
		background-attachment: scroll;
		background-position: center center;
		background-size: cover;
	}
</style>
</head>
<body>
	<div class="footer-box">
         <ul class="footer-ul">
             <li><a class="footer-link" href="#services">Home</a></li>
             <li><a class="footer-link" href="#portfolio">이용약관</a></li>
             <li><a class="footer-link" href="#about">고객센터</a></li>
             <li><a class="footer-link" href="#team">기타문의</a></li>
         </ul>
     </div>
     <div class="footer-logo"></div>
</body>
</html>