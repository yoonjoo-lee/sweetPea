<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet" />

<c:if test="${device eq 'MOBILE'}">
<style>
.footer{
	min-width:100%;
}
.footer-ul>li{
	margin-right: 8vw;
}
</style>
</c:if>

</head>
<body>
	<div class="footer">
		<div class="footer-box">
	         <ul class="footer-ul">
	             <li><a class="footer-link" href="#services">Home</a></li>
	             <li><a class="footer-link" href="#portfolio">이용약관</a></li>
	             <li><a class="footer-link" href="#about">고객센터</a></li>
	             <li><a class="footer-link" href="#team">기타문의</a></li>
	         </ul>
	     </div>
	     <div class="footer-logo"></div>
	</div>
</body>
</html>