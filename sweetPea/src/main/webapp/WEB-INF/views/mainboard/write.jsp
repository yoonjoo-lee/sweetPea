<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int category = Integer.parseInt(request.getParameter("category"));%>
<%=category%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
	<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
    <!-- include libraries(jQuery, bootstrap) -->
	<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
    <!-- tagify -->
    <script src="https://unpkg.com/@yaireo/tagify"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
	
	<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
	});
	</script>
<style>
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

/* .advance .tagify__tag{
    --tag-hover: var(--tag-bg);
} */

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
.tagify__input::before{
	position: relative;
}
.tagify__input{
	width : 42.8em;
}
</style>
</head>

<body>
<header id="header"></header>
<br>
<div id="view">


<!-- <input name='tags3' pattern='^[A-Za-z_✲ ]{1,15}$'><br> -->
<input name='basic' id="tag"><br><br>

<form action="gowrite.do" method="post">
<div id="title-box">
	<input style="ime-mode:disabled;" type="text" id="title" name="title" placeholder="제목을 입력해 주세요">
</div>

<textarea id="summernote" name="content"></textarea>
<input type="hidden" name="category" value=${category }>

<button type="submit">작성</button>
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
    
  //The DOM element you wish to replace with Tagify
    var input = document.querySelector('input[name=basic]');

    // initialize Tagify on the above input node reference
    new Tagify(input)
});


//input 태그에 엔터키 입력 후 바로 submit 막기
$('input[type="text"]').keydown(function() {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	});





</script>
</body>
</html>