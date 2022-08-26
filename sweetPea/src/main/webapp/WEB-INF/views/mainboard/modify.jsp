<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:if test="${vo.category == 1}">
	<title>${vo.name } : 스위피 공지사항 수정</title>
</c:if>
<c:if test="${vo.category == 2}">
	<title>${vo.name } : 스위피 자유게시판</title>
</c:if>
<c:if test="${vo.category == 3}">
	<title>${vo.name } : 스위피 유머게시판</title>
</c:if>
<c:if test="${vo.category == 4}">
	<title>${vo.name } : 스위피 FAQ</title>
</c:if>
<c:if test="${vo.category == 5}">
	<title>${vo.name } : 스위피 Q&A</title>
</c:if>
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath()%>/resources/images/camelon.png">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<!--  jQuery, bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 

<!-- summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
	});
	
	
</script>
<style type="text/css">
#view{
	width: 60%;
	margin: 0 auto;
	margin-bottom: 15em;
}
#footer{
	width: 100%;
	bottom: 0;
	left: 0;
	position: absolute;
	
}
#title-box{ 
    width:100%; 
    display:flex; 
    justify-content: center;
}

#title{ 
    width:100%; 
    height:40px; 
    border:1px #D8D8D8 solid; 
    border-radius: 5px; 
    margin:0; 
    padding:0 10px; 
    margin-bottom:10px; 
    font-family: 'Apple SD Gothic Neo';
    font-size:14px; 
}
</style>
</head>
<body>
<header id="header"></header>
<br>
<div id="view">




<form action="modify.do" method="post">
	<div id="title-box">
		<input style="ime-mode:disabled;" id="title" type="text" name="title" value="${vo.title }">
	</div>
	
	<textarea id="summernote" name="content">${vo.content }</textarea>
	
	<button type="submit" style="float:right; margin:5px;" class="btn btn-secondary" >수정</button>&nbsp;
	<button type="reset" style="float:right; margin:5px;" class="btn btn-secondary">취소</button>&nbsp;
	<input type="hidden" name="bidx" value=${vo.bidx }>
	<input type="hidden" name="category" value=${vo.category }>
	<!-- <button onclick="location.href='login.do'">목록</button> -->
</form>
</div>	
<br>
<footer id="footer"></footer>
<script>
$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400
    });
});
</script>
</body>
</html>	
