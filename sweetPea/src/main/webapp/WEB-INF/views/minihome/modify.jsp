<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
          
	});
});
</script>
</head>
<body>
수정

<form action="<%=request.getContextPath()%>/miniroomboard2/modify.do" method="post">
	<hr>
	
	<div id="title-box">
		<%-- <input id="title" name="title" placeholder="제목을 입력해 주세요" value="${title }"> --%>
		비밀글<input type="checkbox" name="secret" value="Y">
		<%-- <div class="dropdown">
		<button class="dropbtn" type="button" >
			<span class="dropbtn_icon"></span>
			<span class="dropbtn_content">카테고리1d1</span>
			<img class="dropbtn_click" src="<%=request.getContextPath()%>/resources/images/arrow-down.png" onclick="dropdown()">
		</button> --%>
	</div>
		<textarea id="summernote" name="content">${content }</textarea>
	<input type="hidden" name="mbidx" value=${mbidx }>
	<input type="hidden" name="category" value=${category }>
	<button type="submit">수정</button>
</form>


</body>
</html>