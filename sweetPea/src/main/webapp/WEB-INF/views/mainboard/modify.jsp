<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<!--  jQuery, bootstrap -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

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
		}
		#footer{
			width: 100%;
			bottom: 0;
			left: 0;
			position: absolute;
		}
</style>
</head>
<body>
<header id="header"></header>
<div id="view">




<form action="modify.do" method="post">
<table border="1">
		<tbody>
			<tr>
				<td>
					제목
				</td>
				<td>
					<input type="text" name="title" value="${vo.title }">
				</td>
			</tr>
			<tr>
				<td>
					내용
				</td>
				<td>
					<textarea id="summernote" name="content">${vo.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>
					작성자
				</td>
				<td>
					${vo.name }
				</td>
			</tr>
			<tr>
				<td>
					작성일
				</td>
				<td>
					${vo.datetime }
				</td>
			</tr>
		</tbody>
	</table>
	<button type="submit">수정</button>
	<button type="reset">취소</button>
	<input type="hidden" name="bidx" value=${vo.bidx }>
	<input type="hidden" name="category" value=${vo.category }>
	

	<!-- <button onclick="location.href='login.do'">목록</button> -->
</form>
</div>	
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
